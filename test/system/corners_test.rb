# frozen_string_literal: true

require "application_system_test_case"

class CornersTest < ApplicationSystemTestCase
  test "show corner" do
    visit "/programs/#{programs(:program1).id}"
    assert_text "テストコーナー1"
  end
  test "not show not alive corner" do
    visit "/programs/#{programs(:program1).id}"
    assert_no_text "テストコーナー3"
  end
end
