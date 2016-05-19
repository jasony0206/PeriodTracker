# interface:
# 	input periods so far: start date, end date
# 	tells you when your next period is expected to be

require 'date'

puts "When were the first days of your menstruation period? (MM/DD/YYYY)"
first_days = [];
while !(day = gets.chomp).empty?
	date = DateTime.strptime(day, '%m/%d/%Y')
	first_days << date
end

puts first_days.inspect
