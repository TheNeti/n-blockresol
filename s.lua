RegisterServerEvent('richrp:startBlurEffect')
AddEventHandler('richrp:startBlurEffect', function()
    local source = source
    TriggerClientEvent('richrp:activateBlur', source)
end)
