# frozen_string_literal: true

require "application_system_test_case"

class PrivaciesTest < ApplicationSystemTestCase
  test "show privacy policy" do
    visit privacy_path
    assert_text "1 プライバシーポリシーの適用範囲"
  end
end
