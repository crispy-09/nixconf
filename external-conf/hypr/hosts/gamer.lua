local home = os.getenv("HOME")
dofile(home .. "/.config/nixos/external-conf/hypr/common.lua")


hl.monitor({
    output   = "DP-2",
    mode     = "2560x1080@144",
    position = "1920x0",
    scale    = "1",
})

hl.monitor({
    output   = "DP-1",
    mode     = "2560x1440@60",
    position = "0x0",
    scale    = "1",
})

hl.config({
    input = {
        sensitivity = -0.5
    },
})
