# frozen_string_literal: true

class ProgramsController < ApplicationController
  before_action :set_program, only: [:show, :edit, :update, :destroy]

  def index
    image_attached_programs = Program.all.select { |program| program.image.attached? }
    @programs = Kaminari.paginate_array(image_attached_programs).page(params[:page])
  end

  def show
    @corners = @program.corners
  end

  def new
    @program = Program.new
  end

  def edit
  end

  def create
    @program = Program.new(program_params)

    if @program.save
      redirect_to @program, notice: "Program was successfully created."
    else
      render :new
    end
  end

  def update
    if @program.update(program_params)
      redirect_to @program, notice: "Program was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    if @program.destroy
      redirect_to programs_url, notice: "Program was successfully destroyed."
    end
  end

  private
    def set_program
      @program = Program.find(params[:id])
    end

    def program_params
      params.require(:program).permit(:title, :memo, :email, :cast, :wday, :station, :starts_at, :ends_at, :hp, :image)
    end
end
