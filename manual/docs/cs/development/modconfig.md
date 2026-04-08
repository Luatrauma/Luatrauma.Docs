# ModConfig.xml and the LuaCs APIs

Last Updated: 2026-04-09<br/>
### Overview
`ModConfig.xml` (located in `Assets/Content/ModConfig.xml` in the modding template) should be in the top-level directory of your ContentPackage folder. This file is used by LuaCsForBarotrauma to declare all of your files that need to be loaded.

Example:
```xml
<?xml version="1.0" encoding="utf-8" ?>
<ModConfig>
    <Assembly Folder="%ModDir%/CSharp/Client" Target="Client" IsScript="true" UseInternalAccessName="true" />
    <Assembly File="%ModDir%/bin/Server/Windows/MyMod.dll" Target="Server" Platform="Windows" />
    <Config File="%ModDir%/Config/SettingsShared.xml" />
    <Config File="%ModDir%/Config/SettingsClient.xml" Target="Client"/>
    <Lua Folder="%ModDir%/Lua/Server" Target="Server" IsAutorun="true" />
</ModConfig>
```
<br/>

---
There are four (4) types of content supported by LuaCsForBarotrauma at the time of this article:
- [Assembly]()
>  - Supported XML Attributes: 
>    - Name, File, Folder, LoadPriority, Optional, Platform, Target, FriendlyName, IsScript, UseInternalAccessName, IsReferenceModeOnly, IsFileRequired.
 
- [Config](config-service.md)
>  - Supported XML Attributes:
>      - Name, File, Folder, LoadPriority, Optional, Platform, Target, IsFileRequired.
 
-[Lua]()
>  - Supported XML Attributes:
>      - Name, File, Folder, LoadPriority, Optional, Platform, Target, IsAutorun, IsFileRequired.
 
- [Style]()
>  - **Supported targets**: (Client)
>  - Supported XML Attributes:
>      - Name, File, Folder, LoadPriority, Optional, Platform, Target, IsFileRequired.

<br/>

---
### Attribute Descriptions

Elements/files/content declared in a `ModConfig.xml` file support [XML Attributes](https://www.w3schools.com/xml/xml_attributes.asp) as listed above, with the following functionality:


Attribute: `Name`
> - **Required**: No
> - **Type**: `String`
> - **Default Value**: `string.Empty`
> - **Acceptable Values**: Alphanumeric characters.
> - **Description**: This is the name of the resource <i>unique to the ContentPackage (or empty).</i> It is used in most APIs when accessing a resource.

Attribute: `File`
> - **Required**: Yes* 
> - **Type**: `String`
> - **Acceptable Values**: Valid path to a file.
> - **Description**: Specifies the filepath to be loaded. Can be either a relative filepath by starting with `%ModDir%`, or an absolute path to a file.
> - **Notes**: *This attribute and/or the `Folder` attribute are required on a resource. You can use one or both.

Attribute: `Folder`
> - **Required**: Yes*
> - **Type**: `String`
> - **Acceptable Values**: Valid path to a folder.
> - **Description**: Specifies the folder to be loaded. Can be either a relative folder path by starting with `%ModDir%`, or an absolute path to a folder. All files in the folder and subfolders will be added if they match the required filetypes.
> - **Notes**: *This attribute and/or the `File` attribute are required on a resource. You can use one or both.

Attribute: `Platform`
> - **Required**: No
> - **Type**: `String`
> - **Default Value**: `Any`
> - **Acceptable Values**: `Linux`,`OSX`,`Windows`,`Any`
> - **Description**: Specifies the platform that this file should be loaded on.

Attribute: `Target`
> - **Required**: No
> - **Type**: `String`
> - **Default Value**: `Any`
> - **Acceptable Values**: `Client`,`Server`,`Any`
> - **Description**: Specifies the target that this file should be loaded on.

Attribute: `LoadPriority`
> - **Required**: No
> - **Type**: `Int32`
> - **Default Value**: 0
> - **Description**: Specifies the order in which files of the same content type are loaded. Lower value is higher priority.

Attribute: `IsFileRequired`
> - **Required**: No
> - **Type**: `Boolean`
> - **Default Value**: `false`
> - **Acceptable Values**: `true`,`false`
> - **Description**: Allows the ContentPackage to be loaded even if the file is missing from the location. Otherwise, missing files in `ModConfig.xml` will cause the ContentPackage to not be loaded.
---
**[Lua] Only**:<br/>
Attribute: `IsAutorun`
> - **Required**: No
> - **Type**: `Boolean`
> - **Default Value**: `false`
> - **Acceptable Values**: `true`,`false`
> - **Description**: Specifies that the script file should be executed automatically (ie. autorun lua files).
---
**[Assembly] Only**:<br/>
Attribute: `IsScript`
> - **Required**: No
> - **Type**: `Boolean`
> - **Default Value**: `false`
> - **Acceptable Values**: `true`,`false`
> - **Description**: Indicates that the following is a C# source/script file (not a binary/dll). 

Attribute: `UseInternalAccessName`
> - **Required**: No
> - **Required Attributes**: `IsScript`
> - **Type**: `Boolean`
> - **Default Value**: `false`
> - **Acceptable Values**: `true`,`false`
> - **Description**: Specifies that the C# script should be compiled with `InternalAccess`. Mainly for use with legacy scripts.

Attribute: `IsReferenceModeOnly`
> - **Required**: No
> - **Type**: `Boolean`
> - **Default Value**: `false`
> - **Acceptable Values**: `true`,`false`
> - **Description**: `[InternalUseOnly]` Specifies that the file should only be used for compilation of scripts and not executed.