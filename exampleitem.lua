---@description Example Items for ox_inventory testings
return {
    ["testdrunk"] = {
        label = "Test Medium Drunk",
        weight = 100,
        stack = true,
        close = true,
        client = {
            anim = {dict = 'mp_player_intdrink', clip = 'loop_bottle'},
			prop = {model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5)},
			usetime = 2500,
            notification = "Test Medium Drunk",
        },
        server = {
            effect = {type = "alcol", name = "drunk", duration = 30},
            status = {hunger = 0, thirst = 20, stress = 0},
        },
    },
    ["testverydrunk"] = {
        label = "Test Very Drunk",
        weight = 100,
        stack = true,
        close = true,
        client = {
            anim = {dict = 'mp_player_intdrink', clip = 'loop_bottle'},
            prop = {model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5)},
            usetime = 2500,
            notification = "Test Very Drunk",
        },
        server = {
            effect = {type = "alcol", name = "verydrunk", duration = 60},
            status = {hunger = 0, thirst = 40, stress = 0},
        },
    },
    ["testondrugs"] = {
        label = "Test On Drugs",
        weight = 100,
        stack = true,
        close = true,
        client = {
            anim = {dict = 'mp_player_intdrink', clip = 'loop_bottle'},
            prop = {model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5)},
            usetime = 2500,
            notification = "Test On Drugs",
        },
        server = {
            effect = {type = "drugs", name = "ondrugs", duration = 30},
            status = {hunger = 0, thirst = 0, stress = 0},
        },
    },
    ["testonheavydrugs"] = {
        label = "Test On Heavy Drugs",
        weight = 100,
        stack = true,
        close = true,
        client = {
            anim = {dict = 'mp_player_intdrink', clip = 'loop_bottle'},
            prop = {model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5)},
            usetime = 2500,
            notification = "Test On Heavy Drugs",
        },
        server = {
            effect = {type = "drugs", name = "onheavydrugs", duration = 30},
            status = {hunger = 0, thirst = 0, stress = 0},
        },
    },
    ["testdoped"] = {
        label = "Test Doped",
        weight = 100,
        stack = true,
        close = true,
        client = {
            anim = {dict = 'mp_player_intdrink', clip = 'loop_bottle'},
            prop = {model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5)},
            usetime = 2500,
            notification = "Test Doped",
        },
        server = {
            effect = {type = "doping", name = "doped", duration = 30},
            status = {hunger = 0, thirst = 0, stress = 0},
        },
    },
}