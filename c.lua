ESX = exports["es_extended"]:getSharedObject()

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(3000)
		if not GetIsWidescreen() then
			local source = source
			TriggerEvent('neti:activateBlur', source)
		end

		if not GetIsWidescreen() then
			Citizen.Wait(6000)
			ESX.ShowNotification('Posiadasz niedozwoloną rozdzielczość ekranu! Polecamy 16:9')
		end

		if GetIsWidescreen() then
			ClearTimecycleModifier()
            isBlurActive = false
		end
	end
end)

local isBlurActive = false

RegisterNetEvent('neti:activateBlur')
AddEventHandler('neti:activateBlur', function()
    isBlurActive = true
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if isBlurActive then
            SetTimecycleModifier("hud_def_blur")
            SetTimecycleModifierStrength(6.0) -- Możesz dostosować siłę rozmycia
            Citizen.Wait(6000)  -- Możesz dostosować czas rozmycia
            ClearTimecycleModifier()
            isBlurActive = false
        end
    end
end)
