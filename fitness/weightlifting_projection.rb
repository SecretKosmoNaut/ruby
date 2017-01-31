total_weeks = 52
current_week = 1

exercise = ""

weight_increment = 0
starting_weight = 0

workout_frequency = 0
reset_frequency = 0
reset_percent = 0

def clear_screen()
	if /mswin|msys|mingw|cygwin|bccwin|wince|emc/ =~ RUBY_PLATFORM
		system "cls"
	else
		system "clear"
	end
end

def reset(weight, percent)
	reset_amount = weight * percent
	reset_amount = reset_amount.round

	if reset_amount % 5 <= 2.5
		reset_amount = (reset_amount / 5) * 5
	else
		reset_amount = ((reset_amount / 5) + 1) * 5
	end

	return reset_amount
end

prompt = Proc.new {
	clear_screen
	print "Exercise: "
	exercise = gets.chomp
	clear_screen
	print "Workout Frequency: "
	workout_frequency = gets.chomp.to_f
	clear_screen
	print "Starting Weight: "
	starting_weight = gets.chomp.to_f
	clear_screen
	print "Weight Increment: "
	weight_increment = gets.chomp.to_f
	clear_screen
	print "Reset Frequency: "
	reset_frequency = gets.chomp.to_f
	clear_screen
	print "Reset Percent: "
	reset_percent = gets.chomp.to_f
	clear_screen
}

workout = Proc.new {
	puts "\t#{exercise.capitalize} 5 x #{starting_weight.round}"
	starting_weight += weight_increment
}

prompt.call

until current_week > total_weeks
	puts "Week #{current_week}:"
	workout_frequency.floor.times {workout.call}
	
	if current_week % reset_frequency == 0
		starting_weight -= weight_increment
		starting_weight -= reset(starting_weight, reset_percent)
		puts "\tResetting to #{starting_weight.round}"
	end

	current_week += 1
	
	puts
end