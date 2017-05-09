require 'csv'

# Student class separates the name and score

class Student

  def initialize(input)
    @input = input
    @name = @input[0]
    @score = @input[1..4]
    # puts @name.inspect
    # puts @score.inspect
  end

  def name
    @name = @input[0]
  end

  # this method will need editing if a different test type is inputed

  def score
    parsed_score = {"RF" => "K", "RL" => "K", "RI" => "K", "L" => "K"}
    parsed_score["RF"] = @score[0]
    parsed_score["RL"] = @score[1]
    parsed_score["RI"] = @score[2]
    parsed_score["L"] = @score[3]
    return parsed_score
  end
end

# LearningPath class inputs the domain_order and finds the individualized learning path for each student

class LearningPath

  def initialize(domain_order)
    @domain_order = domain_order
    @levels = []
    # pushes grade levesl into its own array
    @domain_order.each{ |x| @levels.push(x[0]) }
    # deletes grade levels from the domain order (learning_path method works with indices)
    @domain_order.each{ |i| i.delete_at(0) }
  end

  def learning_path(score)
    student_path = []
      @domain_order.each_index{
        |current|
        @domain_order[current].each{
          |subject|
          next if subject == nil # only grades 2 and 3 have no nil fields
          next if @levels == @domain_order[current][0]
          lvl = score[subject]
          next if lvl.to_i > current
          student_path.push(@levels[current] + "." + subject)
        }
      }
      return student_path[0..4]
  end

end
