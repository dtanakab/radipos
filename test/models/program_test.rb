# frozen_string_literal: true

require "test_helper"

class ProgramTest < ActiveSupport::TestCase
  test "airtime" do
    assert_equal "03:05-13:30", programs(:program1).airtime
  end

  test "set_regular_corner" do
    programs(:program1).set_regular_corner
    corner = programs(:program1).corners.first
    assert_equal "ふつおた/テーマメール/リアクションメール", corner.subject
  end

  test "search" do
    result = Program.search("テスト")
    assert_equal programs(:program1), result.first
  end
end
