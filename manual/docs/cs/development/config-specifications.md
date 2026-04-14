Updated: 2026-04-12

# Configuration Specifications

This page contains the specifications and definitions for the configuration service. Examples on usages and how to get started can be found [here](config-service.md).

<br/>

---
### XML Configuration

Sample Declaration:
```xml
<?xml version="1.0" encoding="utf-8" ?>
<!-- ContentPackage Name="SampleSettings" -->
<Configuration>
    <Settings>
        <Setting Name="Setting1Name" Type="bool" Value="true" />
    </Settings>
</Configuration>
```

<br/> 

--- 
### === Common Attributes === 

Attribute: `Name`
> - **Required**: Yes
> - **Type**: `String`
> - **Acceptable Values**: Alphanumeric characters, must start with a letter. Must be XML Element name compliant.
> - **Description**: This is the name of the resource <i>unique to the ContentPackage.</i> This is used when trying to retrieve the setting in code.

Attribute: `Type`
> - **Required**: Yes
> - **Type**: `String`
> - **Acceptable Values**: One of the strings specified in the '*Setting Types*' section below.
> - **Description**: This is the type of setting to create.

Attribute: `Value`
> - **Required**: Yes
> - **Type**: `typeof(Attribute.Type)`
> - **Default Value**: `default(T)` (of Type)
> - **Acceptable Values**: string representation of the underlying type, as compatible with IConvertible.
> - **Description**: This is the default value of the setting.

Attribute: `ReadOnly`
> - **Required**: No
> - **Type**: `boolean`
> - **Default Value**: `false`
> - **Acceptable Values**: `true` or `false`.
> - **Description**: Whether the setting can be changed as runtime. When false, can only be changed by editing the XML. Note: Can be changed by loading a saved value from disk.

Attribute: `AllowChangesWhileExecuting`
> - **Required**: No
> - **Type**: `boolean`
> - **Default Value**: `true`
> - **Acceptable Values**: `true` or `false`.
> - **Description**: Whether the setting can be changed while plugin/mod code is running. Typically used to ensure that code cannot change a value, only a user can out of game.

Attribute: `ShowInMenus`
> - **Required**: No
> - **Type**: `boolean`
> - **Default Value**: `true`
> - **Acceptable Values**: `true` or `false`.
> - **Description**: Whether the setting is visible to users in the Settings Menu. If false, can still be changed from the command line via `cfg_setvalue`.

Attribute: `NetSync`
> **[Broken/Bug]**
> - **Required**: No
> - **Type**: `Enum`, `typeof(NetSync)`
> - **Default Value**: `None`
> - **Acceptable Values**: `None`, `TwoWay`, `ServerAuthority`.
> - **Description**: The synchronization rules of the setting when in multiplayer.
> - **Notes**:
>   - `None`: No synchronization.
>   - `TwoWay`: Clients and the Server are synchronized. All members have authority to change the setting's value.
>   - `ServerAuthority`: Clients and the Server are synchronized. Only the server or clients with the `ManageSettings` permission can change this setting.

---
### === Setting Types ===
 
---
Type: `ISettingBase<T>`
> Supported Types (Code/T): `bool`,`byte`,`sbyte`,`ushort`,`short`,`uint`,`int,`,`ulong`,`long`,`float`,`double`,`string`.<br/>
> `Type` Names (XML): `bool`,`byte`,`sbyte`,`ushort`,`short`,`uint`,`int,`,`ulong`,`long`,`float`,`double`,`string`.<br/>
> Required Attributes: Name, Type, Value. <br/>
> Supported Attributes: Name, Type, Value, ReadOnly, AllowChangesWhileExecuting, ShowInMenus. <br/>

