# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :set_program, only: [:create, :destroy]

  def create
    @favorite = current_user.favorites.new(favorite_params)

    if @favorite.save
      redirect_to root_path, notice: "#{@program.title}がお気に入りに追加されました"
    else
    end
  end

  def destroy
    @favorite = current_user.favorites.find_by(program_id: @program.id)
    if @favorite.destroy
      redirect_to root_path, notice: "#{@program.title}がお気に入りから削除されました"
    end
  end

  private
    def set_program
      @program = Program.find(favorite_params[:program_id])
    end
    def favorite_params
      params.require(:favorite).permit(:program_id)
    end
end
