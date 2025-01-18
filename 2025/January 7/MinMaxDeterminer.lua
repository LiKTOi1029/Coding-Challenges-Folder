tArray, lowestNum, highestNum, pointer = {69, 20, 55, 26, 85, 49, 98, 79, 10, 3, -4, 385, 492, -59, 38265}, nil, nil, math.huge
for num0, item in ipairs(tArray) do
    if tArray[num0-1] then pointer = tArray[num0-1] end
    if pointer < tArray[num0] then highestNum = tArray[num0] end
    if pointer > tArray[num0] then lowestNum = tArray[num0] end
end
print("The largest number is "..highestNum.."\nand the smallest number is "..lowestNum)