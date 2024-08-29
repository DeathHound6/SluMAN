if (tostring(Racman.API)=="RacMAN.API.RPCS3: 3429838") then 
	Racman:MakeAddressInputProviderIfNull(0x5EC5AA, 0x1, false, 0x5EC5F0, true, false)
else
	Racman:MakeAddressInputProviderIfNull(0x5EC5AA, 0x1, true, 0x5EC5F0, false, false)
end