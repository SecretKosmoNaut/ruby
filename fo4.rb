# This script is for the hacking minigame in the Fallout series.
# Author: SecretKosmoNaut @ GitHub

load "terminal.rb"
include Terminal 

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
clear_screen
type_text("Enter all words separated by spaces: ", "print")

$possible_passwords = gets.chomp.split


# Main Loop
while $possible_passwords.size > 1
	clear_screen
	type_text("Possible Passwords: #{$possible_passwords}", "puts")

	type_text("Select a word: ", "print")
	choice = gets.chomp

	if choice == "done"
		exit(0)
	end

	type_text("Likeness: ", "print")
	likeness = gets.chomp.to_i

	$possible_passwords = sift(choice, likeness, $possible_passwords)
	clear_screen
end

# Display answer
type_text("Success! Password: #{$possible_passwords}", "puts")