class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update,:show]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_item_owner, only: [:edit, :update]
 

  def index
    @items = Item.all.includes(:user).order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def show
    @user = @item.user
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private

  def item_params
    params.require(:item).permit(:image,:name,:feature,:category_id,:status_id,:shipping_free_id,:address_id,:shipping_day_id,:price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def check_item_owner
    unless current_user == @item.user
      redirect_to root_path
    end
  end

end
