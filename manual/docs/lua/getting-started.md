# Getting Started with Lua Modding

Here you will learn how to create your first Lua mod for Barotrauma, this guide assumes that you have some basic knowledge of Lua, if you don't, don't worry, Lua is a very simple language to learn, and you can learn it in a few hours provided you have some programming experience.

You can check these websites for more information about the Lua programming language itself: 

- [https://www.lua.org/manual/5.2/](https://www.lua.org/manual/5.2/) 
- [https://www.tutorialspoint.com/lua/lua_overview.htm](https://www.tutorialspoint.com/lua/lua_overview.htm) 


## Preparing your environment

The only thing you will need is a text editor, you don't want to be using Notepad! You can use any text editor that supports Lua, heres a few of them:

- <a href="https://code.visualstudio.com/" target="_blank">VSCode</a> with the <a href="https://marketplace.visualstudio.com/items?itemName=sumneko.lua" target="_blank">Lua extension</a>
- <a href="https://www.sublimetext.com/" target="_blank">Sublime Text</a></a>
- <a href="https://notepad-plus-plus.org/downloads/" target="_blank">Notepad++</a>

## Creating your first mod

First you need to have a standard Barotrauma mod, if you don't know how to create one, head over to the [Barotrauma Modding Guide](https://regalis11.github.io/BaroModDoc/Intro/ContentPackages.html) and follow the instructions there.

1. After you have created your mod, inside your mod folder, create a folder called **Lua**. This is where you will put all your Lua scripts. 
2. Inside the **Lua** folder, create a folder called **Autorun**, this is where you will put all your Lua scripts that will be executed automatically.
3. Inside the **Autorun** folder, create a new file called **test.lua**, open it in your text editor and type in `print("Hello, world!")`.
4. The path to your script should look something like this: `LocalMods/MyMod/Lua/Autorun/test.lua`.
5. Now you can begin testing your mod.

## When Lua mods get executed

Lua mods get executed in multiple situations, here's all of them:

- When entering the sub editor.
- When starting a new singleplayer game.
- When connecting to a server and finishing all mod downloads.
- When hosting a server, two instances of Lua will be executed, one for when YOUR client connects to the local server, and another for the local server itself.

## Testing your mod

You can test your mod by doing any of the actions previously mentioned and checking the debug console logs, do note, in the case of hosting a server, you will not see the first prints of the server, because the server will print those before your client joins the server.

To reload all Lua scripts, you can use the console commands `cl_reloadlua` and `reloadlua`, the latter reloads the Lua scripts for the server, and the former reloads the Lua scripts in your client. You can use these commands anytime, as long as your Lua script was built to handle being reloaded mid game.

Knowing all of this, in the Lua initialization console logs, you should be able to see the `Hello, world!` print message you added to your script!

## Next steps

Now that you have created your first Lua mod, you can start learning more about the Lua API and how to interact with the game code. You can start by checking the topics in the sidebar to the left. It's also important to check out the [API Reference](/api/lua/) to see everything that is available to you.