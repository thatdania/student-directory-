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

puts "The students of Villans Academy"
puts "-------------"

#this ireteration will print 
students.each do |student|
  puts student
end

#printing the total number of students
puts  "Overall, we have #{student.count} great students"
