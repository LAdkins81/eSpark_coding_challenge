
require 'minitest/autorun'
require_relative '../lib/learning_path'
require 'csv'

class TestExamples < Minitest::Test

  def setup
    @student = Student.new(["No Score", "", "", "", ""])
    @learning_path = LearningPath.new([['K','RF','RL','RI', nil],['1','RF','RL','RI', nil], ['2', 'RF', 'RI', 'RL', 'L'],
    ['3', 'RF', 'RL', 'RI', 'L'], ['4', 'RI', 'RL', 'L', nil], ['5', 'RI', 'RL', 'L', nil], ['6', 'RI', 'RL', nil, nil]])
  end

  def test_input_and_output
    assert_equal("No Score", @student.name)
  end

  def test_learning_path
    assert(true, @learning_path.learning_path(@student.score))
    assert_equal(5, @learning_path.learning_path(@student.score).length)
    assert_equal(["K.RF", "K.RL", "K.RI", "1.RF", "1.RL"], @learning_path.learning_path(@student.score))
  end

end
