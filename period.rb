# interface:
# 	input periods so far: start date, end date
# 	tells you when your next period is expected to be

# TODO: 
# 	persistent storage of data
# 	what happens if you forget to report a period?

require 'date'

# prompt user for period start dates and store
puts "When were the first days of your menstruation period? (MM/DD/YYYY)"
first_days = [];
while !(day = gets.chomp).empty?
	date = Date.strptime(day, '%m/%d/%Y')
	first_days << date
end

# sort days and compute cycle lengths
first_days.sort!
cycle_lengths = first_days.each_cons(2).map do |day1, day2|
	(day2 - day1).to_i
end

avg_cycle = cycle_lengths.reduce(:+) / cycle_lengths.length
puts "Average cycle length: #{avg_cycle}"

puts "When was the first day of your last period?"
last_period_day = gets.chomp
last_period = Date.strptime(last_period_day, '%m/%d/%Y')
expected_period = last_period + avg_cycle

puts "Your next period is expected to be on #{expected_period.strftime('%m/%d/%Y')}"