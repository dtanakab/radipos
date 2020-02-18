# frozen_string_literal: true

require "application_system_test_case"

class TermsTest < ApplicationSystemTestCase
  test "show terms" do
    visit term_path
    assert_text "第1条(定義)"
  end
end
