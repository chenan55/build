-- // Konfigurasi
local ValidKeys = {["387382"]=true, ["388293"]=true, ["546431"]=true, ["491549"]=true, ["837293"]=true}
local ScriptUtama = "https://raw.githubusercontent.com/chenan55/build/refs/heads/main/by%20chenan"

-- // Membuat UI Utama
local UI = Instance.new("ScreenGui", game.CoreGui)
local MainFrame = Instance.new("Frame", UI); MainFrame.Size = UDim2.new(0, 250, 0, 150); MainFrame.Position = UDim2.new(0.5, -125, 0.5, -75); MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30); MainFrame.Active = true; MainFrame.Draggable = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)

-- // Input Box
local Box = Instance.new("TextBox", MainFrame); Box.Size = UDim2.new(0, 210, 0, 40); Box.Position = UDim2.new(0.5, -105, 0.3, 0); Box.PlaceholderText = "Masukkan Key..."; Box.BackgroundColor3 = Color3.fromRGB(45, 45, 45); Box.TextColor3 = Color3.new(1,1,1); Box.Font = Enum.Font.Gotham; Box.Text = ""
Instance.new("UICorner", Box).CornerRadius = UDim.new(0, 6)

-- // Tombol Login
local Btn = Instance.new("TextButton", MainFrame); Btn.Size = UDim2.new(0, 210, 0, 40); Btn.Position = UDim2.new(0.5, -105, 0.7, 0); Btn.Text = "LOGIN"; Btn.BackgroundColor3 = Color3.fromRGB(0, 150, 255); Btn.TextColor3 = Color3.new(1,1,1); Btn.Font = Enum.Font.GothamBold
Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 6)

-- // Logika & Feedback
Btn.MouseButton1Click:Connect(function()
    if ValidKeys[Box.Text] then
        Btn.Text = "SUCCESS!"
        Btn.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        task.wait(0.5)
        UI:Destroy()
        loadstring(game:HttpGet(ScriptUtama))()
    else
        Box.Text = "KEY SALAH!"
        Btn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        task.wait(1)
        Box.Text = ""
        Btn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
        Btn.Text = "LOGIN"
    end
end)
