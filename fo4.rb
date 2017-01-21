clear = Proc.new {system "clear"}

def likeness(first, second)
	likeness = 0

	first.each_char.with_index(0) do |c, i|
		if c == second[i]
			likeness += 1
		end
	end

	return likeness
end

# Takes in a word and it's likeness. Any words that aren't equally alike are
# removed from the array of strings.
def sift(word, likeness, list)
	alike = 0
	not_alike = Array.new

	list.each do |comparing|		
		word.each_char.with_index(0) do |c, i|
			if c == comparing[i]
				alike += 1
			end
		end

		if alike != likeness
			not_alike.push(comparing)
		end

		alike = 0
	end

	list -= not_alike
	return list
end


# Prompt
clear.call
print "Enter all words separated by spaces: "

$possible_passwords = gets.chomp.split


# Main Loop
while $possible_passwords.size > 1
	clear.call
	puts "Possible Passwords: #{$possible_passwords}"

	print "Select a word: "
	choice = gets.chomp

	if choice == "done"
		exit(0)
	end

	print "Likeness: "
	likeness = gets.chomp.to_i

	$possible_passwords = sift(choice, likeness, $possible_passwords)
	clear.call
end

# Display answer
puts "Success! Password: #{$possible_passwords}"