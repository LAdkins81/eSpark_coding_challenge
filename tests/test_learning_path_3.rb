
require 'minitest/autorun'
require_relative '../lib/learning_path'
require 'csv'

class TestExamples < Minitest::Test

  def setup
    @student = Student.new(["High Score", "6", "6", "6", "6"])
    @learning_path = LearningPath.new([['K','RF','RL','RI', nil],['1','RF','RL','RI', nil], ['2', 'RF', 'RI', 'RL', 'L'],
    ['3', 'RF', 'RL', 'RI', 'L'], ['4', 'RI', 'RL', 'L', nil], ['5', 'RI', 'RL', 'L', nil], ['6', 'RI', 'RL', nil, nil]])
  end

  def test_input_and_output
    assert_equal("High Score", @student.name)
  end

  def test_learning_path
    assert(true, @learning_path.learning_path(@student.score))
    assert_equal(2, @learning_path.learning_path(@student.score).length)
    assert_equal(["6.RI", "6.RL"], @learning_path.learning_path(@student.score))
  end

end
