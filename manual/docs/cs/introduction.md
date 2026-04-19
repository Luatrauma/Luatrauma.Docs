# Introduction

LuaCsForBarotrauma allows modifications to be writen in CSharp, this type of mod is very powerful and can be used to extend the game's functionality in ways that are not possible even with Lua. But it comes with a cost, CSharp mods are not sandboxed and can be used to run malicious code, so it must be explicitly allowed by the user.

## Development

CSharp mods can be developed in two different ways, so called **In-Memory CSharp Mods** and **Assembly CSharp Mods**. Here is a brief explanation of both:

**In-Memory CSharp Mods** are mods that have all their .cs source files stored inside the mod folder and have their code compiled at runtime. This type of mod is the easier to setup since it only requires you to have the .cs files in the mod folder, but it comes at the cost of being slower to load and not having a full development setup with debugging. You can find more information on how to setup an In-Memory CSharp mod in the [In-Memory CSharp Mods](setup-in-memory-csharp.md) section.

**Assembly CSharp Mods** are mods that are compiled into a .dll file and loaded by the game at runtime. This type of mod is harder to setup since it requires you to have an IDE (such as Visual Studio) and a more complex project setup, but it comes with the benefit of you being able to take advantage of the .NET development experience fully. You can find more information on how to setup an Assembly CSharp mod in the [Assembly CSharp Mods](setup-assembly-csharp.md) section.