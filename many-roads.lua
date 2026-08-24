-- many-roads for iii - boreal ground v1.2.1
-- updated by Michael Jones
iii_x = 1
iii_y = 1
fs_run_file("many-roads-data.lua")

-- Forces OOM error to reset device
local function oom_nuke()
    for ch = 1, 16 do
        midi_cc(123, 0, ch)
    end
    local nuke = {}
    while true do
        nuke[#nuke + 1] = string.rep("\0", 1000000)
    end
end

function event_grid(x, y, z)
    -- print('x ' .. x .. ' y :' .. y .. ' z :' .. z)
    if not MR or not MR.is_valid(x, y, z) then
        return
    end

    local sfn = event_grid
    MR.load_print(x, y)
    local sel_i = MR.coord_to_index(x, y)
    local n = MR.scripts[sel_i]
    MR = nil
    event_arc = nil
    collectgarbage()
    require(n)

    -- This will wrap the event_grid from the script, detect 3 button presses and restart device when detected
    -- Comment out if you don't want this
    local script_key = (event_grid ~= sfn) and event_grid or nil
    local prev, iii = 0, 0
    event_grid = function(x, y, z)
        if x == iii_x and y == iii_y and z == 1 then
            local t = get_time()
            iii = (t - prev <= 0.5) and iii + 1 or 1
            prev = t
            if iii >= 3 then
                oom_nuke()
            end
        end
        if script_key then
            return script_key(x, y, z)
        end
    end
end

MR.init()
