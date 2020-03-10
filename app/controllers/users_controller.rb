class UsersController < ApplicationController

  def edit
  
  end

  def update

  end

  def destroy
  end


  private
  def item_params
    params.require(:item).permit(:name,:price,:explain,:region,:condition,:shipping,:size_id,:category_id,:user_id,:brand_id)
  end
end