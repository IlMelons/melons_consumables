# [BETA] melons_consumables - Consumables Management Script
The project aims to move the consumables configuration back into the ox_inventory where all the item parameters are set

### Permissions:
The only permission allowed is to use it for your own server and apply the changes without commissioning third parties, all permissions for use other than this must be expressly requested to the author

### Example Item
``
["example"] = {
    label = "Example",
    weight = 100,
    stack = true,
    close = true,
    client = {
        anim = {dict = 'mp_player_intdrink', clip = 'loop_bottle'},
		prop = {model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5)},
		usetime = 2500,
    },
    server = {
        effect = {type = "alcol", name = "drunk", duration = 30},
        status = {hunger = 100, thirst = 20, stress = 0},
    },
},
``

### Dependencies & Start Order
- ensure `ox_lib`
- ensure `Framework`
- ensure `Framework Addons`
- ensure `ox_inventory`
- ensure `melons_consumables`

### Links:
- [Discord](https://discord.gg/RxpNTx2YKZ)
- [Ko-fi](https://ko-fi.com/ilmelons)