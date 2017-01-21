module Terminal
	
	def clear_screen()
		if /mswin|msys|mingw|cygwin|bccwin|wince|emc/ =~ RUBY_PLATFORM
			system "cls"
		else
			system "clear"
		end
	end

	def type_text(s, type)

		s.each_char do |c|
			print c
			sleep rand(0.00001..0.01)
		end
		
		if type == "puts"
			print "\n"
		end
	end

end