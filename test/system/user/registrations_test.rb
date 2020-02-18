# frozen_string_literal: true

require "application_system_test_case"

class User::RegistrationsTest < ApplicationSystemTestCase
  setup { login_user "user2@test.com", "testtest" }

  test "destroy account" do
    visit root_path
    click_on "マイページ"
    click_on "退会する"
    page.driver.browser.switch_to.alert.accept
    assert_text "アカウントを削除しました。またのご利用をお待ちしております。"
  end
end
