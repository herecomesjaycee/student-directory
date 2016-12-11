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
def print_footer(names)
puts "Overall, we have #{names.count} great students".center(50)
end 

def input_students
	puts "Please enter the names and cohorts of the students"
	puts "To finish, just hit return twice"
	# create an empty array
	students =[]
	# get the first name
	puts "Name?"
	name = gets.chomp
	# get the cohort
	puts "Cohort?"
	cohort = gets.chomp.to_sym || "TBA"
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
	name = gets.chomp
	cohort = gets.chomp
end

students
end

# nothing happens until we call the methods
students = input_students
# print_header
# print(students)
# print_footer(students)
# name_filter(students)
# number_filter(students)
# print_while(students)
# print_by_cohort(students)