Sample Usage:
```xml
<!-- Settings.xml -->
<Setting Name="Sample" Type="bool" Value="true" />
``` 
```csharp
/* C# */
// class vars
public ILoggerService Logger { get; set; }
public IConfigService ConfigService { get; set; }
ISettingBase<bool> myVar;

// Initialize()
ConfigService.TryGetConfig<ISettingBase<bool>>(mypackage, "Sample", out myVar);
myVar.OnValueChanged += (cfg) => 
{
    Logger.Log($"Value Set for {myVar.InternalName} at {myVar.Value}");
};
myVar.TrySetValue(true); // set in memory
ConfigService.SaveConfigValue(myVar); // save to disk
``` 
```lua
-- Lua
function onValueChanged(cfg)
    print("New value set: ", cfg.Value)
end

local success, myPackage = trygetpackage("SamplePackage")
local success2, var = ConfigService.TryGetConfig(SettingBase.Bool, myPackage, "Sample")

if success2 then
    var.OnValueChanged.add(onValueChanged)
end 
``` 
 
---
Type: `ISettingList<T>`
> Supported Types (Code/T): `bool`,`byte`,`sbyte`,`ushort`,`short`,`uint`,`int,`,`ulong`,`long`,`float`,`double`,`string`.<br/> 
> `Type` Names (XML): `listBool`,`listByte`,`listSbyte`,`listUshort`,`listShort`,`listUint`,`listInt,`,`listUlong`,`listLong`,`listFloat`,`listDouble`,`listString`.<br/> 
> Required Attributes: Name, Type, Value. <br/> 
> Required Child Elements: `Values` <br/> 
> Supported Attributes: Name, Type, Value, ReadOnly, AllowChangesWhileExecuting, ShowInMenus. <br/> 
 
Sample Usage:
```xml
<!-- Settings.xml -->
<!-- Note: 'Value' attribute value must be present in values list. -->
<Setting Name="Sample" Type="listString" Value="help">
    <Values>
        <!-- Note: Values should be XML safe if localization support is used (optional) -->
        <Value Value="Option A"/>
        <Value Value="Option B"/>
        <Value Value="help"/>
        <Value Value="Option D"/>
    </Values>
</Setting>
```
```csharp
/* C# */
// class vars
public ILoggerService Logger { get; set; }
public IConfigService ConfigService { get; set; }
ISettingList<string> myVar;

// Initialize()
ConfigService.TryGetConfig<ISettingBase<string>>(mypackage, "Sample", out myVar);
myVar.OnValueChanged += (cfg) => 
{
    Logger.Log($"Value Set for {myVar.InternalName} at {myVar.Value}");
};
foreach (string option in myVar.Options)
{
    Logger.Log($"Possible option: {option}");
}
    
myVar.TrySetValue("Option A");  // set in memory
ConfigService.SaveConfigValue(myVar); // save to disk
```
```lua
-- Lua
function onValueChanged(cfg)
    print("New value set: ", cfg.Value)
end

local success, myPackage = trygetpackage("SamplePackage")
local success2, var = ConfigService.TryGetConfig(SettingBase.Bool, myPackage, "Sample")

if success2 then
    var.OnValueChanged.add(onValueChanged)
end 
```
 
--- 
**Type**: `ISettingRangeBase<T>`
> Supported Types (Code/T): `int,`,`float`.<br/> 
> `Type` Names (XML): `rangeInt,`,`rangeFloat`.<br/>
> Required Attributes: Name, Type, Value, Min, Max, Steps. <br/>
> Supported Attributes: Name, Type, Value, ReadOnly, AllowChangesWhileExecuting, ShowInMenus. <br/>

Sample Usage:
```xml
<!-- Settings.xml -->
<!-- Steps calculation = [(Max - Min)/Increment] + 1 -->
<Setting Name="Sample" Type="rangeFloat" Value="2.5" Min="0" Max="10" Steps="21"/>
``` 
```csharp
/* C# */
// class vars
public ILoggerService Logger { get; set; }
public IConfigService ConfigService { get; set; }
ISettingRangeBase<float> myVar;

// Initialize()
ConfigService.TryGetConfig<ISettingRangeBase<float>>(mypackage, "Sample", out myVar);
myVar.OnValueChanged += (cfg) => 
{
    Logger.Log($"Value Set for {myVar.InternalName} at {myVar.Value}");
    Logger.Log($"MinValue Set for {myVar.InternalName} at {myVar.MinValue}");
    Logger.Log($"MaxValue Set for {myVar.InternalName} at {myVar.MaxValue}");
};
ConfigService.SaveConfigValue(myVar);
``` 
```lua
-- Lua
function onValueChanged(cfg)
    print("New value set: ", cfg.Value)
end

local success, myPackage = trygetpackage("SamplePackage")
local success2, var = ConfigService.TryGetConfig(SettingBase.Bool, myPackage, "Sample")

if success2 then
    var.OnValueChanged.add(onValueChanged)
end 
``` 
 
