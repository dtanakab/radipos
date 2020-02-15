# frozen_string_literal: true

class Admin::UsersController < AdminController
  def index
    @users = User.all
    @posts = []
    @users.each do |user|
      @posts << user.posts if user.posts
    end
  end
end
