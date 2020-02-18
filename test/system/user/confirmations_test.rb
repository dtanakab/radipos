# frozen_string_literal: true

require "application_system_test_case"

class User::ConfirmationsTest < ApplicationSystemTestCase
  test "sign up and show confirmation" do
    visit root_path
    click_on "会員登録"
    fill_in("user[email]", with: "email@gmail.com")
    fill_in("user[password]", with: "testtest")
    fill_in("user[password_confirmation]", with: "testtest")
    click_on "アカウントを作成"
    assert_text "メールアドレス受信確認用のメールを送信しました。"
  end
end
