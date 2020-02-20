# frozen_string_literal: true

class Admin::Programs::TimetablesController < AdminController
  include ProgramsHelper

  before_action :timetable_params

  def index
    @programs = Program.select do |program|
      program.on_timetable?(@wday, @timeframe)
    end
    @programs.sort_by! { |program| program.starts_at.strftime("%H:%M") }
  end

  private
    def timetable_params
      @wday ||= params[:wday] || today_wday.to_s
      @timeframe ||= params[:timeframe].to_i || now_timeframe
    end
end
