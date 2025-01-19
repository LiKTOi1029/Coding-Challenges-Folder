-- I have redone this with my own code.
function __MAIN__(input)
	
end
repeat
	local MorseTable = {".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--..","-.-.-.","..--..",".--.-.","-.-.--",".----.","--..--",".-.-"}
	io.write(">>Type in morse code to translate into English. Please refer to Guide.txt\n>>Type EXIT to exit the script.\n")
	local input = io.read("*l"):gsub("\n","")
	if input ~= "EXIT" then __MAIN__(input) end
until input == "EXIT"