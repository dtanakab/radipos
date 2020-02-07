# frozen_string_literal: true

module ProgramsHelper
  def wdays
    { 月曜: "1", 火曜: "2", 水曜: "3", 木曜: "4", 金曜: "5", 土曜: "6", 日曜: "0" }
  end
  def timeframes
    { "朝(05:00-9:59)": 2, "昼(10:00-14:59)": 3, "夕(15:00-19:59)": 4, "夜(20:00-23:59)": 5, "深夜(00:00-04:59)": 1 }
  end
  def today_wday
    Date.today.wday
  end
  def now_timeframe
    (Time.new.strftime("%k").to_i / 5) + 1
  end
  
  def omit_words(item, count)
    if item.nil?
      ""
    elsif item.length >= count
      item[0, count-1] + "..."
    else
      item
    end
  end
end
