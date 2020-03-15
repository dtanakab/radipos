# frozen_string_literal: true

FactoryBot.define do
  factory :corner1, class: Corner do
    title { "テストコーナー1" }
    subject { "テストコーナー1の件名" }
    introduction { "テストコーナー1の説明" }
    alive { true }
    after(:create) do |corner|
      corner.posts << FactoryBot.create(:post1, corner: corner)
    end
  end
  factory :corner2, class: Corner do
    title { "テストコーナー2" }
    subject { "テストコーナー2の件名" }
    introduction { "テストコーナー2の説明" }
    alive { true }
    after(:create) do |corner|
      corner.posts << FactoryBot.create(:post2, corner: corner)
    end
  end
  factory :corner3, class: Corner do
    title { "テストコーナー3" }
    subject { "テストコーナー3の件名" }
    introduction { "テストコーナー3の説明" }
    alive { true }
    after(:create) do |corner|
      corner.posts << FactoryBot.create(:post3, corner: corner)
    end
  end
  factory :corner4, class: Corner do
    title { "テストコーナー4" }
    subject { "テストコーナー4の件名" }
    introduction { "テストコーナー4の説明" }
    alive { true }
    after(:create) do |corner|
      corner.posts << FactoryBot.create(:post4, corner: corner)
    end
  end
  factory :corner5, class: Corner do
    title { "テストコーナー5" }
    subject { "テストコーナー5の件名" }
    introduction { "テストコーナー5の説明" }
    alive { true }
    after(:create) do |corner|
      corner.posts << FactoryBot.create(:post5, corner: corner)
    end
  end
  factory :corner6, class: Corner do
    title { "テストコーナー6" }
    subject { "テストコーナー6の件名" }
    introduction { "テストコーナー6の説明" }
    alive { true }
  end
  factory :corner7, class: Corner do
    title { "テストコーナー7" }
    subject { "テストコーナー7の件名" }
    introduction { "テストコーナー7の説明" }
    alive { true }
  end
end
