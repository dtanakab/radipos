# frozen_string_literal: true

require "application_system_test_case"

class Admin::Programs::TimetablesTest < ApplicationSystemTestCase
  setup { login_user "user3@test.com", "testtest" }

  test "show timetables" do
    visit admin_timetables_path
    within ".timetable_area" do
      select "月曜"
      select "深夜(00:00-04:59)"
      click_on "番組表"
    end
    assert_text "テスト番組1"
  end
end
