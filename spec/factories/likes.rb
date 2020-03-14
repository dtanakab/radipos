# frozen_string_literal: true

FactoryBot.define do
  factory :like1, class: Like do
    id { 1 }
    user_id { 1 }
    program_id { 1 }
  end
  factory :like2, class: Like do
    id { 2 }
    user_id { 1 }
    program_id { 2 }
  end
end
