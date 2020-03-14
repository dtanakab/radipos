# frozen_string_literal: true

FactoryBot.define do
  factory :user1, class: User do
    id { 1 }
    email { "test1@example.com" }
    radio_name { "TEST1ラジオネーム" }
    gender { "男性" }
    tel { "0120-11-1111" }
    postcode { "111-1111" }
    address { "東京都港区1-1-1 港区マンション101号" }
    about_age { 4 }
    post_mail_setting { 0 }
    admin { false }
    password { "testtest" }
    encrypted_password { Devise::Encryptor.digest(User, "testtest") }
    confirmed_at { Time.now }
  end
  factory :user2, class: User do
    id { 2 }
    email { "test2@example.com" }
    radio_name { "TEST2ラジオネーム" }
    gender { "男性" }
    tel { "0120-11-1111" }
    postcode { "111-1111" }
    address { "東京都港区1-1-1 港区マンション101号" }
    about_age { 4 }
    post_mail_setting { 0 }
    admin { false }
    password { "testtest" }
    encrypted_password { Devise::Encryptor.digest(User, "testtest") }
    confirmed_at { Time.now }
  end
  factory :user3, class: User do
    id { 3 }
    email { "test3@example.com" }
    admin { false }
    password { "testtest" }
    encrypted_password { Devise::Encryptor.digest(User, "testtest") }
    confirmed_at { Time.now }
  end
  factory :user1_updated, class: User do
    radio_name { "TEST1ラジオネーム変わりました" }
    email { "update@example.com" }
    password { "updateupdate" }
    encrypted_password { Devise::Encryptor.digest(User, "updateupdate") }
  end
  factory :admin, class: User do
    id { 4 }
    email { "admin@example.com" }
    radio_name { "管理人ラジオネーム" }
    gender { "男性" }
    tel { "0120-11-1111" }
    postcode { "111-1111" }
    address { "東京都港区1-1-1 港区マンション101号" }
    about_age { 4 }
    post_mail_setting { 0 }
    admin { true }
    password { "testtest" }
    encrypted_password { Devise::Encryptor.digest(User, "testtest") }
    confirmed_at { Time.now }
  end
end
