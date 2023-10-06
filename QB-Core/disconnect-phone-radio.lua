-- disconnect radio and cellphone when in water

QBCore = exports["qb-QBCore"]:GetQBCoreObject()

CreateThread( function()
    while true do
        if IsEntityInWater(PlayerPedId()) then
            if QBCore.Functions.HasItem("phone") then
                exports['pma-voice']:setCallChannel(0)
                QBCore.Functions.Notify("You phone is water damaged, try dry off", "error", 1000)
            end
            if QBCore.Functions.HasItem("radio") then
                exports['pma-voice']:setRadioChannel(0)
                QBCore.Functions.Notify("You radio is water damaged, try dry off", "error", 1000)
            end
        end
        Wait(1000)
    end
end)