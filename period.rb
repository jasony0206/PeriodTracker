# interface:
# 	input periods so far: start date, end date
# 	tells you when your next period is expected to be

require 'date'

# prompt user for period start dates and store
puts "When were the first days of your menstruation period? (MM/DD/YYYY)"
first_days = [];
while !(day = gets.chomp).empty?
	date = DateTime.strptime(day, '%m/%d/%Y')
	first_days << date
end

# sort days and compute cycle lengths
first_days.sort!
cycle_lengths = first_days.each_cons(2).map do |day1, day2|
	(day2 - day1).to_i
end

puts cycle_lengths.inspect