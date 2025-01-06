# frozen_string_literal: true

module UnrollClassesTests

  def engine
    raise "override in subclass"
  end

  def test_unroll_basic
    assert_unrolled_classes('basic', %w[foo hello])
  end

  def test_unroll_conditional
    assert_unrolled_classes('conditional', %w[condition neither that this])
  end

  def test_unroll_dynclass
    assert_unrolled_classes('dynclass', %w[foo foo--%DYNAMIC%])
  end

  def test_unroll_loops
    assert_unrolled_classes('loops', %w[thing things])
  end

  private

    def input_path(t)
      File.join(__dir__, 'inputs', engine, "#{t}.#{engine}")
    end

    def assert_unrolled_classes(name, expected)
      actual = TunaRoll.unroll_classes(input_path(name))
      assert_equal expected, actual
    end

end
