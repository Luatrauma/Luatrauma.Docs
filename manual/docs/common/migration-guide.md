Last Changed: 2026-04-09

# Migration Guide for Mods

This is the minimum work required Migration Guide for mods created before the LuaCsForBarotrauma refactor in the Spring Update, 2026. New mods or mods willing to completely migrate should make use of the [Assembly C# Tutorial](setup-assembly-csharp.md)


### C# Mods (In-Memory Scripts)

Important Note: There is a legacy loading system built-in if your project follows the old structure (Lua files are in `Lua/...`, Csharp files are in `CSharp/...`, binary assemblies are in `bin/<(Client|Server)>/...`, etc.). If you wish to deviate from this, you will need to create a [ModConfig.xml](development/modconfig.md) as per the API.

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
2. Add the following NuGet package references to your `Build.props` file (inside the `<Project></Project>` elements, separate from the `PropertyGroup`):
```xml
<ItemGroup>
  <PackageReference Include="LightInject" Version="6.6.4" />
  <PackageReference Include="OneOf" Version="3.0.271" />
  <PackageReference Include="FluentResults" Version="3.16.0" />
</ItemGroup>
```

#### **Option B**:
Migrate your project over to the [new template](setup-assembly-csharp.md), which is already setup for the new update.

---
### Lua Scripts

Required Changes:
<br/>
1. The below code references need to be replaced with its new equivalent:
> - "`GameMain.LuaCs`" is now "`LuaCsSetup.Instance`"
> - "`Client.ClientList`" is now "`ModUtils.Client.ClientList`"
> - "`Barotrauma.Networking.Client.ClientList`" is now "`ModUtils.Client.ClientList`"
> - "`ItemPrefab.GetItemPrefab`" is now "`ModUtils.ItemPrefab.GetItemPrefab`"

Important Notes:
 
2. Many new APIs require your content package as an argument, such as the `ConfigService`. You will need to call `trygetpackage("your package name")` in order to retrieve it.