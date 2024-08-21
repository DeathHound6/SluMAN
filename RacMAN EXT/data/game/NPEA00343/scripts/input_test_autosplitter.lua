local function start()

end

local function update(timer)

	if Racman.InputProvider.Inputs.Buttons.X then
		timer:isGameTimePaused = true

	end
end

local function stop()

end

Autosplitter.Create("input test", "split when x is pressed on controller", start, update, stop)