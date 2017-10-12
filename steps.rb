#1. this document is not a code that should be executed.
#it simply is step by step process of how I tackeld each of the exercises so far.

#2. printing a number before printing the student
def prints(students)
students.each_with_index do |student, index|
  list = "#{student[:name]} (#{student[:cohort]} cohort)"
  puts "#{index + 1}. " + list
end
end

#3. printing students beginning with a certain letter
def input_students
  puts "Please enter the names of the students beginning with A"
  puts "To finish, just hit return twice"

  students = []
  name = gets.chomp
  while !name.empty? && name.start_with?("A", "a") do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

#4. printing students beginning with a certain length/number
students = []
name = gets.chomp
while !name.empty? && name.length < 12 do
  students << {name: name, cohort: :november}
  puts "Now we have #{students.count} students"
  name = gets.chomp
end
students
end

#5. using .any? to change the each function into a while function
def prints(students)
  while students.any? {|student,index|}
    list = "#{student[:name]} (#{student[:cohort]} cohort)"
    puts "#{index + 1}. " + list
end
end

#6. printing each student's name and country
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp

#7. adding in more details such as the country etc. (1 example)
  while !name.empty? do
    puts "What country are they from?"
    country = $stdin.gets.chomp
  students << {name: name, country: country , cohort: :October}
  puts "Now we have #{students.count} students"
  puts "Add more students or press ENTER to print out the whole list"
  # get another name from the user
  name = gets.chomp
  end
  students
end

#8. Making the cohort list specificed to only 12 results
@year_cohorts = [ 'Enter the months here' eg: January: ]
puts "What cohort are they in? (month)".center(48)
cohort = $stdin.gets.chomp
while !(@year_cohorts.include? cohort.downcase.to_sym)
puts "Sorry that ain't an answer. Please try again."
cohort = $stdin.gets.chomp
end

#9. in the footer, I changed the student to students depending on the whether the
#number is plural of single
def print_footer(names)
  puts
if names.count == 1
  puts "Overall, we have #{names.count} great student!".center(50)
else
  puts "Overall, we have #{names.count} great students!".center(50)
end
puts "---------------------------------------------".center(60)
end

#We've been using the chomp() method to get rid of the last return character.
#Find another method among those provided by the String class that could
#be used for the same purpose (although it will require passing some arguments).
#(still trying to figure this out?)

#10. Allowing the data input to be at least one student
#if no answer is wrtitten, it writes this is an alien!
name = gets.chomp.downcase.capitalize
if name.empty? || name == " "
  puts "This is an alien!".center(33)
  exit(true)
end

  while !name.empty? do
   puts "What country are they from?".center(43)
   country = $stdin.gets.chomp.downcase.capitalize
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

#11. Made a start up menu
#Print menu is a print function with bunch of text
#Process is the if statements for when the user clicks those numbers
def interactive_menu
  loop do
  print_menu
  process(gets.chomp)
end
end

def process(selection)
  case selection
  when "1"
    students = input_students
  when "2"
    print_rest
  when "3"
    save_students
    puts "File is saved"
  when "4"
    load_students
    puts "Loaded the file"
  when "5"
    exit(true)
  else
  puts "I dont know what you mean. Input the number again."
  end
end

# 12. Example of saving a file
def save_students
  file = File.open("students.csv","w")
  @students. each do |student|
  student_data = [student[:name], student[:country], student[:age], student[:cohort]]
  csv_line = student_data.join(",")
  file.puts csv_line
end
file.close

# 13. Example of loading a file (from a directed file, not choosing a file)
def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, country, age, cohort = line.chomp.split(',')
    @students << {name: name, country: country, age: age, cohort: cohort.to_sym}
  end
  file.close
  puts @students
end
