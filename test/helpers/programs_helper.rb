# frozen_string_literal: true

require "test_helper"

class ProgramsHelperTest < ActionView::TestCase
  test "wdays" do
    assert_equal "0", wdays.values[0]
  end
  test "timeframes" do
    assert_equal 2, timeframes.values[0]
  end
  test "wday_str" do
    assert_equal "木曜", wday_str("4")
  end
  test "timeframe_str" do
    assert_equal "深夜(00:00-04:59)", timeframe_str("1")
    assert_equal "朝(05:00-9:59)", timeframe_str("2")
  end
  test "omit_words" do
    assert_equal "", omit_words(nil, 10)
    assert_equal "寿限無寿限無五劫の...", omit_words("寿限無寿限無五劫の擦り切れ海砂利水魚の水行末雲来末風来末食", 10)
    assert_equal "寿限無寿限", omit_words("寿限無寿限", 10)
  end
end
