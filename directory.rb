# let's put all students into an array
@students = []

students = [
  {name: "Dr. Hannibal Lecter", cohort: :november, hobby:"taxidermy"},
  {name: "Darth Vader", cohort: :november, hobby:"taxidermy"},
  {name: "Nurse Ratched", cohort: :november, hobby:"fishing"},
  {name: "Michael Corleone", cohort: :november, hobby:"fishing"},
  {name: "Alex DeLarge", cohort: :november, hobby:"gardening"},
  {name: "The Wicked Witch of the West", cohort: :november, hobby:"gardening"},
  {name: "Terminator", cohort: :november, hobby:"gardening"},
  {name: "Freddy Krueger", cohort: :november, hobby:"fishing"},
  {name: "The Joker", cohort: :november, hobby:"fishing"},
  {name: "Joffrey Baratheon", cohort: :december, hobby:"taxidermy"},  
  {name: "Norman Bates", cohort: :december, hobby:"taxidermy"}
]

# and then print them
def print_header
	puts "The students of Villains Academy"
	puts "-------------"
end 

def print_students_list
 @students.each do |student|  
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
 end
end

def print_while(students)
for student in students
	puts "#{student}"
end
end

def print_index_name(students)
	students.each_with_index {|(key,value),index|
		puts "#{index+1}. #{key[:name]}"}
	end

def name_filter(students)
	students.each do |student|
		if student[:name].include?'a'
		puts "#{student[:name]}" 
end
end
end

def number_filter(students)
	students.each do |student|
		if student[:name].length< 12
		puts "#{student[:name]}"
end
end
end

def print_by_cohort(students)
	students.each do |student| 
	if student[:cohort] == :november
	puts "#{student[:name]}"
end
end
end

# finally, we print the total
def print_footer
puts "Overall, we have #{@students.count} great students".center(50)
end 

def input_students
	puts "Please enter the names and cohorts of the students"
	puts "To finish, just hit return twice"
	# create an empty array
	#students =[]
	# get the first name
	puts "Name?"
	name = STDIN.gets.chomp
	# get the cohort
	puts "Cohort?"
	cohort = STDIN.gets.chomp.to_sym || "TBA"
	#while the name is not empty, repeat this code
	while !name.empty? do
	# add the student to the array
	insert_students(name,cohort)
	if @students.count == 1
	puts "Now we have #{@students.count} student."
	else 
	puts "Now we have #{@students.count} students"
end
puts "Don't forget to save"

	#get another name from the user
	name = STDIN.gets.chomp
	cohort = STDIN.gets.chomp


end

@students
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save the list to students.csv"
	puts "4. Load the list from students.csv"
	puts "9. Exit"
end

def show_students
	print_header
	print_students_list
	print_footer
end

def process(selection)
  case selection
    when "1"
      	input_students
    when "2"
     	show_students
    when "3"
    	save_students
    when "4"
    	load_students
    when "9"
    	puts "Program is closing..."
      exit

    else
      puts "I don't know what you mean, try again"
  end
end

def save_students
	#open the file for writing
	file = File.open("students.csv","w")
# iterate over the array of students
@students.each do |student|
	student_data = [student[:name], student[:cohort]]
	csv_line = student_data.join(",")
	file.puts csv_line
end
file.close
puts "File saved and close"
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
  insert_students(name,cohort)
  end
  file.close
  puts "File loaded from students.csv"
end

def try_load_students
  filename = ARGV.first || "students.csv"# first argument from the command line
   # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
  	load_students("students.csv")
    puts "Loaded #{@students.count} from default, students.csv because file requested doesn't exist"
  end
end

def insert_students(name,cohort)
@students << {name: name.to_sym, cohort: cohort}
end
# nothing happens until we call the methods
# students = input_students
# print_header
# print(students)
# print_footer(students)
# name_filter(students)
# number_filter(students)
# print_while(students)
# print_by_cohort(students)
try_load_students
interactive_menu