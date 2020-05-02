class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
  end

  def sign_out
    user = User.find(params[:id])
    @nickname = user.nickname
  end
end
