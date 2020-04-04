# frozen_string_literal: true

FactoryBot.define do
  factory :like1, class: Like do
    user_id { 9999 }
  end
  factory :like2, class: Like do
    user_id { 9999 }
  end
end
