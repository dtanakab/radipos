# frozen_string_literal: true

class Admin::ProgramsController < AdminController
  before_action :set_program, only: [:show, :edit, :update, :destroy]

  def index
    @programs = Kaminari.paginate_array(Program.corner_attached_list).page(params[:page])
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
      redirect_to admin_program_path(@program), notice: "新しく番組#{@program.title}が追加されました"
    else
      render :new
    end
  end

  def update
    if @program.update(program_params)
      redirect_to admin_program_path(@program), notice: "番組#{@program.title}が更新されました"
    else
      render :edit
    end
  end

  def destroy
    if @program.destroy
      redirect_to admin_programs_path, notice: "番組が削除されました"
    end
  end

  private
    def set_program
      @program = Program.find(params[:id])
    end

    def program_params
      params.require(:program).permit(:title, :memo, :email, :cast, :station, :starts_at, :ends_at, :hp, :image, :on_air_wday_id, :timeframe)
    end
end
