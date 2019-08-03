<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" >

    <UiMod name="EA_UiModWindow" version="3.1" date="27/06/2018" >
        <Author name="EAMythic" email="" />
        <Description text="tweaked by SCarfaXX DemiWise" />
        <Dependencies>        
            <Dependency name="EATemplate_DefaultWindowSkin" />     
            <Dependency name="EASystem_WindowUtils" />        
        </Dependencies>
        <Files>
            <File name="Source/UiModInfoTemplate.xml" />
            <File name="Source/UiModWindow.xml" />
            <File name="Source/UiModAdvancedWindow.xml" />
            <File name="Source/VersionMismatchWindow.xml" />
        </Files>
        <OnInitialize>
            <CreateWindow name="UiModWindow" show="false" />
            <CreateWindow name="UiModAdvancedWindow" show="false" />
            <CreateWindow name="UiModVersionMismatchWindow" show="false" />
        </OnInitialize>
        <SavedVariables>
            <SavedVariable name="UiModWindow.Settings" />
        </SavedVariables>            
    </UiMod>
    
</ModuleFile>    