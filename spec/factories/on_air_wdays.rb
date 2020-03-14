# frozen_string_literal: true

FactoryBot.define do
  factory :monday, class: OnAirWday do
    id { 1 }
    display_str { "毎週月曜" }
    code { "1" }
  end
  factory :tuesday, class: OnAirWday do
    id { 2 }
    display_str { "毎週火曜" }
    code { "2" }
  end
end
