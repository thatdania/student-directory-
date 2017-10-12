@year_cohorts = [
  :january,
  :february,
  :march,
  :april,
  :may,
  :june,
  :july,
  :august,
  :september,
  :october,
  :november,
  :december
]

def input_students
  puts "------------- Student List Form -------------".center(75)
  puts "Add a student profile to the list. What's his/her name?".center(72)
  students = []
  name = gets.chomp


    while !name.empty? do
     puts "What country are they from?".center(43)
     country = $stdin.gets.chomp

    puts "What's his or her age?".center(39)
     age = $stdin.gets.chomp.to_i
     if age == "0" then puts "nil" end

     puts "What cohort are they in? (month)".center(48)
     cohort = $stdin.gets.chomp
    while !(@year_cohorts.include? cohort.downcase.to_sym)
     puts "Sorry that ain't an answer. Please try again."
     cohort = $stdin.gets.chomp
  end

   students << {name: name, country: country , age: age, cohort: cohort}
     puts "Now we have #{students.count} students".center(39)
     puts "Add another student's profilf his/her name.".center(60)
     puts "or press ENTER to print out the whole list".center(58)
  # get another name from the user
     name = gets.chomp
  end
     students
  end

def print_header
puts "The students of Makers Academy".center(47)
puts "-------------".center(30)
end

def prints(students)
  students.each do |student|
    puts "#{student[:name]}, country:#{student[:country]} , age :#{student[:age]}, cohort:(#{student[:cohort]})".center(68)
  end
end

#printing the total number of students
def print_footer(names)
puts "Overall, we have #{names.count} great students!".center(50)
puts "---------------------------------------------".center(75)
end

#method printing
 students = input_students
 print_header
 prints(students)
 print_footer(students)
