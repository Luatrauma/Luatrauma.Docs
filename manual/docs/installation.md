# Installation

This mod currently has 3 main ways you can install it, steam launch command, content package and manual installation. We will go through each one of them here.

## Steam launch command

The mod can be automatically installed and kept up to date via a special steam launch command, this is the easiest way to install the mod and it's recommended for most users. Here's how to do it:

1. Make sure your game is closed

2. Go to your Steam Library

3. Right Click Barotrauma and Click Properties

4. You should be able to see the Launch Options and below it a text box that you can enter text into

5. Enter the following code into the text box:

**Windows**: ```cmd /c "curl -L -z Luatrauma.AutoUpdater.win-x64.exe -o Luatrauma.AutoUpdater.win-x64.exe https://github.com/Luatrauma/Luatrauma.AutoUpdater/releases/download/latest/Luatrauma.AutoUpdater.win-x64.exe && start /b Luatrauma.AutoUpdater.win-x64.exe %COMMAND%"```

**Linux**: ```bash -c "wget https://github.com/Luatrauma/Luatrauma.AutoUpdater/releases/download/latest/Luatrauma.AutoUpdater.linux-x64 && chmod +x Luatrauma.AutoUpdater.linux-x64 && ./Luatrauma.AutoUpdater.linux-x64 %command%"```

**MacOS**: ```/bin/zsh -c "cd Barotrauma.app/Contents/MacOS && /usr/bin/curl -LOR https://github.com/Luatrauma/Luatrauma.AutoUpdater/releases/download/latest/Luatrauma.AutoUpdater.osx-x64 && chmod +x Luatrauma.AutoUpdater.osx-x64 && ./Luatrauma.AutoUpdater.osx-x64 %command%/Contents/MacOS/Barotrauma"```

And you are done. Now every time you launch the game, the mod will be automatically installed and kept up to date. If you want to uninstall the mod, just remove the launch command and verify the integrity of the game files.

## Content package

You can also install this mod by downloading the content package on the steam workshop, this used to be the old way to install the mod before the steam launch command was introduced, but it's still a valid way to install the mod.

1. Go to the steam workshop page of the mod: `https://steamcommunity.com/workshop/filedetails/?id=2559634234`

2. Click the subscribe button

3. Open the game, go to the mods tab and enable the mod

4. Now, when hosting a server, you will need to select the LuaCs server executable

5. If all you want is server-side, then you can stop here, you are done, but if you want client-side, continue

6. While hosting a server with the server executable, press F3 and type `install_cl_lua` and press enter

7. Restart the game and you are done

Note, the client-side installation will be lost if you verify the integrity of the game files or if a new game update is released, so you will need to repeat the process if that happens. Also note that you need to keep the content package updated, otherwise you can run into issues.

## Manual installation

And lastly, you can manually install the mod by simply downloading the patch files and pasting them into your game files.

First you need to download the correct patch that corresponds to your platform, head over to `https://github.com/evilfactory/LuaCsForBarotrauma/releases/tag/latest` and choose which patch you want to install. For example, if I want to install the mod on my windows machine, I'll download `luacsforbarotrauma_patch_windows_client.zip`.

**If this patch is for a dedicated server, use the patch_XXXXXXX_server.zip version**

After downloading the patch file that you want to use, you will need to now find where your game files are located, you can do that by:

1. Going to your steam library

2. Right clicking Barotrauma

3. Clicking Manage -> Browse Local Files

4. Your file explorer should open with where your game files are located.

5. (MacOS) When going to the game files in MacOS, you will probably notice you aren't in the actual game files, you have to right click the Barotrauma application, and click "Show Package Contents", then navigate to Contents -> MacOS, this is where you will put the patch files.

Now, all you have to do is extract the patch files you downloaded, and paste their files into your game files folder (or in case of dedicated servers, where your server is installed), this should prompt you to replace a bunch of .dll files.

Note, as with the content package, you will need to reapply the patch files every time you verify the integrity of the game files or if a new game update is released.

If you are confused, there's this video showing how to install client-side manually on Windows:

<iframe width="560" height="315" src="https://www.youtube.com/embed/1T0srKPp5BI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Checking if the mod has been installed correctly

After installing the mod, you can test if it was successfully installed by testing the debug console (F3) commands: `cl_reloadluacs` (for client-side) or `reloadluacs` (for server-side, you need to be hosting a server), if the command is not recognized, then the mod was not installed correctly.