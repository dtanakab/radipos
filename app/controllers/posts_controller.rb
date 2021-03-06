# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = current_user.posts.new(post_params)
    @post.subject ||= @post.corner.subject

    if @post.save
      PostMailer.create(@post).deliver_now
      redirect_to @post.corner.program, notice: "#{@post.corner.title}へメールが送信されました"
    else
      render "programs/#{@post.corner.program.id}/show"
    end
  end

  private
    def set_corner
      @corner = Corner.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:subject, :content, :corner_id, :post_mail_setting)
    end
end
