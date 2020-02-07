# frozen_string_literal: true

class Programs::TimetablesController < ApplicationController
  def index
    @programs = Program.select do |program|
      program.on_air_wday.code.include?(params[:wday]) &&
      program.timeframe == params[:timeframe].to_i
    end
    @programs.sort_by! { |program| program.starts_at.strftime("%H:%M") }
  end
end
