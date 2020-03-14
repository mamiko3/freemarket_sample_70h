class ItemsController < ApplicationController
#  before_action :set_item,except: [:new,:create,:destroy]
  def index
    @items = Item.all
  end

  def show
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
      redirect_to    root_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @item= Item.new
    @item.destroy
    # redirect_to   new_item_path
  end


  def item_params
    params.require(:item).permit(:name, :price,:explain,:postage,:region,:condition,:shipping,images_attributes: [:image,:_destroy,:id])
  end
  # def set_item
  #   @item = Item.find(params[:id])
  # end
end
