fx_version "cerulean"
game "gta5"
lua54 "yes"

name "melons_consumables"
author "IlMelons"
description "Consumables Management Script"
version "1.1.0"
repository "https://github.com/IlMelons/melons_consumables"

shared_scripts {
    "@ox_lib/init.lua",
}

client_scripts {
    "client/*.lua",
}

server_scripts {
    "bridge/server/*.lua",
    "server/*.lua",
    "checker.lua",
}
