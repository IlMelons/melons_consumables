fx_version "cerulean"
game "gta5"
lua54 "yes"

name "melons_consumables"
author "IlMelons"
description "Consumables Management Script"
version "1.0.0"

shared_scripts {
    "@ox_lib/init.lua",
}

client_scripts {
    "client/*.lua",
}

server_scripts {
    "bridge/server/*.lua",
    "server/*.lua",
}