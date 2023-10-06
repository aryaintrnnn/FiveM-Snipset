-- Untuk 1 Jenis Kendaraan
-- For 1 Type of Vehicle

local maxSpeeds = {
    [GetHashKey("putvehiclehashhere")] = 160.0,   -- Example: mclarensenna
    [GetHashKey("putvehiclehashhere")] = 160.0,   -- Example: bmwe39 
}

Citizen.CreateThread(function()
    while true do 
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        local speed = GetEntitySpeed(vehicle) * 2.23694  -- Conversion from m/s to mph
        local vehicleHash = GetEntityModel(vehicle)
        local maxSpeed = maxSpeeds[vehicleHash]
        
        Citizen.Wait(0)
        
        if maxSpeed and speed > maxSpeed then
            SetEntityMaxSpeed(vehicle, maxSpeed / 2.23694)  -- Set speed limit in m/s
        end
    end
end)

-- Untuk 1 Kategori Kendaraan
-- For 1 Vehicle Category

local maxSpeeds = {
    [0] = 90.0,   -- Compacts
    [1] = 90.0,   -- Sedans
    [2] = 90.0,   -- SUVs
    [3] = 90.0,   -- Coupes
    [4] = 90.0,   -- Muscle
    [5] = 90.0,   -- Sports Classics
    [6] = 90.0,   -- Sports
    [7] = 90.0,   -- Super
    [8] = 90.0,   -- Motorcycles
    [9] = 90.0,   -- Off-road
    [10] = 90.0,  -- Industrial
    [11] = 90.0,  -- Utility
    [12] = 90.0,  -- Vans
    [13] = 90.0,  -- Cycles
    [14] = 90.0,  -- Boats
    [15] = 90.0,  -- Helicopters
    [16] = 90.0,  -- Planes
    [17] = 90.0,  -- Service
    [18] = 90.0,  -- Emergency
    [19] = 90.0,  -- Military
    [20] = 90.0,  -- Commercial
    [21] = 90.0   -- Trains
}
  
Citizen.CreateThread(function()
    while true do 
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        local speed = GetEntitySpeed(vehicle)
        local mph = 2.23694  -- Conversion factor from km/h to mph
        local vehicleClass = GetVehicleClass(vehicle)
        local maxSpeed = maxSpeeds[vehicleClass]
            
        Citizen.Wait(0)
            
        if maxSpeed then
            if math.floor(speed * mph) == maxSpeed then
                cruise = GetEntitySpeed(vehicle)
                SetEntityMaxSpeed(vehicle, cruise)
            else
                SetEntityMaxSpeed(vehicle, maxSpeed)
            end
        end
    end
end)