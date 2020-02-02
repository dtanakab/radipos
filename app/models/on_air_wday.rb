# frozen_string_literal: true

class OnAirWday < ApplicationRecord
  has_many :programs
  # code 0..6 = 日曜..土曜
end
