# frozen_string_literal: true

require "test_helper"

class TestTunaRoll < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::TunaRoll::VERSION
  end
end
