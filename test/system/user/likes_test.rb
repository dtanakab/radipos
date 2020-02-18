# frozen_string_literal: true

require "application_system_test_case"

class User::LikesTest < ApplicationSystemTestCase
  setup { login_user "user1@test.com", "testtest" }

  test "show like lists" do
    visit "/users/#{users(:user1).id}"
    within all(".profile_tab")[1] do
      click_link
    end
    assert_text "マイリスト"
    assert_text "テスト番組1"
  end
end
