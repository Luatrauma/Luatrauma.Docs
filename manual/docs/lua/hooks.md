# Hooks

This is the primarily way to interact with the game code from Lua. Hooks are used to listen to events that happen in the game, and you can even call your own hooks from your own code.

## Adding hooks

Hooks can be added like this:

```lua
Hook.Add("chatMessage", "test", function(message, client)
    print(client.Name .. " has sent " .. message)
end)
```

## Calling hooks

You can also call hooks with the following code:

```lua
Hook.Call("myCustomEvent", {"some", "arguments", 123})
```

## XML Status Effect Hooks

A new XML Status Effect tag is also available to add hooks to status effects. 

```xml
<StatusEffect type="OnUse">
    <Hook name="doSomething" custom="thing" />
</StatusEffect>
```

```lua
Hook.Add("doSomething", function(effect, deltaTime, item, targets, worldPosition, element)
    print(effect, ' ', item)

    -- You can also access the XML custom parameters
    print(element.GetAttributeString("custom", "default value"))

    -- returning true will prevent the status effect from being applied
    return true
end)
```