# frozen_string_literal: true

require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup { login_user "user1@test.com", "testtest" }

  test "create post" do
    visit "/programs/#{programs(:program1).id}"
    assert_difference("Post.count", 1) do
      within first(".corner_form_box") do
        fill_in("post[subject]", with: posts(:post1).subject)
        fill_in("post[content]", with: posts(:post1).content)
        select "ラジオネームのみ"
        click_on "送信する", visible: false
      end
      assert_text "テストコーナー1へメールが送信されました"
    end
  end
end
