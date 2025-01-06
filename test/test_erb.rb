# frozen_string_literal: true

require "test_helper"
require_relative 'support/unroll_classes_tests'

class TestERB < Minitest::Test
  include UnrollClassesTests

  def engine = 'erb'
end
