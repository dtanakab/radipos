# frozen_string_literal: true

class Api::LikesController < ApplicationController
  def index
    render json: Like.filter_by_program(params[:program_id]).select(:id, :user_id, :program_id)
  end

  def create
    current_user.likes.create!(likes_params)
    head :created
  end

  def destroy
    current_user.likes.find(params[:id]).destroy!
    head :ok
  end

  private
    def likes_params
      params.require(:like).permit(:program_id)
    end
end
