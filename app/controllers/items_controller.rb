class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
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
    @itemss = Item.find(params[:id])
    @prefectures=Prefecture.all
 

  end

  def update
  @itemss = Item.find(params[:id])
  if params[:item].keys.include?("image") || params[:item].keys.include?("images_attributes")
    if @item.valid?
      if params[:item].keys.include?("image")
        update_images_ids = params[:item][:image].values
        before_images_ids = @item.images.ids
        before_images_ids.each do|before_img_id|
          Image.find(before_img_id).destroy unless update_image_ids.include?("#{before_img_id}") 
        end
      else
        before_images_ids.each do |before_img_id|
          Image.find(before_img_id).destroy 
        end
      end
      @item.update(item_params)
      redirect_to item_show_path(@item),notice: " 商品を更新しました"
    else
      render 'edit'
    end
  else
    redirect_back(fallback_location: root_path,flash: {success: '画像がありません'})
  end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    else
      redirect_to edit_item(item)
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price,:explain,:postage,:region,:condition,:shipping,images_attributes: [:image,:_destroy, :id]).merge(user_id: current_user.id)
  end
end
