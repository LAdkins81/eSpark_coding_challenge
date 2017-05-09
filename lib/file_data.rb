require 'csv'
require './learning_path'

students = CSV.read('../data/student_tests.csv')
domain_order = CSV.read('../data/domain_order.csv')

@lp = LearningPath.new(domain_order)

CSV.open("../data/learning_paths.csv", "wb") do |csv|
  students.each do |row|
    next if row[0] == "Student Name"
    @student = Student.new(row)
    csv << [@student.name, @lp.learning_path(@student.score)]
  end
end
