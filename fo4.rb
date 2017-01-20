table = Hash.new
possible_passwords = Array.new
incorrect_passwords = Array.new
new_incorrect_passwords = Array.new

clear = Proc.new {system "cls"}

word_input = Proc.new {
	puts "Please enter all words and their likeness..."
	
	print "Word: "
	word = gets.chomp
	
	print "Likeness: "
	likeness = gets.chomp
	
	if likeness.size > 0
		table[word] = likeness
	else
		table[word] = "???"
	end

	clear.call
}

compare_zero_keys = Proc.new {

	table.each_pair do |word, likeness|
		if likeness == "0"
			incorrect_passwords.push(word)
		else
			possible_passwords.push(word)
		end
	end

	incorrect_passwords.each do |incorrect|
		possible_passwords.each do |possible|

			puts "Comparing: \"#{incorrect}\" to \"#{possible}\""
			hit = false
			
			incorrect.each_char.with_index(0) do |c, i|
				if possible[i] == c
					puts "#{incorrect} hit #{possible} at index[#{i}]"
					hit = true
				end
			end

			if hit == true
				new_incorrect_passwords.push(possible)
				hit = false
			end
		end
		puts
	end
}



clear.call
12.times {word_input.call}

print "Possible: ", possible_passwords, "\n"
print "Not Possible: ", incorrect_passwords, "\n\n"

compare_zero_keys.call

possible_passwords -= new_incorrect_passwords
incorrect_passwords += new_incorrect_passwords
new_incorrect_passwords = []

print "Possible: ", possible_passwords, "\n"
print "Not Possible: ", incorrect_passwords, "\n"


=begin
Note:
	Possible: ["unicorn", "saxhorn"]
	Not Possible: ["outwile", "bagworm", "outrode", "rubdown", "outlook", "outcook", "outrank", "subjoin", "outpity", "outgave"]
	

	Here, we have two possible answers after comparing against zero keys. We know that "bagworm" has a likeness of 2 with the actual apssword.

	Now that we've compared all the incorrect_passwords to the possible_passwords, we can check the other way around to eliminate remaining passwords.
	
	"saxhorn" has a likeness of 3 with "bagworm" making it an incorrect_password since "bagworm" has a likeness of 2 with the actual password.
=end