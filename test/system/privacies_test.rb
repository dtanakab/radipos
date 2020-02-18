# frozen_string_literal: true

require "application_system_test_case"

class PrivaciesTest < ApplicationSystemTestCase
  test "show privacy policy" do
    visit root_path
    click_on "プライバシーポリシー"
    assert_text "1 プライバシーポリシーの適用範囲"
  end
end
