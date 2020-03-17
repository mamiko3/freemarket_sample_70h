class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @item.images.new
    @prefectures=Prefecture.all
  end

  def create
    @prefectures=Prefecture.all
    @item = Item.new(item_params)


    if @item.save
       redirect_to   root_path
     else
       render "new"
     end

  end

  def edit

    @item = Item.find(params[:id])
    @image = @item.images
    @prefectures=Prefecture.all

  end

  def update
    @item = Item.find(params[:id])
    if @item.user_id == current_user.id
      @item.update(item_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end

  def item_params
    params.require(:item).permit(:name, :price,:explain,:postage,:region,:condition,:shipping,images_attributes: [:image,:_destroy,:id]).merge(user_id: current_user.id)
  end
 
end
