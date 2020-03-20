class ItemsController < ApplicationController

  before_action :set_items, only: [:show,:edit,:update,:destroy]
  def index
    @items = Item.includes(:images).order("created_at DESC").limit(3)
    @parents = Category.all.order("id ASC").limit(13)
  end

  def show
    @parents = Category.where(ancestry:nil)
  end

  def new
    @item = Item.new
    @item.images.new
    @prefectures=Prefecture.all
    #セレクトボックスの初期値設定
    @category_parent_array = ["選択してください"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end


  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end


  def create
    @prefectures=Prefecture.all

    @item = Item.new(item_params)
    @item.save
    # if 
    #    redirect_to   root_path
    # else
    #    render "new"
    # end
  end

  def edit
    @image = @item.images
    @prefectures=Prefecture.all
    @items = Category.where(ancestry:nil)
    @category_parent_array = ["選択してください"]
    @category_children_array = ["選択してください"]
    @category_grandchildren_array = ["選択してください"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
      @category_children_array << parent.name
      @category_grandchildren_array << parent.name
      @parents = Category.all.order("id ASC").limit(13)
    end
#     # @parents = Category.all.order("id ASC").limit(13)
#     @selected_grandchild_category = @item.category.name
#     @category_grandchildren_array = [{id: "---", name: "---"}]
#     Category.find("#{@selected_grandchild_category.name}").siblings.each do |grandchild|
#       grandchildren_hash = {id: "#{grandchild.id}", name: "#{grandchild.name}"}
#       @category_grandchildren_array << grandchildren_hash
#   end
#   @selected_child_category = @selected_grandchild_category.parent

#   @category_children_array = [{id: "---", name: "---"}]
#     Category.find("#{@selected_child_category.id}").siblings.each do |child|
#       children_hash = {id: "#{child.id}", name: "#{child.name}"}
#       @category_children_array << children_hash
#   end
#   @selected_parent_category = @selected_child_category.parent

#   @category_parents_array = [{id: "---", name: "---"}]
#   Category.find("#{@selected_parent_category.id}").siblings.each do |parent|
#       parent_hash = {id: "#{parent.id}", name: "#{parent.name}"}
#       @category_parents_array << parent_hash
# end
end

  def update
    @image = @item.images
    @item.user_id == current_user.id
    if @item.update(item_params)
      redirect_to items_path
    else
      render 'edit'
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :price,:explain,:postage,:region,:condition,:shipping,:category_id,images_attributes: [:image,:_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_items
    @item = Item.find(params[:id])
  end

end
