# frozen_string_literal: true

require "application_system_test_case"

class Admin::ProgramsTest < ApplicationSystemTestCase
  setup { login_user "user3@test.com", "testtest" }

  test "show program list" do
    visit user_path(users(:user3))
    click_on "管理者用番組一覧ページ"
    assert_text "テスト番組1"
    assert_no_text "テスト番組2"
  end

  test "show program detail" do
    visit admin_programs_path
    click_on "テスト番組1"
    assert_text "テスト番組1"
  end
end
