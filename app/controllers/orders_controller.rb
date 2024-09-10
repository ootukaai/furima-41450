class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @history_prefecture = HistoryPrefecture.new

    if@item.history.present? && current_user.id != @item.user_id
      redirect_to root_path
    end

    if current_user.id == @item.user_id
      redirect_to root_path
    end
    
  end

  def create
    @item = Item.find(params[:item_id])
    @history_prefecture = HistoryPrefecture.new(prefecture_params)
    if @history_prefecture.valid?
      pay_item
       @history_prefecture.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end
  
private

 

  def prefecture_params
    params.require(:history_prefecture).permit(:first_address_id,:second_address, :third_address, :forth_address, :building_name, :tel_num, :post_num).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
  Payjp::Charge.create(
   amount: @item.price,  # 商品の値段
   card: prefecture_params[:token],    # カードトークン
   currency: 'jpy'                 # 通貨の種類（日本円）
  )
  end
end
 