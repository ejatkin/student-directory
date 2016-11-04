def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
  # add the student hash to the array
  @students << {name: name, cohort: :november}
  puts "Now we have #{@students.count} students"
  # get another name from the user
  name = STDIN.gets.chomp
  end
end



def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end