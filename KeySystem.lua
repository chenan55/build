-- // CONFIGURASI WHITELIST (TULIS PERSIS SEPERTI USERNAME ASLI DI ROBLOX)
local AllowedUsers = {
    ["Ramadham_yt37"] = true, 
    ["Choraaaaa18"] = true,   
    ["Choraaaa18"] = true     
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

-- // SETUP UI WARNA PINK & KUNING
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "SecureAuth"
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 280, 0, 160); Frame.Position = UDim2.new(0.5, -140, 0.5, -80)
-- Warna Background: Hot Pink
Frame.BackgroundColor3 = Color3.fromRGB(255, 105, 180); Frame.BorderSizePixel = 0
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 12)

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 40); Title.Text = "AUTHENTICATION"; 
-- Warna Judul: Kuning
Title.TextColor3 = Color3.fromRGB(255, 235, 59)
Title.Font = Enum.Font.GothamBold; Title.BackgroundTransparency = 1

local UserDisplay = Instance.new("TextLabel", Frame)
UserDisplay.Size = UDim2.new(0, 240, 0, 30); UserDisplay.Position = UDim2.new(0.5, -120, 0.35, 0)
UserDisplay.Text = "Login sebagai: " .. PlayerName
-- Warna Teks Username: Putih agar tetap terbaca jelas di atas Pink
UserDisplay.TextColor3 = Color3.fromRGB(255, 255, 255)
UserDisplay.Font = Enum.Font.Gotham; UserDisplay.BackgroundTransparency = 1

local Btn = Instance.new("TextButton", Frame)
Btn.Size = UDim2.new(0, 240, 0, 40); Btn.Position = UDim2.new(0.5, -120, 0.65, 0)
Btn.Text = "MASUK"
-- Warna Tombol: Kuning
Btn.BackgroundColor3 = Color3.fromRGB(255, 235, 59)
-- Warna Teks Tombol: Pink Tua
Btn.TextColor3 = Color3.fromRGB(199, 21, 133)
Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 6)
Btn.Font = Enum.Font.GothamBold

-- // LOGIKA PENGECEKAN USERNAME 
Btn.MouseButton1Click:Connect(function()
    Btn.Text = "Memeriksa..."
    task.wait(0.8)
    
    if AllowedUsers[PlayerName] then
        Btn.Text = "AKSES DITERIMA!"
        Btn.BackgroundColor3 = Color3.fromRGB(0, 180, 0) -- Berubah Hijau
        Btn.TextColor3 = Color3.fromRGB(255, 255, 255) -- Teks Putih
        
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
        Btn.Text = "AKSES DITOLAK!"
        Btn.BackgroundColor3 = Color3.fromRGB(180, 0, 0) -- Berubah Merah
        Btn.TextColor3 = Color3.fromRGB(255, 255, 255) -- Teks Putih
        task.wait(1.5)
        
        -- Kembali ke warna Kuning & Pink jika gagal
        Btn.Text = "MASUK"
        Btn.BackgroundColor3 = Color3.fromRGB(255, 235, 59)
        Btn.TextColor3 = Color3.fromRGB(199, 21, 133)
    end
end)
