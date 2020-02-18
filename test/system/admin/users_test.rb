# frozen_string_literal: true

require "application_system_test_case"

class Admin::UsersTest < ApplicationSystemTestCase
  setup { login_user "user3@test.com", "testtest" }

  test "show user list" do
    visit user_path(users(:user3))
    click_on "管理者用ユーザ一覧ページ"
    assert_text "ユーザー一覧"
  end
end
