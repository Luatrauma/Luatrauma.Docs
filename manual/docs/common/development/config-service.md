# Config Service API

Last Updated: 2026-04-09<br/>

The [Config Service](https://github.com/evilfactory/LuaCsForBarotrauma/blob/develop/Barotrauma/BarotraumaShared/SharedSource/LuaCs/_Services/_Interfaces/IConfigService.cs) allows you to create, load, save settings and synchronize them between clients and the server. Settings are also available to players to change in the in-game settings menu.

---
### Getting Started

The convention/workflow is as follows:
<br/>
> A. Define your settings in config XML file defined in [ModConfig.xml](modconfig.md). Use the `Target` attribute to limit to Client/Server as needed by the type of settings.
<br/>
> B. Define your localizations (display texts) for your settings in an `Infotexts` XML file (vanilla Barotrauma) following the conventions listed below.
<br/>
> C. Access/Modify the instance of your setting in code. 


---
### Part A: Defining Your Settings

Note: The project structure/format of the below tutorial follows the [LuaCsModTemplate](https://github.com/Luatrauma/LuaCsModTemplate). Adapt it to your needs.

<br/>**Step 1**: In your ContentPackage, create an *empty* XML file to hold your settings. If you are using the [LuaCsModTemplate](https://github.com/Luatrauma/LuaCsModTemplate), this is already done for you.
> It is recommended that you store it in `%ModDir%/Config/<filename>.xml`. Having a structured project makes will make things easier as your project grows in size.

<br/>**Step 2**: Add this to your `ModConfig.xml` file. Example:
```xml 
<?xml version="1.0" encoding="UTF-8" ?>
<ModConfig>
    <Config File="%ModDir%/Config/<filename>.xml" />
</ModConfig>
```

<br/>**Step 3**: Open the config XML file you created and start with this format:
```xml
<?xml version="1.0" encoding="utf-8"?>
<!-- Shared settings -->
<Configuration>
        
</Configuration>
```

<br/>**Step 4**: Now it's time to define your settings. Select one of the listed settings types in the [Specifications](config-specifications.md) section and enter them inside the `Configuration` element. Example (string): 
<br/>
```xml
<?xml version="1.0" encoding="utf-8"?>
<!-- Shared settings -->
<Configuration>
    <Setting Name="AStringOfAllTime" Type="string" Value="WhatWereYouExpecting?"/>
</Configuration>
```

---
### Part B: Define Localization/User Display Texts

<br/>**Step 1**: Now we need to define the text that will display to the user. To do that we need to use a vanilla Barotrauma `infotexts` XML file. Create an empty XML file in your ContentPackage.
> - It is recommended that you store it in `%ModDir%/Texts/<filename>.xml`. Having a structured project makes will make things easier as your project grows in size.
> - The following example shows English texts, adapt it to your language of choice.


<br/>**Step 2**: Add it to your `filelist.xml`:
```xml
<?xml version="1.0" encoding="utf-8"?>
<contentpackage name="MyModName" modversion="1.0" corepackage="false">
    <Text file="%ModDir%/Texts/English.xml" />
</contentpackage>
```

<br/>**Step 3**: Inside the XML file, start with the following:
```xml
<?xml version="1.0" encoding="UTF-8" ?>
<infotexts language="English" nowhitespace="false" translatedname="English">
    
</infotexts>
```

<br/>**Step 4**: Now let's add the three (3) typical localizations for a setting (only `DisplayName` is required):
```xml
<?xml version="1.0" encoding="UTF-8" ?>
<infotexts language="English" nowhitespace="false" translatedname="English">
    <!-- AStringOfAllTime -->
    <MyModName.AStringOfAllTime.DisplayName>A String of No Time</MyModName.AStringOfAllTime.DisplayName>
    <MyModName.AStringOfAllTime.DisplayCategory>Sample</MyModName.AStringOfAllTime.DisplayCategory>
    <MyModName.AStringOfAllTime.Tooltip>Imagine if</MyModName.AStringOfAllTime.Tooltip>
</infotexts>
```

The localization names are defined as follows:
- DisplayName: "[{XmlSafePackageName}](https://learn.microsoft.com/en-us/dotnet/api/system.xml.xmlconvert.encodelocalname?view=net-10.0).{settingName}.DisplayName"
- DisplayCategory: "[{XmlSafePackageName}](https://learn.microsoft.com/en-us/dotnet/api/system.xml.xmlconvert.encodelocalname?view=net-10.0).{settingName}.DisplayCategory"
- Tooltip: "[{XmlSafePackageName}](https://learn.microsoft.com/en-us/dotnet/api/system.xml.xmlconvert.encodelocalname?view=net-10.0).{settingName}.Tooltip"

Full details on this can be found in the [Specifications](config-specifications.md) section. 

---
### Part C: Using your Settings

> Verification: Before continuing, go into the game, with your mod enabled in the mods list, and ensure that your settings above are displaying in the Settings Menu under the `ModGameplaySettings` menu.

More examples can be found on the [Specifications](config-specifications.md) page.

Example (C#):
```csharp
public partial class Plugin : IAssemblyPlugin
{
    // These are automatically assigned by the plugin service after the Constructor is called
    public IConfigService ConfigService { get; set; }
    public IPluginManagementService PluginService { get; set; }
    public ILoggerService LoggerService { get; set; }
    
    private ContentPackage _myPackage;
    public ISettingBase<string> AStringOfAllTime;
    
    public void Initialize()
    {
        // When your plugin is loading, use this instead of the constructor for code relying on
        // the services above.
        
        // Put any code here that does not rely on other plugins.
        
        // Get your ContentPackage
        if (!PluginService.TryGetPackageForPlugin<Plugin>(out _myPackage))
        {
            LoggerService.LogError("Failed to find package!");
            return;
        }

        // Get your setting's instance.
        if (!ConfigService.TryGetConfig(_myPackage, "AStringOfAllTime", out AStringOfAllTime))
        {
            LoggerService.LogError("Failed to find config!");
            return;
        }
        
        // Let's log the value
        LoggerService.Log($"Value={AStringOfAllTime.Value}");
        
        // Lets write a value
        AStringOfAllTime.TrySetValue("No!");
        
        // Let's save it to storage
        ConfigService.SaveConfigValue(AStringOfAllTime);
    }

    /* ...other code. */
}
```

Example (Lua):
```lua
-- TO BE COMPLETED by @EvilFactory
```