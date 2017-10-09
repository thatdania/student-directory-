#printing the list of students

students = [

  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :novemeber},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

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

print_header
prints(students)
print_footer(students)
