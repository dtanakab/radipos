# frozen_string_literal: true

require "application_system_test_case"

class Admin::UsersTest < ApplicationSystemTestCase
  setup { login_user "user1@test.com", "testtest" }

  test "show profile" do
    visit root_path
    click_on "マイページ"
    assert_text "user1@test.com"
  end

  test "update profile" do
    visit "/users/#{users(:user1).id}"
    click_on "ラジオメール設定/プロフィール情報を編集"
    select "住所/本名を含むアカウント情報全て"
    select "30代前半"
    click_on "設定・変更する"
    assert_text "ラジオメールの設定が更新されました"
    assert_text "ラジオネーム→ユーザーテスト1(30代前半男性)"
  end
end
