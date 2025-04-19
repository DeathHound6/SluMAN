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

function selected_character_toggle()
	local character = Trainer.GetControlByName("characterComboBox").Text
	if character == "Sly" then
		sly3_select_sly()
	elseif character == "Bentley" then
		sly3_select_bentley()
	elseif character == "Murray" then
		sly3_select_murray()
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

function change_gadget_state(new_state)
	local menu_name = Trainer.GetControlByName("gadgetSelectDropDown").Text
	local name = format_string(menu_name)
	sly3_set_gadget_state(name, new_state)
end

function bind_gadget(button_index)
	local menu_name = Trainer.GetControlByName("gadgetSelectDropDown").Text
	local name = format_string(menu_name)
	sly3_bind_gadget(name, button_index)
end