# frozen_string_literal: true

class Users::PostedMailsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posted_mails = current_user.posts.order(created_at: "DESC")
  end
end
