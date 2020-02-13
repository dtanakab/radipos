# frozen_string_literal: true

class Admin::CornersController < AdminController
  before_action :set_corner, only: [:edit, :show, :update, :destroy]

  def new
    @program = Program.find(params[:program_id])
    @corner = @program.corners.new
  end

  def show
  end

  def edit
    @program = @corner.program
  end

  def create
    @corner = Corner.new(corner_params)

    if @corner.save
      @programs = Program.where(title: @corner.program.title)
      if @programs.size > 1
        @programs.each do |program|
          program.corners.new(corner_params)
          program.save
        end
      end
      redirect_to admin_program_path(@corner.program), notice: "新しいコーナーが追加されました"
    else
      render :new
    end
  end

  def update
    if @corner.update(corner_params)
      redirect_to admin_program_path(@corner.program), notice: "コーナーが更新されました"
    else
      render :edit
    end
  end

  def destroy
    if @corner.destroy
      redirect_to admin_program_path(@corner.program), notice: "コーナーが削除されました"
    end
  end

  private
    def set_corner
      @corner = Corner.find(params[:id])
    end

    def corner_params
      params.require(:corner).permit(:title, :subject, :introduction, :alive_flag, :program_id, :unpostable_reason)
    end
end
