# frozen_string_literal: true

require "application_system_test_case"

class Admin::Programs::SearchResultsTest < ApplicationSystemTestCase
  setup { login_user "user3@test.com", "testtest" }

  test "show search results" do
    visit admin_timetables_path
    within ".word_search_area" do
      fill_in("word", with: "テスト検索")
      click_on "検索"
    end
    assert_text "テスト番組1"
  end
end
