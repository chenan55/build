-- // CONFIGURASI
local ValidKeys = {["387382"]=true, ["388293"]=true, ["546431"]=true, ["491549"]=true, ["837293"]=true}
local ScriptUtama = "https://raw.githubusercontent.com/chenan55/build/refs/heads/main/by%20chenan"

-- // SETUP UI MODERN
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "SecureKey"
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 280, 0, 180); Frame.Position = UDim2.new(0.5, -140, 0.5, -90)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20); Frame.BorderSizePixel = 0
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 12)

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 40); Title.Text = "AUTHENTICATION"; Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.GothamBold; Title.BackgroundTransparency = 1

local Input = Instance.new("TextBox", Frame)
Input.Size = UDim2.new(0, 240, 0, 40); Input.Position = UDim2.new(0.5, -120, 0.4, 0)
Input.BackgroundColor3 = Color3.fromRGB(40, 40, 40); Input.PlaceholderText = "Masukkan Key..."
Input.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", Input).CornerRadius = UDim.new(0, 6)

local Btn = Instance.new("TextButton", Frame)
Btn.Size = UDim2.new(0, 240, 0, 40); Btn.Position = UDim2.new(0.5, -120, 0.75, 0)
Btn.Text = "VERIFIKASI"; Btn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
Btn.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 6)

-- // LOGIKA ANTI-BOBOL
Btn.MouseButton1Click:Connect(function()
    Btn.Text = "Memeriksa..."
    task.wait(0.8)
    
    if ValidKeys[Input.Text] then
        Btn.Text = "BERHASIL!"
        Btn.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
        
        -- Efek Fade out sebelum menghilang
        for i = 1, 0, -0.1 do
            Frame.BackgroundTransparency = 1 - i
            task.wait(0.05)
        end
        
        ScreenGui:Destroy()
        local success, result = pcall(function() return loadstring(game:HttpGet(ScriptUtama))() end)
        if not success then warn("Gagal memuat skrip utama: " .. tostring(result)) end
    else
        Btn.Text = "KEY SALAH!"
        Btn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
        task.wait(1.5)
        Btn.Text = "VERIFIKASI"
        Btn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    end
end)
