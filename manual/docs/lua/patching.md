# Patching

It's also possible to patch methods in the game code. This is useful for altering of something in the game that doesn't have a hook. This is done by using the `Hook.Patch` function.

## Postfix

Postfix patches are functions that get called after the original method executes.

```lua
Hook.Patch("Barotrauma.CharacterInfo", "IncreaseSkillLevel", function(instance, ptable)
  print(string.format("%s gained % xp", instance.Character.Name, ptable["increase"]))
end, Hook.HookMethodType.After)
```

## Prefix

Prefixes are functions that get called before the original method executes.
For more advanced use cases, they can also be used to modify the incoming
parameters or prevent the original method from executing.

```lua
Hook.Patch(
  "Barotrauma.Character",
  "CanInteractWith",
  {
    "Barotrauma.Item",
     -- ref/out parameters are supported
     "out System.Single",
     "System.Boolean"
  },
  function(instance, ptable)
    -- This prevents the original method from executing, so we're
    -- effectively replacing the method entirely.
    ptable.PreventExecution = true
    -- Modify the `out System.Single` parameter
    ptable["distanceToItem"] = Single(50)
    -- This changes the return value to "null"
    return nil
  end, Hook.HookMethodType.Before)
```
