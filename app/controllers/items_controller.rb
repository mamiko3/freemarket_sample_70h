class ItemsController < ApplicationController
  def index
    @items = Item.all
    @parents = Category.all.order("id ASC").limit(13)
  end

  def show
    @item = Item.find(params[:id])
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
    params.require(:item).permit(:name, :price,:explain,:postage,:region,:condition,:shipping,:category_id,images_attributes: [:image,:_destroy,:id]).merge(user_id: current_user.id)
  end
 
end
