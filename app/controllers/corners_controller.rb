# frozen_string_literal: true

class CornersController < ApplicationController
  before_action :set_corner, only: [:edit, :show, :update, :destroy]

  def show
  end

  private
    def set_corner
      @corner = Corner.find(params[:id])
    end

    def corner_params
      params.require(:corner).permit(:title, :subject, :introduction, :alive, :program_id)
    end
end
