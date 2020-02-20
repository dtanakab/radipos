# frozen_string_literal: true

class Admin::UsersController < AdminController
  def index
    @users = User.all
    @posts = Post.all
  end
end
