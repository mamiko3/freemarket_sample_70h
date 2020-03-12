class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @nickname = current_user.nickname
    @last_name = current_user.last_name 
    @first_name = current_user.first_name
  end
end
