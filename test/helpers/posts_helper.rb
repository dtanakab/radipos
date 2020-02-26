# frozen_string_literal: true

require "test_helper"

class PostsHelperTest < ActionView::TestCase
  test "datetime_format" do
    expected = "2月26日(水) 12:30"
    actual = datetime_format(DateTime.new(2020, 2, 26, 12, 30, 45))
    assert_equal expected, actual
  end
end
