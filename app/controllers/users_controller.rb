class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
  end
end
