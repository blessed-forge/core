<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" >

    <UiMod name="EA_GroupWindow" version="1.3" date="02/07/2018" >
        <Author name="EAMythic" email="" />
        <Description text="tweaked by SCarfaXX DemiWise" />
        <Dependencies>                
            <Dependency name="EATemplate_DefaultWindowSkin" />
            <Dependency name="EASystem_Utils" />
            <Dependency name="EASystem_WindowUtils" />
            <Dependency name="EA_LegacyTemplates" />
            <Dependency name="EASystem_Tooltips" />
            <Dependency name="EASystem_LayoutEditor" />
            <Dependency name="EA_PlayerStatusWindow" />
            <Dependency name="EA_PlayerMenu" />
        </Dependencies>
        <Files>        
            <File name="Source/GroupWindow.xml" />
        </Files>
        <OnInitialize>
            <CreateWindow name="GroupWindow" show="true" />
            <CallFunction name="GroupWindow.Initialize" />
        </OnInitialize>             
    </UiMod>
    
</ModuleFile>    