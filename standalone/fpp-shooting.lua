-- AUTO SWITCH FPP WHEN IN VEHICLE
-- NEED OX_LIB

local isFPP = false
local SetBlackout = SetBlackout
local GetFollowVehicleCamViewMode = GetFollowVehicleCamViewMode
local SetFollowVehicleCamViewMode = SetFollowVehicleCamViewMode
local IsPlayerFreeAiming = IsPlayerFreeAiming

local function SwitchFPP()
    while cache.vehicle do
        SetBlackout(false)
        if IsPlayerFreeAiming(cache.playerId) then
            if GetFollowVehicleCamViewMode() == 4 and not isFPP then
                isFPP = false
            else
                SetFollowVehicleCamViewMode(4)
                isFPP = true
            end
        else
            if isFPP then
                SetFollowVehicleCamViewMode(1)
                isFPP = false
            end
        end
        Wait(1)
    end
end

lib.onCache('vehicle', function()
    SwitchFPP()
end)