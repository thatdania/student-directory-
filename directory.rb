#This is to specify the cohort only as 12 options as an answer
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

#Inputting the student name, #country and # age
@students = []

#start of the interactive menu
def interactive_menu
  loop do
  print_menu
  process(gets.chomp)
end
end

#menu is priting all the options
def print_menu
puts "Hi. Welcome to the Student Directory. Write the option number."
puts "1. Input the students"
puts "2. Show the students"
puts "3. Exit"
end

#process of choosing what number does what action 
def process(selection)
  case selection
  when "1"
    students = input_students
  when "2"
    print_rest
  when "3"
    exit(true)
  else
  puts "I dont know what you mean. Input the number again."
  end
end

def print_rest
print_header
prints(@students)
print_footer(@students)
end

def input_students
  puts "------------- Student List Form -------------".center(60)
  puts "Add a student profile to the list. What's his/her name?".center(72)

  name = gets.chomp.downcase.capitalize
  if name.empty? || name == " "
    puts "This is an alien!".center(33)
    exit(true)
  end

    while !name.empty? do
     puts "What country are they from?".center(43)
     country = $stdin.gets.chomp
     if country.empty? || country == " "
       puts "This isan alien!".center(33)
       exit(true)
     end

    puts "What's his or her age?".center(39)
     age = $stdin.gets.chomp
      if age.empty? || age == " "
         puts "This is an alien!".center(33)
         exit(true)
       end
       age.to_i

#using the @year_cohorts to specify the answer for the cohort
     puts "What cohort are they in? (month)".center(48)
     cohort = $stdin.gets.chomp

    while !(@year_cohorts.include? cohort.downcase.to_sym)
     puts "Sorry that ain't an answer. Please try again."
     cohort = $stdin.gets.chomp
  end

  @students << {name: name, country: country , age: age, cohort: cohort}
     puts "Now we have #{@students.count} students".center(39)
     puts "Add another student's profile his/her name.".center(60)
     puts "or press ENTER to print out the whole list".center(58)
  # get another name from the user
     name = gets.chomp
  end
     @students
  end

#Header of the form result
def print_header
puts "The students of Makers Academy".center(47)
puts "-------------".center(30)
end

#printing the list of students

def prints(students)
  puts "What cohort do you want to see?".center(47)
  c = gets.chomp
  puts
  @students.map do |student| if student[:cohort] == c
    print student[:name]
    print ", Country: "
    print student[:country]
    print ", Age: "
    print student[:age]
    puts
  end
end
end

#printing the total number of students and end
def print_footer(names)
  puts
if names.count == 1
  puts "Overall, we have #{names.count} great student!".center(50)
else
  puts "Overall, we have #{names.count} great students!".center(50)
end
puts "---------------------------------------------".center(60)
end

#method printing
interactive_menu
