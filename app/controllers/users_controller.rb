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

  end

  def destroy
  end


  private
  def item_params
    params.require(:item).permit(:name,:price,:explain,:region,:condition,:shipping,:size_id,:category_id,:user_id,:brand_id, images_attributes: [:image])
  end
end