# frozen_string_literal: true

class Program < ApplicationRecord
  has_many :corners, dependent: :destroy

  def airtime
    airtime_start = [ starts_at.strftime("%k").to_i, starts_at.strftime("%M")]
    airtime_end = [ ends_at.strftime("%k").to_i, ends_at.strftime("%M")]
    [airtime_start, airtime_end].each do |time|
      if 0 <= time[0] && time[0] <= 5
        time[0] += 24
      end
    end
    airtime_start[0].to_s + "時" + airtime_start[1] + "分" + "〜" +
    airtime_end[0].to_s + "時" + airtime_end[1] + "分"
  end
  def self.search(word)
    Program.ransack(title_cont: word).result
  end
end
