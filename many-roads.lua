-- many-roads for iii - boreal ground
print("many-roads v1.0")

local exclude_files = {'many-roads.lua', 'init.lua', 'lib.lua'}
local scripts = fs_list_files()

local exclude_lookup = {}
for i = 1, #exclude_files do
    exclude_lookup[exclude_files[i]] = true
end

local filtered_list = {}
for _, i in ipairs(fs_list_files()) do
    if i:match("%.lua$") and not exclude_lookup[i] and not i:match("^pset_") then
        if #filtered_list < 16 then
            table.insert(filtered_list, i)
        end
    end
end

scripts = filtered_list

print('-------')
print('installed iii scripts:')
for i = 1, #scripts do
    print(i .. ': ' .. scripts[i])
end

grid_led_all(0)
for i = 1, #scripts do
    grid_led(i, 1, 4)
end
grid_refresh()

function event_grid(x, y, z)
    if y == 1 and z == 1 then
        require(scripts[x])
    end
end
