# frozen_string_literal: true

class CornersController < ApplicationController
  before_action :set_corner, only: [:edit, :show, :update, :destroy]
  before_action :set_program, only: [:new, :create]

  def new
    @corner = @program.corners.new
  end

  def show
  end

  def edit
  end

  def create
    @corner = @program.corners.new(corner_params)

    if @corner.save
      redirect_to @program, notice: "新しいコーナーが追加されました"
    else
      render :new
    end
  end

  def update
    if @corner.update(corner_params)
      redirect_to @corner, notice: "コーナーが更新されました"
    else
      render :edit
    end
  end

  def destroy
    if @corner.destroy
      redirect_to corners_path, notice: "コーナーが削除されました"
    end
  end

  private
    def set_corner
      @corner = Corner.find(params[:id])
    end

    def set_program
      @program = Program.find(params[:program_id])
    end

    def corner_params
      params.require(:corner).permit(:title, :subject, :introduction, :alive_flag)
    end
end
