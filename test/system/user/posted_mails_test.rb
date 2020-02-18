# frozen_string_literal: true

require "application_system_test_case"

class User::PostedMailsTest < ApplicationSystemTestCase
  setup { login_user "user1@test.com", "testtest" }

  test "show posted mail lists" do
    visit "/users/#{users(:user1).id}"
    within all(".profile_tab")[2] do
      click_link
    end
    assert_text "投稿したメール"
    assert_text "初メール1をお送りします"
  end
end
