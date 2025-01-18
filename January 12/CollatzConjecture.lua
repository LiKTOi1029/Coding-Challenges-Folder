x, z = io.read("n"), 0
repeat
	if x % 2 == 0 then x = x/2
	elseif x % 2 == 1 then x=(x*3)+1 end
	z=z+1
	until x == 1
print(z)