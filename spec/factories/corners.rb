# frozen_string_literal: true

FactoryBot.define do
  factory :corner1, class: Corner do
    id { 1 }
    title { "テストコーナー1" }
    subject { "テストコーナー1の件名" }
    introduction { "テストコーナー1の説明" }
    alive { 1 }
    program_id { 1 }
  end
  factory :corner2, class: Corner do
    id { 2 }
    title { "テストコーナー2" }
    subject { "テストコーナー2の件名" }
    introduction { "テストコーナー2の説明" }
    alive { 1 }
    program_id { 1 }
  end
  factory :corner3, class: Corner do
    id { 3 }
    title { "テストコーナー3" }
    subject { "テストコーナー3の件名" }
    introduction { "テストコーナー3の説明" }
    alive { 1 }
    program_id { 2 }
  end
  factory :corner4, class: Corner do
    id { 4 }
    title { "テストコーナー4" }
    subject { "テストコーナー4の件名" }
    introduction { "テストコーナー4の説明" }
    alive { 1 }
    program_id { 2 }
  end
  factory :corner5, class: Corner do
    id { 5 }
    title { "テストコーナー5" }
    subject { "テストコーナー5の件名" }
    introduction { "テストコーナー5の説明" }
    alive { 1 }
    program_id { 3 }
  end
  factory :corner6, class: Corner do
    id { 6 }
    title { "テストコーナー6" }
    subject { "テストコーナー6の件名" }
    introduction { "テストコーナー6の説明" }
    alive { 1 }
    program_id { 3 }
  end
  factory :corner7, class: Corner do
    id { 7 }
    title { "テストコーナー7" }
    subject { "テストコーナー7の件名" }
    introduction { "テストコーナー7の説明" }
    alive { 1 }
    program_id { 1 }
  end
end
