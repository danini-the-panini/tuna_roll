# frozen_string_literal: true

require "slim"

require_relative "../generators/static_generator"

module TunaRoll
  class SlimEngine < Slim::Engine
    remove :Generator
    use StaticGenerator
  end
end
