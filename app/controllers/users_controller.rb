class UsersController < ApplicationController
  def new

  end
  
  def create
     @item = Item.new(item_params)
      if @item.save
        redirect_to items_show_path
      else
        render :edit
      end
  end

  def edit
    @items = Item.includes(:images).order('created_at DESC')

  end

  def update
  if @user.update(user_params)
    redirect_to root_path
  else
    edit
  end
  end

  def destroy
  end


  private
  def item_params
    params.require(:item).permit(:name,:price,:explain,:region,:condition,:shipping,:size_id,:category_id,:user_id,:brand_id, images_attributes: [:image])
  end
  def user_params
    params.require(:product).permit(:name, :price, images_attributes:  [:image, :_destroy, :id])
  end
end