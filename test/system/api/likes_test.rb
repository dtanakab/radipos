# frozen_string_literal: true

require "application_system_test_case"

class Api::LikesTest < ApplicationSystemTestCase
  setup { login_user "user1@test.com", "testtest" }

  test "get like lists" do
    visit "/api/likes"
    assert_text "\"program_id\":#{programs(:program1).id}"
  end

  test "destroy and create like" do
    visit root_path
    assert_difference("Like.count", -1) do
      find(".star").click
      sleep(3)
    end
    assert_text "マイリストに追加"
    assert_difference("Like.count", 1) do
      find(".star").click
      sleep(3)
    end
    assert_text "マイリストから削除"
  end
end
