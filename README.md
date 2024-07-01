# Dependencies
These are the basic dependencies for the script unless you want to configure it to work for other things!

- [QB-TARGET](https://github.com/qbcore-framework/qb-target)
- [PS-INVENTORY](https://github.com/Project-Sloth/ps-inventory)
  - The script was developed and tested with PS-Inventory. It should also be compatible with QB-Inventory and other inventories those exports.

# Optional Dependencies
- [Roxwood by Ambitioneers](https://ambitioneers.tebex.io/package/5349456) 
  - For default processing location
- [Rainmad Oil Rig Heist](https://store.rainmad.com/package/5165368) 
  - Lets you acquire the oil barrels, though you can put them anywhere

# Future Plans
- Add More Drugs
- Add ESX Support
- Add More Compatibility 
- Add a drug with [CWD-FUEL](https://github.com/CodewaveDevelopment/cwd-fuel)
- Create detailed documentation for setup and customization
- More anticheat features

# Add These Items to `QB/SHARED/ITEMS`
```lua
-- CWD Black Tar Heroin 
["oil-barrel"] = {
    ["name"] = "oil-barrel",
    ["label"] = "Oil Barrel",
    ["weight"] = 100,
    ["type"] = "item",
    ["image"] = "oilbarrel.png",
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = false,
    ["combinable"] = nil,
    ["description"] = "Oil barrel :D"
},
["black-tar-heroin"] = {
    ["name"] = "black-tar-heroin",
    ["label"] = "Black Tar Heroin",
    ["weight"] = 100,
    ["type"] = "item",
    ["image"] = "blacktarheroin.png",
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = false,
    ["combinable"] = nil,
    ["description"] = "Linx Withaspoons Fav Drug!"
},    
["bth-baggy"] = {
    ["name"] = "bth-baggy",
    ["label"] = "BTH Baggy",
    ["weight"] = 100,
    ["type"] = "item",
    ["image"] = "bthbaggy.png",
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = false,
    ["combinable"] = nil,
    ["description"] = "MMMMM PURE LIQUID TARRRRRRRR"
},
```

# Add Images
Look in the "Assets" folder and drop the images into your inventory script.

# IF USING RM OIL RIG

Make sure to add "oil-barrel" into the items for your oil rig heist script loot table so players can actually acquire it.

