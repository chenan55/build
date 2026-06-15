-- // CONFIGURASI WHITELIST (WAJIB TULIS DENGAN HURUF KECIL SEMUA DI SINI)
local AllowedUsers = {
    ["Ramadham_yt37"] = true, -- Akun utama
    ["choraaaaa18"] = true,   -- Tambahan teman 1 (huruf kecil semua)
    ["choraaaa18"] = true     -- Tambahan teman 2 (huruf kecil semua)
}

local ScriptUtama = "https://raw.githubusercontent.com/chenan55/build/refs/heads/main/Script%20gurun"
local ScriptKedua = "https://raw.githubusercontent.com/chenan55/build/refs/heads/main/by%20chenan" 

-- // MENDAPATKAN USERNAME ROBLOX
local Player = game:GetService("Players").LocalPlayer
local PlayerName = Player.Name 

-- // FUNGSI UNTUK MEMUAT SEMUA SCRIPT
local function LoadAllScripts()
    local success1, result1 = pcall(function() return loadstring(game:HttpGet(ScriptUtama))() end)
    if not success1 then warn("Gagal memuat Script Utama: " .. tostring(result1)) end
    
    local success2, result2 = pcall(function() return loadstring(game:HttpGet(ScriptKedua))() end)
    if not success2 then warn("Gagal memuat Script Kedua: " .. tostring(result2)) end
end

-- // SETUP UI MODERN
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "SecureAuth"
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 280, 0, 160); Frame.Position = UDim2.new(0.5, -140, 0.5, -80)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20); Frame.BorderSizePixel = 0
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 12)

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 40); Title.Text = "AUTHENTICATION"; Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.GothamBold; Title.BackgroundTransparency = 1

local UserDisplay = Instance.new("TextLabel", Frame)
UserDisplay.Size = UDim2.new(0, 240, 0, 30); UserDisplay.Position = UDim2.new(0.5, -120, 0.35, 0)
UserDisplay.Text = "Login sebagai: " .. PlayerName
UserDisplay.TextColor3 = Color3.fromRGB(200, 200, 200)
UserDisplay.Font = Enum.Font.Gotham; UserDisplay.BackgroundTransparency = 1

local Btn = Instance.new("TextButton", Frame)
Btn.Size = UDim2.new(0, 240, 0, 40); Btn.Position = UDim2.new(0.5, -120, 0.65, 0)
Btn.Text = "MASUK"; Btn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
Btn.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 6)
Btn.Font = Enum.Font.GothamBold

-- // LOGIKA PENGECEKAN USERNAME (CASE-INSENSITIVE)
Btn.MouseButton1Click:Connect(function()
    Btn.Text = "Memeriksa..."
    task.wait(0.8)
    
    -- Mengubah username player menjadi huruf kecil semua untuk dicocokkan
    local PlayerNameLower = string.lower(PlayerName)
    
    -- Mengecek apakah Username (yang sudah dikecilkan) ada di daftar
    if AllowedUsers[PlayerNameLower] then
        Btn.Text = "AKSES DITERIMA!"
        Btn.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
        
        -- Efek Fade out sebelum menghilang
        for i = 1, 0, -0.1 do
            Frame.BackgroundTransparency = 1 - i
            UserDisplay.TextTransparency = 1 - i
            Title.TextTransparency = 1 - i
            task.wait(0.05)
        end
        
        ScreenGui:Destroy()
        LoadAllScripts()
    else
        -- Jika Username tidak terdaftar
        Btn.Text = "AKSES DITOLAK!"
        Btn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
        task.wait(1.5)
        Btn.Text = "MASUK"
        Btn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    end
end)
