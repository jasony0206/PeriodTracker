# interface:
# 	input periods so far: start date, end date
# 	tells you when your next period is expected to be

# TODO: 
# 	persistent storage of data
# 	what happens if you forget to report a period?

require 'date'

class PeriodTracker

	attr_reader :first_days, :avg_period, :last_period, :next_period
	
	def initialize(last_period)
		@avg_period = 28
		@last_period = Date.strptime(last_period, '%m/%d/%Y')
		@next_period = @last_period + @avg_period
		@first_days = [@last_period]
		@period_lengths = []
		@variance = 0
	end

	def addDate(date)
		@first_days << Date.strptime(date, '%m/%d/%Y')
		@first_days.sort! unless datesSorted?
		@period_lengths = @first_days.each_cons(2).map { |day1, day2| (day2 - day1).to_i }
		@avg_period = @period_lengths.inject(:+) / @period_lengths.length
		@last_period = @first_days.last
		@next_period = @last_period + @avg_period
		@variance = @period_lengths.inject(0.0) { |s,x| s + (x - @avg_period) ** 2 }
	end

	private

	def datesSorted?
		@first_days.each_cons(2).all? { |a,b| (a <=> b) <= 0 }
	end
end

t = PeriodTracker.new("5/11/2016")
t.addDate("4/7/2016")
t.addDate("3/6/2016")