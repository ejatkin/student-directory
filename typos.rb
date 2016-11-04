@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students_names
    when "2"
      show_students
    when "3"
      save_students
      puts "Students saved."
    when "4"
      load_students
      puts "Loading students from file."
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def input_students_names
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  @name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !@name.empty? do
  # add the student hash to the array
  input_student_cohort
  add_students
  puts "Student successfully added. Now we have #{@students.count} students"
  # get another name from the user
  @name = STDIN.gets.chomp
  end
end

def input_student_cohort
  puts "What is the student's cohort?"
    @cohort = gets.chomp.to_sym
    if @cohort.empty?
      @cohort = :november
    end
    until [:January, :February, :March, :April, :May, :June, :July,
    :August, :September, :October, :November, :December].include?(@cohort)
    puts "I'm sorry, that answer wasn't recognised. Please enter the full name 
    of the month."
    @cohort = gets.chomp.to_sym
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} of the #{student[:cohort]} cohort."
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students."
end

def choose_file
  puts "Please specify a filename to open"
  puts "If no file is selected, students.csv will be opened by default"
  filename = gets.chomp
  #if the file exists
  if filename.exists?
  #then assign it to the @file variable which appears later
  @file = filename
  # else if the file doesn't exist
  elsif !filename.exists?
  #assign filename to the students.csv
  @file = "students.csv"
  end
end

def save_students
  # open the file for writing
  File.open(@file, "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    @file.puts csv_line
  end
  @file.close
end

def load_students
  File.open(@file, "r")
  @file.readlines.each do |line|
  @name, @cohort = line.chomp.split(',')
    add_students
  end
  @file.close
end

def add_students
  @students << {name: @name, cohort: @cohort.to_sym}
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil? # get out of the method if it isn't given
    load_students
  elsif File.exists?(filename) # if it exists
    @file = filename
    load_students
      puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

#nothing happens until we call the methods
try_load_students
interactive_menu