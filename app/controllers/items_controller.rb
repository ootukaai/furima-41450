class ItemsController < ApplicationController
  def index
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,:feature,:category_id,:status_id,:shipping_free_id,:address_id,:shipping_day_id,:price).merge(user_id: current_user.id)
  end


end
