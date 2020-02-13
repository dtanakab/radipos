# frozen_string_literal: true

class Program < ApplicationRecord
  has_many :corners
  has_many :likes, dependent: :destroy
  has_one_attached :image
  belongs_to :on_air_wday

  def set_regular_corner
    regular_corner = self.corners.new(
      { title: "ふつおた（普通のお便り）/テーマメール/リアクションメール",
        subject: "ふつおた/テーマメール/リアクションメール",
        introduction: "XXXXさん、こんばんは！ 今日のテーマは、「明日絶対にやりたいこと」ですが、〜は絶対にやりたいと思っています！ XXXXさんは、〜をどうしていますか？",
        alive_flag: 1,
        unpostable_reason: nil
      }
    )
    regular_corner.save
  end

  def airtime
    starts_at.strftime("%H:%M") + "-" + ends_at.strftime("%H:%M")
  end

  def self.search(word)
    Program.ransack(title_or_cast_cont: word).result
  end
end
