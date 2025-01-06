# frozen_string_literal: true

require "temple"
require "temple/erb/engine"

require_relative "../generators/static_generator"

module TunaRoll
  class ERBEngine < Temple::ERB::Engine
    remove :ArrayBuffer # generator
    use StaticGenerator
  end
end
