# frozen_string_literal: true

require "application_system_test_case"

class Program::MylistsTest < ApplicationSystemTestCase
  setup { login_user "user1@test.com", "testtest" }
  test "show mylists" do
    visit mylists_path
    assert_text "テスト番組1"
  end

  test "show notice" do
    visit mylists_path
    find(".star").click
    visit mylists_path
    assert_text "マイリストはまだありません"
  end
end
