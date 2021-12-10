local z_count = {}
local o_count = {}

while true do
    local line = io.read("*l")
    if line == nil then break end
    for i = 1, #line do
        local e = line:sub(i, i)
        if e == '1' then
            if o_count[i] == nil then
                o_count[i] = 1
            else
                o_count[i] = o_count[i] + 1
            end
        else
            if z_count[i] == nil then
                z_count[i] = 1
            else
                z_count[i] = z_count[i] + 1
            end
        end
    end
end
-- io.write("---1-COUNT---\n")
-- for _, value in ipairs(o_count) do io.write(value .. " ") end
-- io.write("\n---0-COUNT---\n")
-- for _, value in ipairs(z_count) do io.write(value .. " ") end
-- io.write("\n")

local gamma_rate = {}
local epsilon_rate = {}
for i = 1, #o_count do
    if o_count[i] > z_count[i] then
        gamma_rate[i] = 1
        epsilon_rate[i] = 0
    else
        gamma_rate[i] = 0
        epsilon_rate[i] = 1
    end
end

local gamma_total = 0
local epsilon_total = 0
-- io.write("\n---GAMMA---\n")
for i, value in ipairs(gamma_rate) do
    -- io.write(value .. " ")
    if value == 1 then
        gamma_total = gamma_total + math.pow(2, #gamma_rate - i)
    end
end
-- io.write("\n---EPSILON---\n")
for i, value in ipairs(epsilon_rate) do
    -- io.write(value .. " ")
    if value == 1 then
        epsilon_total = epsilon_total + math.pow(2, #epsilon_rate - i)
    end
end
-- io.write("\n")

io.write("e: " .. tostring(epsilon_total) .. " g:" .. tostring(gamma_total) ..
             " ans:" .. tostring(epsilon_total * gamma_total))
