require 'csv'

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

#The menu starts the activate
def interactive_menu
  loop do
  print_menu
  process(gets.chomp)
end
end

#print the menu
def print_menu
puts "Hi. Welcome to the Student Directory. Write the option number, only."
puts "1. Input or add the students"
puts "2. Show all students"
puts "3. Check if a student exist in the file."
puts "4. Print list via cohort"
puts "5. Save the data into a file"
puts "6. Load the file"
puts "7. Exit"
end

#process of choosing what number does what action
def process(selection)
  case selection
  when "1" then students = input_students
  when "2" then print_rest
  when "3" then check
  when "4" then cohort
  when "5" then asking_save
  when "6" then load_students
  when "7" then exit(true)
  else
  puts "\nI dont know what you mean. Input the number again.\n\n"
  end
end

# 1. Input the students arguments
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

   puts "What cohort are they in? (month)".center(48)
    cohort = $stdin.gets.chomp

  while !(@year_cohorts.include? cohort.downcase.to_sym)
   puts "Sorry that ain't an answer. Please try again."
    cohort = $stdin.gets.chomp
  end

@students << {name: name, country: country , age: age, cohort: cohort.to_sym}
   puts "Now we have #{@students.count} students".center(39)
    sucessful
   puts "Add another student's profile his/her name.".center(60)
   puts "or Press ENTER to print out the whole list".center(58)
    name = gets.chomp
  end
 @students
end


#For step 1 input: ALIEN
def alien
  puts "This is an alien!".center(33)
  exit(true)
end

#2. Show all students" - Method including Header and Footer
def print_rest
 print_header
 prints(@students)
 print_footer(@students)
end

#2.1 Header of the form result
def print_header
 puts "The students of Makers Academy".center(47)
 puts "-------------".center(30)
end

#2.2 printing the list of students
def prints(students)
  @students.each do |student|
    puts "#{student[:name]}, Country: #{student[:country]}, Age: #{student[:age]}, (#{student[:cohort]} cohort)"
  end
end

#2.3 printing the total number of students and end
def print_footer(names)
    puts
  if names.count == 1
    puts "Overall, we have #{names.count} great student!".center(50)
  else
    puts "Overall, we have #{names.count} great students!".center(50)
  end
sucessful
    puts "---------------------------------------------".center(60)
end

#3. Asking to see whether a student exist in the cohort
def check
    puts "Enter student you want to find"
     student = STDIN.gets.chomp
  loop do
  if !(@students.any? { |s| s[:name] == student})
        puts "Sorry, #{student} is non-existent. Please re-enter the name of the student"
  else
        break
  end
      student = STDIN.gets.chomp
  end
    sucessful
    puts "Student exist. Check the list"
end

#4. print student by cohort
def cohort
    puts "What cohort would you like to see?"
     cohort = STDIN.gets.chomp
     puts
  @students.each do |student|
  if student[:cohort] = cohort
  puts "#{student[:name]}, Country: #{student[:country]}, Age: #{student[:age]}, (#{student[:cohort]} cohort)"
end
puts
end
end

#5 asking where to save
def asking_save
    puts "Where would you like to save the students?"
    filesaved_chosen = STDIN.gets.chomp
    CSV.open(filesaved_chosen, "w") do |csv|
  @students.each do |student|
    student_data = [student[:name], student[:country], student[:age], student[:cohort]]
    csv << student_data
  end
end
    puts "File is saved"
    sucessful
end

#6 load the file of students
def load_students
  puts "Which file would you like to load from?"
    filename = gets.chomp
  if !File.exist?(filename)
    filename = "students.csv"
  puts "File no exist, loading default"
end
    csv_to_array(filename)
    puts "File has loaded"
end

#6.1 from the file to the array
def csv_to_array (csv_file)
  file = File.open(csv_file, "r") do |f|
 @students = []
  CSV.foreach(f) do |line|
  name, country, age, cohort = line[0], line[1], line[2],line[3]
  add_student(name, country, age, cohort)
end
end
end

#6.2 adding students to the array
def add_student(name,country,age,cohort)
  @students << {name: name, country: country, age: age, cohort: cohort.to_sym}
end

#7.input the file automatically
def input_autoload
  filename = ARGV.first
  if filename.nil?
    load_students
  elsif File.exists?(filename)
    load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

#printing out the names of files
def file_names
  puts
  puts __FILE__ #full file name
  puts File.dirname('/Users/macintosh/Desktop/Projects/student-directory') #name of file
  puts File.basename('/Users/macintosh/Desktop/Projects/student-directory') #file ending
  puts
end

#Saying everytime when a process sucessful
def sucessful
  puts "Process sucessful"
end

#calling the methods
file_names
input_autoload
interactive_menu
