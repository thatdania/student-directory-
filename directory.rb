def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp

  while !name.empty? do
  puts "Where is she from?"
  country = $stdin.gets.chomp
  break if !country.empty?
  end

  while !name.empty? && !country.empty? do
  students << {name: name, country: country , cohort: :October}
  puts "Now we have #{students.count} students"
  # get another name from the user
  name = gets.chomp
  end
  students
end

def print_header
puts "The students of Makers Academy"
puts "-------------"
end

def prints(students)
  students.each do |student|
    puts "#{student[:name]} #{student[:country]} (#{student[:cohort]} cohort)"
  end
end

#printing the total number of students
def print_footer(names)
puts "Overall, we have #{names.count} great students"
end

#method printing
 students = input_students
 print_header
 prints(students)
 print_footer(students)
