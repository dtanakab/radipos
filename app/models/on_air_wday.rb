# frozen_string_literal: true

class OnAirWday < ApplicationRecord
  has_many :programs
  # code 0..6 = 日曜..土曜, 例) 月-金曜 12345
end
