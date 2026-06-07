-- File: KeySystem.lua
local ValidKeys = {["387382"]=true, ["388293"]=true, ["546431"]=true, ["491549"]=true, ["837293"]=true}
local ScriptUtama = "https://raw.githubusercontent.com/chenan55/build/refs/heads/main/by%20chenan"

local UI = Instance.new("ScreenGui", game.CoreGui)
local Box = Instance.new("TextBox", UI); Box.Size = UDim2.new(0,200,0,50); Box.Position = UDim2.new(0.5,-100,0.5,-25); Box.PlaceholderText = "Masukkan Key..."
local Btn = Instance.new("TextButton", Box); Btn.Size = UDim2.new(0,200,0,30); Btn.Position = UDim2.new(0,1,0); Btn.Text = "Login"

Btn.MouseButton1Click:Connect(function()
    if ValidKeys[Box.Text] then
        UI:Destroy()
        loadstring(game:HttpGet(ScriptUtama))()
    else
        Box.Text = "Salah!"
    end
end)
