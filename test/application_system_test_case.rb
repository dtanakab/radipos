# frozen_string_literal: true

require "test_helper"
require "supports/login_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include LoginHelper
  include Warden::Test::Helpers
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
end
