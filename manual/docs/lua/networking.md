# Networking

Networking is a complex topic, but we will try to go through it as simply as possible.

## Whats a Server?

A server is a computer program or device that provides a service to another computer program and its user, also known as the client. In Barotrauma, the server is the one who hosts the game and is responsible for syncing the game state between all clients. When you host a server through the in game buttons, what effectively happens is that the game starts up a process called `DedicatedServer.exe`, and then tells your game to connect to it.

## Whats a Client?

A client is a piece of computer hardware or software that accesses a service made available by a server. In Barotrauma, the client is your game itself, it's what connects to servers and receives the game state from the server.

## How do I deal with this in Lua?

Your Lua code can be running on the server or the client, and you need to be aware of this when writing your code. You can check if you are running on the server or the client by checking the global variables `SERVER` and `CLIENT`. Both of these variables are **NEVER** true at the same time.

You can also check if you are running in singleplayer or multiplayer by checking the global variables `Game.IsSingleplayer` and `Game.IsMultiplayer`. On singleplayer, **SERVER** is never true. And if you for some reason want to know if you are running inside a Dedicated Server, you can use `Game.IsDedicated`.

## Sending Network Messages

Networking messages are used to send data between the server and the client, they are your primary way of syncing data between the server and the client.

### From Client to Server

```lua
if CLIENT then
    -- send from client to server
    local message = Networking.Start("foobar")
    message.WriteString("hello")
    Networking.Send(message)
end

if SERVER then
    -- receive in server
    Networking.Receive("foobar", function(message, client)
        print(client.Name .. " sent " .. message.ReadString())
    end)
end
```

### From Server to Client

```lua
if CLIENT then
    Networking.Receive("foobar", function(message)
        print(message.ReadString())
    end)
end

if SERVER then
    -- send from server to client
    local message = Networking.Start("foobar")
    message.WriteString("hello")

    -- The second argument is the client you want to send the message to, if you leave it nil, it will send to all clients
    Networking.Send(message, Client.ClientList[1].Connection)
end
```

## Serializable Properties

Serializable Properties are special class members in Barotrauma that are able to be synced with clients (and also with the server in some cases), they are very useful for when you want to change a property but don't want to write any client-side code.

Example showing how to sync the sprite color of an item without any client-side code:

```lua
local item = ...

item.SpriteColor = Color(0, 0, 255, 255)

local property = item.SerializableProperties[Identifier("SpriteColor")]
Networking.CreateEntityEvent(item, Item.ChangePropertyEventData(property, item))
```

This is also possible to do with item components, changing the light color of a light component:

```lua
local item = ...
local light = item.GetComponentString("LightComponent")

light.LightColor = Color(0, 0, 255, 255)

local property = light.SerializableProperties[Identifier("LightColor")]
Networking.CreateEntityEvent(item, Item.ChangePropertyEventData(property, light))    
```
