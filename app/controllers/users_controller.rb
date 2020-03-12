class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @nickname = current_user.nickname
    @name1 = current_user.last_name 
    @name2 = current_user.first_name
  end
end
