total_weeks = 52
current_week = 1

exercise = ARGV[0].to_s

weight_increment = 5.0
starting_weight = ARGV[1].to_f
current_weight = starting_weight

workout_frequency = ARGV[2].to_f
deload_frequency = 4
deload_percent = 0.10

def deload(weight, percent)
	deload_amount = weight * percent
	deload_amount = deload_amount.round

	if deload_amount % 5 <= 2.5
		deload_amount = (deload_amount / 5) * 5
	else
		deload_amount = ((deload_amount / 5) + 1) * 5
	end

	return deload_amount
end

workout = Proc.new {
	puts "\t#{exercise.capitalize} 5 x #{current_weight.round}"
	current_weight += weight_increment
}

until current_week > total_weeks

	puts "Week #{current_week}:"
	workout_frequency.floor.times {workout.call}
	
	current_week += 1
	
	puts
	
	puts "Week #{current_week}:"
	workout_frequency.round.times {workout.call}

	if current_week % deload_frequency == 0
		current_weight -= weight_increment
		current_weight -= deload(current_weight, deload_percent)
		puts "\tDeloading to #{current_weight.round}"
	end

	current_week += 1

	puts
end