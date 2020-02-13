# frozen_string_literal: true

class Admin::ProgramsController < AdminController
  before_action :set_program, only: [:show, :edit, :update, :destroy]

  def index
    corner_attached_programs = Program.all.select { |program| program.corners.count >= 2 }
    @programs = Kaminari.paginate_array(corner_attached_programs).page(params[:page])
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
      @program.set_regular_corner
      redirect_to admin_program_path(@program), notice: "Program was successfully created."
    else
      render :new
    end
  end

  def update
    if @program.update(program_params)
      redirect_to admin_program_path(@program), notice: "Program was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    if @program.destroy
      redirect_to admin_programs_path, notice: "Program was successfully destroyed."
    end
  end

  private
    def set_program
      @program = Program.find(params[:id])
    end

    def program_params
      params.require(:program).permit(:title, :memo, :email, :cast, :station, :starts_at, :ends_at, :hp, :image, :on_air_wday_id)
    end
end
