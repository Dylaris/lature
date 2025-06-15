-- Used to build LOVE project in wsl

print("Running Lua build script...")

local love_exe = "/mnt/d/LOVE2d/LOVE/love.exe"
local lovec_exe = "/mnt/d/LOVE2d/LOVE/lovec.exe"

if #arg ~= 1 then
    print("Usage: lua build.lua <PROJECT>")
else
    os.execute(love_exe .. " " .. arg[1])
end

