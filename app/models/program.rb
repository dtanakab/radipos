# frozen_string_literal: true

class Program < ApplicationRecord
  has_many :corners
  has_many :likes, dependent: :destroy
  has_one_attached :image
  belongs_to :on_air_wday

  def airtime
    starts_at.strftime("%H:%M") + "-" + ends_at.strftime("%H:%M")
  end

  def self.search(word)
    Program.ransack(title_or_cast_cont: word).result
  end

  def on_timetable?(target_wday, target_timeframe)
    on_air_wday.code.include?(target_wday) && timeframe == target_timeframe
  end

  def self.corner_attached_list
    Program.all.select { |program| program.corners.count >= 2 }
  end
end
