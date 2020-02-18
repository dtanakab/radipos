# frozen_string_literal: true

require "application_system_test_case"

class TermsTest < ApplicationSystemTestCase
  test "show terms" do
    visit root_path
    click_on "利用規約"
    assert_text "第1条(定義)"
  end
end
