-- // CONFIGURASI WHITELIST (TULIS PERSIS SEPERTI USERNAME ASLI DI ROBLOX)
local AllowedUsers = {
    ["Ramadham_yt37"] = true, 
    ["choraaaaa18"] = true,   
    ["choraaaa18"] = true,
    ["whermyth"] = true
}

local ScriptUtama = "https://raw.githubusercontent.com/chenan55/build/refs/heads/main/Script%20gurun"

-- // MENDAPATKAN USERNAME ROBLOX SECARA OTOMATIS
local Player = game:GetService("Players").LocalPlayer
local PlayerName = Player.Name 

-- // FUNGSI UNTUK MEMUAT SCRIPT UTAMA
local function LoadAllScripts()
    local success1, result1 = pcall(function() return loadstring(game:HttpGet(ScriptUtama))() end)
    if not success1 then warn("Gagal memuat Script Utama: " .. tostring(result1)) end
end

-- // SETUP UI WARNA PINK & KUNING + WALLPAPER BUNGA
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "SecureAuth"
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 280, 0, 160); Frame.Position = UDim2.new(0.5, -140, 0.5, -80)
Frame.BackgroundColor3 = Color3.fromRGB(255, 105, 180); Frame.BorderSizePixel = 0
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 12)

-- // WALLPAPER BUNGA TRANSPARAN
local Wallpaper = Instance.new("ImageLabel", Frame)
Wallpaper.Size = UDim2.new(1, 0, 1, 0)
Wallpaper.BackgroundTransparency = 1
Wallpaper.Image = "rbxassetid://11419712392" 
Wallpaper.ImageTransparency = 0.6 
Wallpaper.ScaleType = Enum.ScaleType.Crop
Wallpaper.ZIndex = 0 
Instance.new("UICorner", Wallpaper).CornerRadius = UDim.new(0, 12)

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 40); Title.Text = "AUTHENTICATION"; 
Title.TextColor3 = Color3.fromRGB(255, 235, 59)
Title.Font = Enum.Font.GothamBold; Title.BackgroundTransparency = 1
Title.ZIndex = 1

local UserDisplay = Instance.new("TextLabel", Frame)
UserDisplay.Size = UDim2.new(0, 240, 0, 30); UserDisplay.Position = UDim2.new(0.5, -120, 0.35, 0)
-- DI SINI TEKS AKAN OTOMATIS MENYESUAIKAN NAMA AKUN MEREKA
UserDisplay.Text = "Login sebagai: " .. PlayerName
UserDisplay.TextColor3 = Color3.fromRGB(255, 255, 255)
UserDisplay.Font = Enum.Font.Gotham; UserDisplay.BackgroundTransparency = 1
UserDisplay.ZIndex = 1

local Btn = Instance.new("TextButton", Frame)
Btn.Size = UDim2.new(0, 240, 0, 40); Btn.Position = UDim2.new(0.5, -120, 0.65, 0)
Btn.Text = "MASUK"
Btn.BackgroundColor3 = Color3.fromRGB(255, 235, 59)
Btn.TextColor3 = Color3.fromRGB(199, 21, 133)
Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 6)
Btn.Font = Enum.Font.GothamBold
Btn.ZIndex = 1

-- // LOGIKA TOMBOL MASUK
Btn.MouseButton1Click:Connect(function()
    Btn.Text = "Memeriksa..."
    task.wait(0.8)
    
    -- Mengecek apakah Username asli ada di daftar AllowedUsers
    if AllowedUsers[PlayerName] then
        Btn.Text = "AKSES DITERIMA!"
        Btn.BackgroundColor3 = Color3.fromRGB(0, 180, 0) 
        Btn.TextColor3 = Color3.fromRGB(255, 255, 255) 
        
        for i = 1, 0, -0.1 do
            Frame.BackgroundTransparency = 1 - i
            Wallpaper.ImageTransparency = (0.6 * (1 - i)) + i 
            UserDisplay.TextTransparency = 1 - i
            Title.TextTransparency = 1 - i
            task.wait(0.05)
        end
        
        ScreenGui:Destroy()
        LoadAllScripts()
    else
        -- Jika Username tidak terdaftar, tombol akan merah dan menolak akses
        Btn.Text = "AKSES DITOLAK!"
        Btn.BackgroundColor3 = Color3.fromRGB(180, 0, 0) 
        Btn.TextColor3 = Color3.fromRGB(255, 255, 255) 
        task.wait(1.5)
        
        -- Tombol kembali normal lagi jika mereka iseng coba ngeklik terus
        Btn.Text = "MASUK"
        Btn.BackgroundColor3 = Color3.fromRGB(255, 235, 59)
        Btn.TextColor3 = Color3.fromRGB(199, 21, 133)
    end
end)
