# frozen_string_literal: true

require "temple"

module TunaRoll
  class StaticGenerator < Temple::Generator
    def save_buffer = nil
    def restore_buffer = nil
    def return_buffer = nil

    def on_multi(*exp) = exp.map { compile(it) }.join
    def on_newline = nil
    def on_capture(*) = nil
    def on_static(text) = text
    def on_dynamic(*) = '%DYNAMIC%'
    def on_code(*) = nil
  end
end
