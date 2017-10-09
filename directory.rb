#printing the list of students
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
puts "The students of Villans Academy"
puts "-------------"
end

#this ireteration will print
def prints(students)
students.each do |student|
  puts "#{student[:name]} (#{student[:cohort]} cohort)"
end
end

#printing the total number of students
def print_footer(names)
puts  "Overall, we have #{names.count} great students"
end

students = input_students
print_header
prints(students)
print_footer(students)
