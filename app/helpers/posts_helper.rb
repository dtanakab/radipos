# frozen_string_literal: true

module PostsHelper
  def datetime_format(datetime)
    wdays = ["月", "火", "水", "木", "金", "土", "日"]
    datetime.strftime("%-m月%-d日(").to_s +
    wdays[datetime.strftime("%u").to_i - 1].to_s +
    datetime.strftime(") %-H:%-M").to_s
  end
end
