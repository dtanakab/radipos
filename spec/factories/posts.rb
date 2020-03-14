# frozen_string_literal: true

FactoryBot.define do
  factory :post1, class: Post do
    id { 1 }
    subject { "テストコーナー1の件名オリジナル" }
    content { "テストコーナー1への送信内容" }
    post_mail_setting { 1 }
    user_id { 1 }
    corner_id { 1 }
  end
  factory :post2, class: Post do
    id { 2 }
    subject { "テストコーナー2の件名オリジナル" }
    content { "テストコーナー2への送信内容" }
    post_mail_setting { 2 }
    user_id { 1 }
    corner_id { 2 }
  end
  factory :post3, class: Post do
    id { 3 }
    subject { "テストコーナー3の件名オリジナル" }
    content { "テストコーナー3への送信内容" }
    post_mail_setting { 1 }
    user_id { 1 }
    corner_id { 3 }
  end
  factory :post4, class: Post do
    id { 4 }
    subject { "テストコーナー4の件名オリジナル" }
    content { "テストコーナー4への送信内容" }
    post_mail_setting { 2 }
    user_id { 1 }
    corner_id { 4 }
  end
  factory :post5, class: Post do
    id { 5 }
    subject { "テストコーナー5の件名オリジナル" }
    content { "テストコーナー5への送信内容" }
    post_mail_setting { 1 }
    user_id { 1 }
    corner_id { 5 }
  end
end
