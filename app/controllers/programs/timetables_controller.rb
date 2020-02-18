# frozen_string_literal: true

class Programs::TimetablesController < ApplicationController
  before_action :timetable_params

  def index
    @programs = Program.select do |program|
      program.on_air_wday.code.include?(@wday) &&
      program.timeframe == @timeframe
    end
    @programs.sort_by! { |program| program.starts_at.strftime("%H:%M") }
  end

  private
    def timetable_params
      if params[:wday] && params[:timeframe]
        @wday = params[:wday]
        @timeframe = params[:timeframe].to_i
      else
        @wday = Date.today.wday.to_s
        @timeframe = (Time.new.strftime("%k").to_i / 5) + 1
      end
    end
end
