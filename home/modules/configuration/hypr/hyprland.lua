-- 1. Pengaturan Monitor & Variabel Utama
hl.monitor = {
    ",preferred,auto,1"
}

local mod = "SUPER"

-- 2. PERBAIKAN BIND DISPATCHER (Sesuai API Resmi Lua Hyprland v0.55+)
-- Menjalankan aplikasi eksternal
hl.bind(mod .. " + T", hl.dsp.exec_cmd("kitty"))
hl.bind(mod .. " + E", hl.dsp.exec_cmd("thunar"))
hl.bind(mod .. " + R", hl.dsp.exec_cmd("rofi -show drun"))

-- Menjalankan fungsi window management internal compositor
hl.bind(mod .. " + Q", hl.dsp.window.close())                  -- DIBAIKI: Menggantikan killactive()
hl.bind(mod .. " + M", hl.dsp.exit())                          -- DIBAIKI: Mengeluarkan sesi compositor
hl.bind(mod .. " + V", hl.dsp.window.float({ action = "toggle" })) -- DIBAIKI: Menggantikan togglefloating()

-- 3. CARA AUTOSTART / EXEC-ONCE YANG BENAR DI LUA
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
end)

-- 4. Pengaturan Variabel Lingkungan (Environment)
hl.env = {
    "XCURSOR_SIZE,24",
    "HYPRCURSOR_SIZE,24"
}

-- 5. Pengaturan Konfigurasi Utama Desktop
hl.config({
    gestures = {
        workspace_swipe_create_new = true
    },

    input = {
        kb_layout = "us",
        follow_mouse = 1,
        touchpad = {
            natural_scroll = true
        }
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        vrr = 0
    },

    dwindle = {
        preserve_split = true
    }
})
