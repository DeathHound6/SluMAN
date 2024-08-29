if (tostring(Racman.API)=="RacMAN.API.RPCS3: 3429838") then 
	Racman:MakeAddressInputProviderIfNull(0x500F76, 0x1, false, 0x500EFC, true, false)
else
	Racman:MakeAddressInputProviderIfNull(0x500F76, 0x1, true, 0x500EFC, false, false)
end