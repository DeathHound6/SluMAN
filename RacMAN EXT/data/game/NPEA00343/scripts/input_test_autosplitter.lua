local function start()
	if Memory.ReadInt(0x6CC808) == 430 then
		timer:Start()
	end
end

local function update(timer)

	if Racman.InputProvider.Inputs.Buttons.Cross then
		timer:Split()
		Console.Warn("lol")

	end
end

local function stop()

end

Autosplitter.Create("input test", "split when x is pressed on controller", start, update, stop)