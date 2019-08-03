<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" >

    <UiMod name="EA_UiDebugTools" version="1.1" date="29/07/2018" >
        <Author name="EAMythic" email="" />
        <Description text="tweaked by SCarfaXX DemiWise" />
	<Dependencies>        
            <Dependency name="EATemplate_DefaultWindowSkin" />        
        </Dependencies>
        <Files>        
            <File name="Source/Debug.lua" />
            <File name="Source/DebugWindow.xml" />
        </Files>
        <OnInitialize>
            <CreateWindow name="DebugWindow" show="false" />
        </OnInitialize>             
        <SavedVariables>
            <SavedVariable name="DebugWindow.Settings" />
        </SavedVariables>
    </UiMod>
    
</ModuleFile>    