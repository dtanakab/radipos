# frozen_string_literal: true

require "application_system_test_case"

class ProgramsTest < ApplicationSystemTestCase
  test "show program list" do
    visit root_path
    assert_text "テスト番組1"
    assert_no_text "テスト番組2"
  end

  test "show program" do
    visit root_path
    click_on "テスト番組1"
    assert_text "テスト番組1が始まります"
  end
end
