# frozen_string_literal: true

require "nokogiri"

require_relative "engines/erb_engine"
require_relative "engines/slim_engine"

module TunaRoll
  class ClassUnroller

    def initialize(path)
      @path = path
    end

    def call
      html = engine.call(File.read(@path))
      doc = Nokogiri::HTML(html)
      doc.css('[class]').flat_map { it.attr('class').split(/\s+/) }.uniq.sort
    end

    private

      def engine
        ext = File.extname(@path)
        case ext
        when '.erb' then ERBEngine.new
        when '.slim' then SlimEngine.new
        else raise Error, "unrecognised file extension '#{ext}'"
        end
      end

  end
end
