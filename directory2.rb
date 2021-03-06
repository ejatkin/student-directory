def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more items
  # 2. read the input and save it into a variable
  selection = gets.chomp
  # 3. do what the user has asked
  case selection
    when "1"
      # input the students
      students = input_students
    when "2"
      # show the students
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chop
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    puts "What is the student's cohort?"
    cohort = gets.chomp.to_sym
    if cohort.empty?
      cohort = :november
    end
    until [:January, :February, :March, :April, :May, :June, :July,
    :August, :September, :October, :November, :December].include?(cohort)
    puts "I'm sorry, that answer wasn't recognised. Please enter the full name 
    of the month."
    cohort = gets.chomp.to_sym
  end
    puts "What is the student's main hobby?"
    hobby = gets.chomp
    puts "Where was the student born?"
    birthplace = gets.chomp
    puts "What is the student's height?"
    height = gets.chomp
    students << {name: name, cohort: cohort, hobby: hobby, birthplace: birthplace, height: height}
  if students.count == 1
    puts "Now we have #{students.count} student."
  else
    puts "Now we have #{students.count} students."
  end
    # gets another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(30)
  puts "-------------".center(30)
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} of the #{student[:cohort]} cohort was born in #{student[:birthplace]} 
    and enjoys #{student[:hobby]} as a hobby. They are #{student[:height]} tall."
  end
end

def list_cohorts(students)
  lists = students.map { |student| student[:cohort] }
  puts "We have students from the following cohorts:"
  puts lists
  puts "Which would you like to display?"
  cohort_answer = gets.chomp.to_sym
  students.each do |student|
    if student[:cohort] == cohort_answer
      puts "#{student[:cohort]} cohort, student #{student[:name]}"
    end
  end
end
  
def print_footer(names)
  if names.count == 1
  puts "Overall, we have #{names.count} great student."
  else
  puts "Overall, we have #{names.count} great students."
  end
end

#nothing happens until we call the methods
students = input_students
interactive_menu
list_cohorts(students)
print_header
print(students)
print_footer(students)