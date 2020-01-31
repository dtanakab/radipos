# frozen_string_literal: true

class Program < ApplicationRecord
  has_many :corners, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :image

  def wday_str
    ["日曜", "月曜", "火曜", "水曜", "木曜", "金曜", "土曜"][wday] + "日"
  end

  def airtime
    starts_at.strftime("%H:%M") + "-" + ends_at.strftime("%H:%M")
  end
  def self.search(word)
    Program.ransack(title_or_cast_cont: word).result
  end
end