---
### Localization

All localization makes use of vanilla Barotrauma's `infotexts` function. 

---
Sample Localization:
> Applies To: `ISettingBase<T>`, `ISettingRangeBase<T>`

Display Name Element Format: "`{XmlSafePackageName}`.`{SettingName}`.DisplayName" <br/>
Display Category Element Format: "`{XmlSafePackageName}`.`{SettingName}`.DisplayCategory" <br/>
Tooltip Element Format: "`{XmlSafePackageName}`.`{SettingName}`.Tooltip" <br/>
```xml
<?xml version="1.0" encoding="utf-8" ?>
<!-- ContentPackage Name="SampleSettings" -->
<infotexts language="English" nowhitespace="false" translatedname="English">
    <SampleSettings.SampleBool.DisplayName>Sample Display Name</SampleSettings.SampleBool.DisplayName>
    <SampleSettings.SampleBool.DisplayCategory>Samples</SampleSettings.SampleBool.DisplayCategory>
    <SampleSettings.SampleBool.Tooltip>This is a sample</SampleSettings.SampleBool.Tooltip>
</infotexts>
```
 
--- 
Sample Localization:
> Applies To: `ISettingList<T>`.

Display Name Element Format: "`{XmlSafePackageName}`.`{SettingName}`.DisplayName" <br/> 
Display Value Name Element Format: "`{XmlSafePackageName}`.`{SettingName}`.`{OptionName}`.DisplayName" <br/> 
Display Category Element Format: "`{XmlSafePackageName}`.`{SettingName}`.DisplayCategory" <br/> 
Tooltip Element Format: "`{XmlSafePackageName}`.`{SettingName}`.Tooltip" <br/> 
```xml
<?xml version="1.0" encoding="utf-8" ?>
<!--Sample list values: OptionA, OptionB -->
<!-- ContentPackage Name="SampleSettings" -->
<infotexts language="English" nowhitespace="false" translatedname="English">
    <SampleSettings.SampleBool.DisplayName>Sample Display Name</SampleSettings.SampleBool.DisplayName>
    <SampleSettings.SampleBool.DisplayCategory>Samples</SampleSettings.SampleBool.DisplayCategory>
    <SampleSettings.SampleBool.Tooltip>This is a sample</SampleSettings.SampleBool.Tooltip>
    <!-- Optional "Option" Values Localization -->
    <SampleSettings.SampleBool.OptionA.DisplayName>Is A</SampleSettings.SampleBool.OptionA.DisplayName>
    <SampleSettings.SampleBool.OptionB.DisplayName>Always B</SampleSettings.SampleBool.OptionB.DisplayName>
</infotexts>
```
 
--- 

### Config Service API

TBC, for now see [IConfigService](https://github.com/evilfactory/LuaCsForBarotrauma/blob/master/Barotrauma/BarotraumaShared/SharedSource/LuaCs/_Services/_Interfaces/IConfigService.cs) and [ILuaConfigService](https://github.com/evilfactory/LuaCsForBarotrauma/blob/master/Barotrauma/BarotraumaShared/SharedSource/LuaCs/_Services/_Lua/ILuaConfigService.cs) for the APIs available (C# uses both via/from `IConfigService`, Lua can only access the `ILuaConfigService` API).

For the `ISetting[Type]` variable interface itself, see [ISetting Type Definitions](https://github.com/evilfactory/LuaCsForBarotrauma/blob/master/Barotrauma/BarotraumaShared/SharedSource/LuaCs/Data/ISettingTypeDef.cs).