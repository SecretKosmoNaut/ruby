=begin

Every if-statment must have an else
	If you don't want else to run, pass it the die function

Never nest if-statements two deep; try to keep them one deep if possible

Treat each group of if-elsif-else statements as paragraphs; put blank lines
	above and below them as such:

	if [condition]
		...
	elsif [condition_2]
		...
	end

Boolean tests should be simple and easy to read; complex calculations should be
	done through variables which are then passed on to boolean conditions

Only use while loops to loop forever; applies only to Ruby ... --Weird rule
Zed, totally don't get it.

Use for-loops for all other situations, especially if there are a limited
	number of things to iterate through.

Best way to debug is by using put to output variables' values throughout
	different points within your code! --I couldn't agree more!

Another debugging tip is to write code little by litte, running the script at
	logical points. Never code entire programs and debug at the end. Debugging
	should be a continuous process, not a final step!

=end