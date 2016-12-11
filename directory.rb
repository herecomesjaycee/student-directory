# let's put all students into an array
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

def print(students)
 students.each do |student|  
    puts "#{students}  #{student[:name]} (#{student[:cohort]} cohort)"
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
def print_footer(students)
puts "Overall, we have #{students.count} great students".center(50)
end 

def input_students
	puts "Please enter the names and cohorts of the students"
	puts "To finish, just hit return twice"
	# create an empty array
	students =[]
	# get the first name
	puts "Name?"
	name = gets.strip
	# get the cohort
	puts "Cohort?"
	cohort = gets.strip.to_sym || "TBA"
	#while the name is not empty, repeat this code
	while !name.empty? do
	# add the student to the array
	students << {name: name.to_sym, cohort: cohort}
	if students.count == 1
	puts "Now we have #{students.count} student"
	else 
	puts "Now we have #{students.count} students"
end

	#get another name from the user
	name = gets.strip
	cohort = gets.strip


end

students
end

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
student = input_students
	#input the students
when "2"
	#show the students
print_header
print(students)
print_footer(students)
when "9"
	exit #this will cause the program to stop
else
	puts "I don't know what you meant, try again"
end
end
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
interactive_menu