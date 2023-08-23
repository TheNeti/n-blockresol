RegisterServerEvent('neti:startBlurEffect')
AddEventHandler('neti:startBlurEffect', function()
    local source = source
    TriggerClientEvent('neti:activateBlur', source)
end)
