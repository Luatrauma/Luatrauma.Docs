# Errors

As you write Lua code, you will inevitably encounter errors. This page lists the most common errors you might encounter, and how to fix them.

## Syntax errors

Syntax errors happen when you write code that doesn't follow the rules of the Lua language. These errors are usually easy to fix, as the error message will tell you exactly where the problem is. These type of errors are usually caused by typos, missing brackets, or incorrect use of operators, you can search for the error message in any search engine to find out what the error means.

## Attempt to index a nil value

One of the most common errors you will encounter is the "attempt to index a nil value" error. This error happens when you try to access a field of a variable that is `nil`. This can happen when you try to access a field of a variable that doesn't exist, or when you try to access a field of a variable that is `nil`. To fix this error, you need to make sure that the variable you are trying to access is not `nil`.

For example:
```lua
Hook.Add("character.created", "foobar", function(character)
    local affliction = character.CharacterHealth.GetAffliction("bleeding")
    
    -- if affliction == nil then return end -- uncomment to fix the error

    if affliction.Strength > 10 then
        print("Character is bleeding heavily!")
    end
end)
```

This code will throw an "attempt to index a nil value" error in some cases because the `GetAffliction` function might return `nil` if the affliction doesn't exist. To fix this error, you need to check if the `affliction` variable is not `nil` before trying to access to do anything with it.

## Attempt to call a nil value

Similarly to the attempt to index a nil value error, this one happens when you call a function that doesn't exist. For example:

```lua
somethingThatDoesntExist()
```

## Cannot access field xxxxx of userdata errors

This error happens when you try to access a field of an userdata object that doesn't exist or is not accessible. For example:

```lua
Hook.Add("character.created", "foobar", function(character)
    print(character.somethingThatDoesntExist)
end)
```

## Attempt to access instance member "xxxxx" from a static userdata

This error happens when you try to access a member (function or field) that requires an instance to be accessed, but you are trying to access it as if it was a static member. For example:

```lua
print(Character.Name)
```

`Character` is a static userdata object, you can only access static members from it, since it doesn't represent a specific instance of a character. To access instance members, you need to have an instance of a character. For example:

```lua
Hook.Add("character.created", "foobar", function(character)
    print(character.Name)
end)
```

## .NET related errors

These errors happen for a variety of reasons, but they are usually caused by calling a method on the C# side with a value it wasn't expecting, for example a nil value. Most of the time you will be given the line number in the Lua code that triggered the error, so you can easily find out what caused it.