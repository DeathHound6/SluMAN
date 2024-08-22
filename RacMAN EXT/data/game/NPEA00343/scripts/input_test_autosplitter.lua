local current, old
current = {}
old = {}
current.cp = 4495
old.cp = 4495


local function updateValues()
    -- read memory and store in current
    current.cp = Memory.ReadInt(0x5EB48C)
    --print(string.format("%.2f", 900*(1-Memory.ReadFloat(0x7DAB2C))))
    --current.igt = Memory.ReadFloat(0x7DAB2C)
end

local function start() 
	print("Starting Gauntlet autosplitter")
end

local function update(timer)
	updateValues()
    if current.cp == 4495 then timer:Reset() end
    if current.cp > old.cp then
        if current.cp > 4400 and current.cp < 4600 then
            old.cp = current.cp
            timer:SetGameTime(string.format("%.2f", 900*(1-Memory.ReadFloat(0x7DAB2C))))
            timer:Split()
        end
    end

end

local function stop() end

Autosplitter.Create("Ultimate Gauntlet", "IGT Autosplitter for Ultimate Gauntlet MTC", start, update, stop)