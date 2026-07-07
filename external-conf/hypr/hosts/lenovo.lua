local home = os.getenv("HOME")
dofile(home .. "/.config/nixos/external-conf/hypr/common.lua")


hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1080@60",
    position = "0x0",
    scale    = "1",
})


hl.config({
    input = {
        sensitivity = 0
    },
})
