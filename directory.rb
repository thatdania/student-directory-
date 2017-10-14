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
puts "Hi. Welcome to the Student Directory. Write the option number, only."
puts "1. Input the students"
puts "2. Show all students"
#show_students the students via cohort
puts "4. Save the data into a file"
puts "5. Load the file"
puts "6. Exit"
end

#process of choosing what number does what action
def process(selection)
  case selection
  when "1"
    students = input_students
  when "2"
    print_rest
  when "4"
    asking_save
  when "5"
    load_students
  when "6"
    exit(true)
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

#3. Asking to show the students via cohort


#4.1 asking where to save
def asking_save
puts "Where would you like to save the students?"
save_students(STDIN.gets.chomp)
end

#4. save the students to the file
def save_students(csv_file)
  file = File.open(csv_file,"w") do |data|
  @students. each do |student|
  student_data = [student[:name], student[:country], student[:age], student[:cohort]]
  csv_line = student_data.join(",")
  data.puts csv_line
end
end
puts "File is saved"
sucessful
end

#5. load the file of students
def load_students
  puts "Which file would you like to load from?"
  filename = gets.chomp
  until File.exist?(filename)
  puts "File no exist, try again"
  filename = gets.chomp
end
  file = File.open(filename, "r") 
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
  puts "File has loaded"
end


#input the file automatically
def input
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

def sucessful
  puts "Process sucessful"
end

#calling the methods
input
interactive_menu
