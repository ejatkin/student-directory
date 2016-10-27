# let's put all students into an array
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
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
    puts "Now we have #{students.count} students"
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

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)