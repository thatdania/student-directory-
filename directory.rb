def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  # It might be better to use an if here because the while will run the code just once as the variable "name" is not changing inside it
  # while !name.empty? do
  # puts "Where is she from?"
  # country = $stdin.gets.chomp
  # break if !country.empty?
  # end
  unless name.empty?
    puts "where is the student from?"
    country = gets.chomp
  end
  # I changed the while with ! for an until so that it will evaluate to true and removed the part after the &&
  # because the country variable will always be empty if the name is empty
  # while !name.empty? && !country.empty? do
  # students << {name: name, country: country , cohort: :October}
  # puts "Now we have #{students.count} students"
  # name = gets.chomp
  # end
  until name.empty?
    students << {name: name, country: country , cohort: :October}
    puts "Now we have #{students.count} students"
    name = gets.chomp
    unless name.empty?
      puts "where is the student from?"
      country = gets.chomp
    end
  end
  students
end
