# frozen_string_literal: true

require "application_system_test_case"

class Program::RecommendationsTest < ApplicationSystemTestCase
  setup { login_user "user1@test.com", "testtest" }
  test "show search results" do
    visit recommendations_path
    assert_text "テスト番組1"
  end
end
