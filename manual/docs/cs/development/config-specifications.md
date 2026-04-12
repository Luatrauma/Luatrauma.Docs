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
#### === Common Attributes === 

Attribute: `Name`
> - **Required**: Yes
> - **Type**: `String`
> - **Acceptable Values**: Alphanumeric characters, must start with a letter. An XML safe string is recommended.
> - **Description**: This is the name of the resource <i>unique to the ContentPackage (or empty).</i> It is used in most APIs when accessing a resource.

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
#### === Setting Types ===

> Type: `bool`

TBC

---
Sample Localization:
```xml
<?xml version="1.0" encoding="utf-8" ?>
<!-- ContentPackage Name="SampleSettings" -->
<infotexts language="English" nowhitespace="false" translatedname="English">
    <
</infotexts>
```