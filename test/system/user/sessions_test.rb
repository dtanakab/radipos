# frozen_string_literal: true

require "application_system_test_case"

class User::SessionsTest < ApplicationSystemTestCase
  setup { login_user "user1@test.com", "testtest" }

  test "destroy session" do
    visit root_path
    click_on "ログアウト"
    assert_text "ログアウトしました"
  end
end
