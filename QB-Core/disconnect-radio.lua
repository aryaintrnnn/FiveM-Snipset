-- qb-radio auto disconnect when player is down
-- qb-radio/client/main.lua

CreateThread(function()
    while true do
        Wait(1000)
        if LocalPlayer.state.isLoggedIn and onRadio then
            if not hasRadio or PlayerData.metadata.isdead or PlayerData.metadata.inlaststand then
                if RadioChannel ~= 0 then
                    leaveradio()
                end
            end
        end
    end
end)

-- and replace with

CreateThread(function()
    while true do
        Wait(1000)
        if LocalPlayer.state.isLoggedIn and onRadio then
            if not hasRadio or PlayerData.metadata.isdead or PlayerData.metadata.inlaststand then
                if RadioChannel ~= 0 then
                    exports["pma-voice"]:setVoiceProperty("radioEnabled", false)
                end
            else
                exports["pma-voice"]:setVoiceProperty("radioEnabled", true)
            end
        end
    end
end)