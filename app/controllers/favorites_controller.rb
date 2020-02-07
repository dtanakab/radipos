# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :set_program, only: [:create, :destroy]

  def create
    @favorite = current_user.favorites.new(favorite_params)
    @favorite.save
  end

  def destroy
    @favorite = current_user.favorites.find_by(program_id: @program.id)
    @favorite.destroy
  end

  private
    def set_program
      @program = Program.find(favorite_params[:program_id])
    end
    def favorite_params
      params.require(:favorite).permit(:program_id)
    end
end
