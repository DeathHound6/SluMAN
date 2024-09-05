function infinite_health_toggle()
	if (tostring(Trainer.GetControlByName("infiniteHealthCheckBox").CheckState) == "Checked: 1") then 
		sly3_infinite_health()
		print("Activate: Infinite Health")
	else 
		sly3_restore_health() 
		print("Unactivate: Infinite Health")
	end
end

function infinite_gadget_power_toggle()
	if (tostring(Trainer.GetControlByName("infiniteGadgetPowerCheckBox").CheckState) == "Checked: 1") then 
		sly3_infinite_juice()
		print("Activate: Infinite Gadget Power")
	else 
		sly3_restore_juice() 
		print("Unactivate: Infinite Gadget Power")
	end
end

function god_mode_toggle()
	if (tostring(Trainer.GetControlByName("godModeCheckBox").CheckState) == "Checked: 1") then 
		sly3_activate_invulnerability()
		print("Activate: God Mode")
	else 
		sly3_remove_invulnerability() 
		print("Unactivate: God Mode")
	end
end

function infinite_jumps_toggle()
	if (tostring(Trainer.GetControlByName("infiniteJumpsCheckBox").CheckState) == "Checked: 1") then 
		sly3_activate_infinite_jumps()
		print("Activate: Infinite Jumps")
	else 
		sly3_remove_infinite_jumps() 
		print("Unactivate: Infinite Jumps")
	end
end

function guard_ai_toggle()
	if (tostring(Trainer.GetControlByName("guardAICheckBox").CheckState) == "Checked: 1") then 
		sly3_disable_guard_ai()
		print("Activate: Disable Guard AI")
	else 
		sly3_restore_guard_ai() 
		print("Unactivate: Disable Guard AI")
	end
end

function game_clock_toggle()
	if (tostring(Trainer.GetControlByName("gameClockCheckBox").CheckState) == "Checked: 1") then 
		sly3_freeze_game_clock()
		print("Activate: Freeze Game Clock")
	else 
		sly3_unfreeze_game_clock() 
		print("Unactivate: Freeze Game Clock")
	end
end

function uncheck_all_boxes()
	Trainer.ChangeCheckStatus("infiniteGadgetPowerCheckBox")
	Trainer.ChangeCheckStatus("guardAICheckBox")
	Trainer.ChangeCheckStatus("infiniteJumpsCheckBox")
	Trainer.ChangeCheckStatus("godModeCheckBox")
	Trainer.ChangeCheckStatus("infiniteHealthCheckBox")
	Trainer.ChangeCheckStatus("gameClockCheckBox")
end
