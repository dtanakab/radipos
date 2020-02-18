# frozen_string_literal: true

require "application_system_test_case"

class Program::TimetablesTest < ApplicationSystemTestCase
  test "show timetables" do
    visit root_path
    within ".timetable_area" do
      select "月曜"
      select "深夜(00:00-04:59)"
      click_on "番組表"
    end
    assert_text "テスト番組1"
  end
end
