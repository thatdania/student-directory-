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

#The menu starts the activate
def interactive_menu
  loop do
  print_menu
  process(gets.chomp)
end
end

#print the menu
def print_menu
puts "Hi. Welcome to the Student Directory. Write the option number."
puts "1. Input the students"
puts "2. Show the students"
puts "3. Save the data into a file"
puts "4. Load the file"
puts "5. Exit"
end

#process of choosing what number does what action
def process(selection)
  case selection
  when "1"
    students = input_students
  when "2"
    print_rest
  when "3"
    save_students
    puts "\nFile is saved\n\n"
  when "4"
    load_students
    puts "\nLoaded the file\n\n"
  when "5"
    exit(true)
  else
  puts "\nI dont know what you mean. Input the number again.\n\n"
  end
end

def alien
  puts "This is an alien!".center(33)
  exit(true)
end

#inputs the students arguments
def input_students
  puts "------------- Student List Form -------------".center(60)
  puts "Add a student profile to the list. What's his/her name?".center(72)

     name = gets.chomp.downcase.capitalize

    while !name.empty? do
     puts "What country are they from?".center(43)
     country = $stdin.gets.chomp.downcase.capitalize

    puts "What's his or her age?".center(39)
     age = $stdin.gets.chomp
     age.to_i

    if name == " " || country.empty? || country == " " || age.empty? || age == " "
     alien
       end

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

#printing the rest of the methods
def print_rest
print_header
prints(@students)
print_footer(@students)
end

#Header of the form result
def print_header
puts "The students of Makers Academy".center(47)
puts "-------------".center(30)
end

#printing the list of students
def prints(students)
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
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

#save the studnets to the file
def save_students
  file = File.open("students.csv","w")
  @students. each do |student|
  student_data = [student[:name], student[:country], student[:age], student[:cohort]]
  csv_line = student_data.join(",")
  file.puts csv_line
end
file.close
end

#load the file of students
def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
   puts @students
end

#input the file automatically
def input
filename = ARGV.first
return if filename.nil?
if File.exists?(filename)
  load_students(filename)
  puts "Loaded #{@students.count} from #{filename}"
else
  puts "Soz, #{filename} doesn't exist"
  exit
end
end

#calling the methods
input
interactive_menu
