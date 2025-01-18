function fuck.around()
	return io.read()
end

function find.out(fuckaround)
	return fuckaround.." fucked around and found out"
end

if "you" == fuck.around() then print(find.out(fuck.around()))
else print("did not fuck around") end