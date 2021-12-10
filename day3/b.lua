local bin = {}
while true do
    local line = io.read("*l")
    if line == nil then break end
    table.insert(bin, #bin + 1, line)
end

---@param list table
---@param offset number
---@param flip boolean
---@return table
local extract_best = function(list, offset, flip)
    local ones = {}
    local zeros = {}
    for _, value in pairs(list) do
        local tmp = value:sub(offset, offset)
        if tmp == '1' then
            table.insert(ones, value)
        else
            table.insert(zeros, value)
        end
    end
    if #ones > #zeros then
			if flip == false then
        return ones
			else
				return zeros
			end
		elseif #ones == #zeros then
			if flip == false then
				return ones
		  else
				return zeros
			end
    else
			if flip == false then
        return zeros
		  else
				return ones
			end
    end
end

-- Indexing starts at one with lua
local offset = 1
local tmp = bin
while #tmp ~= 1 do
    tmp = extract_best(tmp, offset, false)
    for _, value in pairs(tmp) do io.write(value .. "\n") end
    io.write("\n\n")
    offset = offset + 1
end

local gen_rating = tonumber(tmp[1], 2)

offset = 1
local tmp2 = bin
while #tmp2 ~= 1 do
    tmp2 = extract_best(tmp2, offset, true)
    for _, value in pairs(tmp2) do io.write(value .. "\n") end
    io.write("\n\n")
    offset = offset + 1
end

local scrub_rating = tonumber(tmp2[1], 2)

io.write(gen_rating * scrub_rating.."\n")
