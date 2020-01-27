# frozen_string_literal: true

class PostsController < ApplicationController
  def create
    @post = current_user.posts.new(post_params)
    if @post.subject.nil?
      @post.subject = @post.corner.subject
    end

    if @post.save
      PostMailer.creation_email(@post).deliver_now
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
      params.require(:post).permit(:content, :corner_id)
    end
end
