# frozen_string_literal: true

class ProgramsController < ApplicationController
  before_action :set_program, only: [:show]

  def index
    corner_attached_programs = Program.all.select { |program| program.corners.count >= 2 }
    @programs = Kaminari.paginate_array(corner_attached_programs).page(params[:page])
  end

  def show
    @corners = @program.corners
  end

  private
    def set_program
      @program = Program.find(params[:id])
    end

    def program_params
      params.require(:program).permit(:title, :memo, :email, :cast, :station, :starts_at, :ends_at, :hp, :image, :on_air_wday_id)
    end
end
