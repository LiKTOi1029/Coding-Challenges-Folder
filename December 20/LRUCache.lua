function fSHOW(tab)
	io.write("{")
	for num0, string0 in ipairs(tab) do
		io.write("<"..string0..">,")
	end
	io.write("}".."\n")
end
function fINPUT(choice,tab)
	for num1, string1 in ipairs(tab) do
		if choice == string1 then io.write(">>Fetched " .."<"..string1..">\n"); table.insert(tab, 1, choice); table.remove(tab,4) break
		elseif #tab == 3 and choice ~= tab[3] then table.insert(tab, 1, choice); if tab[4] then io.write(">>Popped \""..tostring(tab[4]).."\" from the cache (cache can only hold "..tostring(#tab-1)..")\n") end table.remove(tab, 4); break 
		elseif choice ~= tab[#tab] then table.insert(tab, 1, choice); io.write(">>No matches found, saving to cache\n") break end
	end
	if #tab == 0 then table.insert(tab, 1, choice); io.write(">>Empty cache, saving to cache\n") end
end
function __MAIN__()
	local cache = {}
	repeat
		io.write(">>Type SHOW to show to the table. Type INPUT to save or fetch from a table. Type EXIT to EXIT\n")
		local option = io.read("*l"):gsub("\n", "")
		if option == "INPUT" then io.write(">>Input something: \n"); local input = io.read("*l"):gsub("\n", ""); fINPUT(input,cache)
		elseif option == "SHOW" then fSHOW(cache)
		elseif option == "EXIT" then break end
	until true == false
end
__MAIN__()