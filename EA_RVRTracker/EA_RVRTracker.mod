<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" >

    <UiMod name="EA_RvRTracker" version="1.1" date="27/7/2018" >
        <Author name="EAMythic" email="" />
	<Description text="tweaked by SCarfaXX DemiWise" />
        <Dependencies>
            <!-- Dependency name="EASystem_GlyphDisplay" / !-->
            <Dependency name="EASystem_LayoutEditor" />
            <Dependency name="EASystem_Tooltips" />
            <Dependency name="EASystem_Utils" />
        </Dependencies>
        <Files>
            <File name="Source/RvRTracker.xml" />
        </Files>
        <OnInitialize>
            <CreateWindow name="EA_Window_RvRTracker" show="true" />
        </OnInitialize>
    </UiMod>

</ModuleFile>
