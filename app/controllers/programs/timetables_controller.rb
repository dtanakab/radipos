# frozen_string_literal: true

class Programs::TimetablesController < ApplicationController
  def index
    @wdays = { 月曜: "1", 火曜: "2", 水曜: "3", 木曜: "4", 金曜: "5", 土曜: "6", 日曜: "0" }
    @timeframes = { "朝(05:00-9:59)": 2, "昼(10:00-14:59)": 3, "夕(15:00-19:59)": 4, "夜(20:00-23:59)": 5, "深夜(00:00-04:59)": 1 }
    @programs = Program.select do |program|
      program.on_air_wday.code.include?(params[:wday]) &&
      program.timeframe == params[:timeframe].to_i
    end
    @programs.sort_by! { |program| program.starts_at.strftime("%H:%M") }
  end
end
