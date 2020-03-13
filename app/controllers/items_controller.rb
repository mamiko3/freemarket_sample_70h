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
    @item = Item.new(item_params)
    if @item.save
      redirect_to   root_path
    else
      render "new"
    end
  end

  def edit
    
  end

  def update

  end

  def destroy

  end

  def item_params
    params.require(:item).permit(:name, :price,:explain,:postage,:region,:condition,:shipping,images_attributes: [:image]).merge(user_id: current_user.id)
  end
end
