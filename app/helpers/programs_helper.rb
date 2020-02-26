# frozen_string_literal: true

module ProgramsHelper
  def wdays
    { 日曜: "0", 月曜: "1", 火曜: "2", 水曜: "3", 木曜: "4", 金曜: "5", 土曜: "6" }
  end
  def timeframes
    { "朝(05:00-9:59)": 2, "昼(10:00-14:59)": 3, "夕(15:00-19:59)": 4, "夜(20:00-23:59)": 5, "深夜(00:00-04:59)": 1 }
  end
  def wday_str(num)
    wdays.keys[num.to_i].to_s
  end
  def timeframe_str(num)
    if num == "1"
      "深夜(00:00-04:59)"
    else
      timeframes.keys[num.to_i - 2].to_s
    end
  end
  def today_wday
    Date.today.wday.to_s
  end
  def now_timeframe
    ((Time.new.strftime("%k").to_i / 5) + 1).to_s
  end
  def omit_words(item, count)
    if item.nil?
      ""
    elsif item.length >= count
      item[0, count - 1] + "..."
    else
      item
    end
  end
end
