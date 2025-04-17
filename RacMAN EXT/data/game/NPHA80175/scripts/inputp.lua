if string.find(tostring(Racman.API), "RPCS3") then 
	Racman:MakeAddressInputProviderIfNull(0x500F76, 0x1, false, 0x500EFC, true, false)
else
	Racman:MakeAddressInputProviderIfNull(0x500F76, 0x1, true, 0x500EFC, false, false)
end