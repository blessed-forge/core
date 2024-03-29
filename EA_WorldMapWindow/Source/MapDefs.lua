
----------------------------------------------------------------
-- Local Variables
----------------------------------------------------------------

local PairingIconSliceNames = {}
PairingIconSliceNames[GameData.Pairing.GREENSKIN_DWARVES] = {}
PairingIconSliceNames[GameData.Pairing.GREENSKIN_DWARVES][GameData.Realm.ORDER] = "Order-Dwarf"
PairingIconSliceNames[GameData.Pairing.GREENSKIN_DWARVES][GameData.Realm.DESTRUCTION] = "Dest-Greenskin"
PairingIconSliceNames[GameData.Pairing.GREENSKIN_DWARVES][GameData.Realm.NONE] = "CONTESTED"
PairingIconSliceNames[GameData.Pairing.EMPIRE_CHAOS] = {}
PairingIconSliceNames[GameData.Pairing.EMPIRE_CHAOS][GameData.Realm.ORDER] = "Order-Empire"
PairingIconSliceNames[GameData.Pairing.EMPIRE_CHAOS][GameData.Realm.DESTRUCTION] = "Dest-Chaos"
PairingIconSliceNames[GameData.Pairing.EMPIRE_CHAOS][GameData.Realm.NONE] = "CONTESTED"
PairingIconSliceNames[GameData.Pairing.ELVES_DARKELVES] = {}
PairingIconSliceNames[GameData.Pairing.ELVES_DARKELVES][GameData.Realm.ORDER] = "Order-HighElf"
PairingIconSliceNames[GameData.Pairing.ELVES_DARKELVES][GameData.Realm.DESTRUCTION] = "Dest-DarkElf"
PairingIconSliceNames[GameData.Pairing.ELVES_DARKELVES][GameData.Realm.NONE] = "CONTESTED"
PairingIconSliceNames[GameData.ExpansionMapRegion.TOMB_KINGS] = {} --TODO: Alternative art here too? Or OK to use whatever race
PairingIconSliceNames[GameData.ExpansionMapRegion.TOMB_KINGS][GameData.Realm.ORDER] = "Order-HighElf"
PairingIconSliceNames[GameData.ExpansionMapRegion.TOMB_KINGS][GameData.Realm.DESTRUCTION] = "Dest-DarkElf"
PairingIconSliceNames[GameData.ExpansionMapRegion.TOMB_KINGS][GameData.Realm.NONE] = "CONTESTED"

----------------------------------------------------------------
-- Global Variables
----------------------------------------------------------------

EA_Window_WorldMap.ICON_ZONE       = 1
EA_Window_WorldMap.ICON_ZONE_MINI  = 2
EA_Window_WorldMap.ICON_FORT       = 3
EA_Window_WorldMap.ICON_FORT_MINI  = 4
EA_Window_WorldMap.ICON_CITY       = 5
EA_Window_WorldMap.ICON_CITY_MINI  = 6


----------------------------------------------------------------
-- Global Util Variables
----------------------------------------------------------------

function EA_Window_WorldMap.GetIconSliceForZone( zoneId, pairingId, controllingRealm, iconType )

    if( controllingRealm > 2 )
    then
        controllingRealm = 0
    end
    
    local prefix = ""
    local sliceName = ""
    local suffix = ""
    
    if( iconType == EA_Window_WorldMap.ICON_ZONE )
    then    
        prefix = "Zone-"    
        sliceName = PairingIconSliceNames[pairingId][controllingRealm]
              
    elseif( iconType == EA_Window_WorldMap.ICON_ZONE_MINI )
    then    
        prefix = "Wing-"    
        sliceName = PairingIconSliceNames[pairingId][controllingRealm]
        
    elseif( iconType == EA_Window_WorldMap.ICON_FORT or iconType == EA_Window_WorldMap.ICON_FORT_MINI )
    then    
        prefix = "Fort-"          
        if( iconType == EA_Window_WorldMap.ICON_FORT_MINI )
        then            
            suffix = "-MINI"
        end  
        
        -- Forts are displayed on all pairing maps, so use the correct pairing's artwork for this zone.
        local fortPairingId = EA_Window_WorldMap.PairingMapFortZones[ zoneId ] 
        sliceName = PairingIconSliceNames[fortPairingId][controllingRealm]
    
    elseif( iconType == EA_Window_WorldMap.ICON_CITY or iconType == EA_Window_WorldMap.ICON_CITY_MINI )
    then    
        prefix = "City-"          
        if( iconType == EA_Window_WorldMap.ICON_CITY_MINI )
        then            
            suffix = "-MINI"
        end  
        sliceName = PairingIconSliceNames[GameData.Pairing.EMPIRE_CHAOS][controllingRealm]      
    end
    
    if( sliceName == nil )
    then
        ERROR( L"GetIconSliceForZone: No Valid Slice Id for pairing="..pairingId..L" zone="..zoneId..L" controller="..controllingRealm )
    end
    
    -- Return the slice name
    return  prefix..sliceName..suffix
end


function EA_Window_WorldMap.UpdateIconForZone( zoneId, iconType, zoneWindowName )
    local zoneData = nil
    if ( EA_Window_WorldMap.pairingHasZoneControl[EA_Window_WorldMap.currentPairing] )
    then
        zoneData = GetCampaignZoneData( zoneId )    
    elseif (EA_Window_WorldMap.currentPairing == GameData.ExpansionMapRegion.TOMB_KINGS)
    then
        -- psuedo-campaign zone data so at least the zone icon looks right for Tomb Kings
        zoneData = {controllingRealm=GameData.Realm.NONE, pairingId=GameData.ExpansionMapRegion.TOMB_KINGS, 
                    tierId = EA_Window_WorldMap.CAMPAIGN_TIER, isLocked=false}
        
        local rrqData = RRQProgressBar.GetFirstQuestDataOfType(GameData.RRQDisplayType.ERRQDISPLAY_TOMB_KINGS)
        if rrqData ~= nil
        then
            if rrqData.realmWithAccess > 0 
            then
                zoneData.controllingRealm = rrqData.realmWithAccess
            end
            zoneData.isLocked = rrqData.paused
        end
        
    end
    
    if (zoneData == nil)
    then 
        return
    end   
                   
    local currentSliceName =  EA_Window_WorldMap.GetIconSliceForZone( zoneId, zoneData.pairingId, zoneData.controllingRealm, iconType )
    DynamicImageSetTextureSlice( zoneWindowName.."ControlIcon", currentSliceName  )

    -- If this is a Tier4 Zone, update the Lock
    if( (zoneData.tierId == EA_Window_WorldMap.CAMPAIGN_TIER) and (EA_Window_WorldMap.PairingMapWingZones[zoneId] == nil) )
    then        
                
        -- If this is a city zone, set the locks based the # forts captured
        if( GameDefs.ZoneCityIds[zoneId] ~= nil )
        then
            local cityData = GetCampaignCityData( GameDefs.ZoneCityIds[zoneId] )                
            WindowSetShowing(  zoneWindowName.."Lock1", cityData.numFortressesCaptured <= 1 )
            WindowSetShowing(  zoneWindowName.."Lock2", cityData.numFortressesCaptured == 0 )
        else                    
            -- Otherwise just use the zone control                 
            WindowSetShowing(  zoneWindowName.."ControlIconLock", zoneData.isLocked )        
        end        
    end
end
