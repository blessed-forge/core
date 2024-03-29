<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" >

    <UiMod name="EASystem_ActionBarClusterManager" version="1.59" date="28/07/2018" >
        <Author name="EAMythic" email="" />
        <Description text="Tweaked by SCarfaXX DemiWise" />
        <Dependencies>
            <Dependency name="EASystem_WindowUtils" />
            <Dependency name="EASystem_LayoutEditor" />
            <Dependency name="EA_ActionBars" />
            <Dependency name="EA_MoraleWindow" />
            <Dependency name="EA_CareerResourcesWindow" />
            <Dependency name="EA_CastTimerWindow" />
            <Dependency name="EA_GrantedAbility" />
            <Dependency name="EA_TacticsWindow" />
        </Dependencies>
        <Files>
            <File name="Source/LayoutModes.lua" />
            <File name="Source/ActionBarClusterManager.lua" />
            <File name="Source/NewAbilityHandler.lua" />
        </Files>
        <SavedVariables>
            <SavedVariable name="ActionBarClusterSettings" />
            <SavedVariable name="ActionBarClusterPositions" />
        </SavedVariables>
        <OnInitialize>
            <CallFunction name="ActionBarClusterManager.Initialize" />
            <CallFunction name="NewAbilityHandler.Initialize" />
        </OnInitialize>             
        <OnShutdown>
            <CallFunction name="ActionBarClusterManager.Shutdown" />
            <CallFunction name="NewAbilityHandler.Initialize" />
        </OnShutdown>
        <OnUpdate>
            <CallFunction name="ActionBarClusterManager.Update" />
        </OnUpdate>        
    </UiMod>
</ModuleFile>    
