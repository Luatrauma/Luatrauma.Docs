Last Changed: 2026-04-09

# Migration Guide for Mods

This is the Migration Guide for mods created before the LuaCsForBarotrauma refactor in the Spring Update, 2026. New mods should make use of the [Assembly C# Tutorial](setup-assembly-csharp.md)


### C# Mods (In-Memory Scripts)

There are generally only four (4) text changes that need to be made for immediate compatibility. 

Required Changes:
<br/>
1. The below code references need to be replaced with its new equivalent:
> - "`GameMain.LuaCs`" is now "`LuaCsSetup.Instance`"
> - "`Client.ClientList`" is now "`ModUtils.Client.ClientList`"
> - "`Barotrauma.Networking.Client.ClientList`" is now "`ModUtils.Client.ClientList`"
> - "`ItemPrefab.GetItemPrefab`" is now "`ModUtils.ItemPrefab.GetItemPrefab`"

---
### C# Mods (Binary Assembly)
 
In addition to the changes under `In-Memory Scripts`, you will need to do the following: 

1. Download a fresh set of [Luatrauma reference dlls](https://github.com/MapleWheels/LuaCsForBarotrauma/releases/download/latest/luacsforbarotrauma_refs.zip) and place them in the `/Refs/` folder of your project.
2. Add the following NuGet package references to your `Build.props` file (inside of the `<Project></Project>` elements:
```xml
<PackageReference Include="LightInject" Version="6.6.4" />
<PackageReference Include="OneOf" Version="3.0.271" />
<PackageReference Include="FluentResults" Version="3.16.0" />
```

#### **Option B**:
Migrate your project over to the [new template](setup-assembly-csharp.md), which is already setup for the new update.

---
### Lua Scripts

:barodev: Be happy that @Evil Factory loves you.

