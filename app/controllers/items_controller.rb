class ItemsController < ApplicationController
  def index
    @items = Item.includes(:images).order("created_at DESC").limit(3)
    @parents = Category.all.order("id ASC").limit(13)
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @item.images.new
    @prefectures=Prefecture.all

    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def category_children  
    @category_children = Category.find_by(name: "#{params[:parent_name]}").children 
  end
  # Ajax通信で送られてきたデータをparamsで受け取り､childrenで子を取得

  def category_grandchildren
    @category_grandchildren = Category.find(name: "#{params[:child_id]}").children
  end
  # Ajax通信で送られてきたデータをparamsで受け取り､childrenで孫を取得｡（実際には子カテゴリーの子になる｡childrenは子を取得するメソッド)



  def create
    @prefectures=Prefecture.all
    @item = Item.new(item_params) # 出品完了画面を表示させるのでTOPへのリダイレクトはコメントアウトします
    @item.save
    
  end

  def edit    
  end

  def update
  end

  def destroy
  end

  
  private

  def item_params
    params.require(:item).permit(:name, :price,:explain,:postage,:region,:condition,:shipping,images_attributes: [:image,:_destroy,:id]).merge(user_id: current_user.id)
  end
 
end
