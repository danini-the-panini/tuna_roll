# frozen_string_literal: true

require "progress"

require_relative "tuna_roll/version"
require_relative "tuna_roll/class_unroller"

module TunaRoll
  class Error < StandardError; end

  def self.unroll_classes(*paths)
    paths.each.with_progress.reduce([]) { |classes, path|
      classes | ClassUnroller.new(path).call
    }.sort
  end
end
