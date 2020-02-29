# frozen_string_literal: true

require "test_helper"

class ProgramTest < ActiveSupport::TestCase
  test "airtime" do
    assert_equal "03:05-13:30", programs(:program1).airtime
  end

  test "search" do
    result = Program.search("テスト")
    assert_equal programs(:program1), result.first
  end

  test "on_timetable?" do
    assert(programs(:program1).on_timetable?("1", 1))
    assert_not(programs(:program1).on_timetable?("1", 2))
  end

  test "corner attached list" do
    assert_equal(Program.corner_attached_list, [programs(:program1)])
  end

  test "count posts" do
    assert_equal(programs(:program1).count_posts, 3)
    assert_equal(programs(:program2).count_posts, 0)
  end
end
