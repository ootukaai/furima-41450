class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_params, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @history_prefecture = HistoryPrefecture.new

    if@item.history.present? && current_user.id != @item.user_id
      redirect_to root_path
    end

    if current_user.id == @item.user_id
      redirect_to root_path
    end
    
  end

  def create
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
    params.require(:history_prefecture).permit(:first_address_id,:second_address, :third_address, :forth_address, :tel_num, :post_num).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
  Payjp::Charge.create(
   amount: @item.price,  # 商品の値段
   card: prefecture_params[:token],    # カードトークン
   currency: 'jpy'                 # 通貨の種類（日本円）
  )
  end

  def item_params
    @item = Item.find(params[:item_id])
  end
end
 