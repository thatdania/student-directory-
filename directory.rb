#printing the list of students

students = [

  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]

def print_header
puts "The students of Villans Academy"
puts "-------------"
end

#this ireteration will print
def prints(names)
names.each do |name|
  puts name
end
end

#printing the total number of students
def print_footer(names)
puts  "Overall, we have #{names.count} great students"
end

print_header
prints(students)
print_footer(students)
