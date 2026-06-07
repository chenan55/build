--// XOR DECODE ENGINE
local function _x(s,k)
    local r = {}
    for i = 1, #s do
        r[i] = string.char(bit32.bxor(s:byte(i), k))
    end
    return table.concat(r)
end

--// ENCRYPTED KEYS (XOR 23)
local _raw = {
    "\111\121\118\120\119\120",
    "\110\120\121\121\117\118",
    "\97\99\100\99\98\97",
    "\116\115\114\113\112\111",
    "\88\89\90\91\92\93"
}

local _keys = {}
for i = 1, #_raw do
    _keys[_x(_raw[i],23)] = true
end

--// ENCRYPTED URL (XOR 7)
local _u_enc = "\25\30\29\29\24\93\... (dipendekin biar gak kepanjangan)"

local _url = _x(_u_enc,7)

--// FAKE LAYER (noise function)
local function _noise()
    local a = math.random(1,999)
    if a > 1000 then
        return "deadcode"
    end
end

--// UI CORE (disamarkan)
local g = game:GetService("CoreGui")

local s = Instance.new("ScreenGui")
s.Name = tostring(math.random(1000,9999))
s.Parent = g

local f = Instance.new("Frame")
f.Parent = s
f.Size = UDim2.new(0,280,0,180)
f.Position = UDim2.new(0.5,-140,0.5,-90)
f.BackgroundColor3 = Color3.fromRGB(15,15,15)

Instance.new("UICorner", f).CornerRadius = UDim.new(0,10)

local i = Instance.new("TextBox", f)
i.Size = UDim2.new(0,240,0,40)
i.Position = UDim2.new(0.5,-120,0.4,0)

local b = Instance.new("TextButton", f)
b.Size = UDim2.new(0,240,0,40)
b.Position = UDim2.new(0.5,-120,0.75,0)
b.Text = "VERIFY"

--// CONTROL FLOW OBFUSCATION
local function _check(k)
    _noise()

    local state = false

    repeat
        for key, _ in pairs(_keys) do
            if k == key then
                state = true
                break
            end
        end
        break
    until true

    return state
end

--// MAIN EXECUTION (hidden flow)
local function _main()
    b.Text = "CHECKING..."
    task.wait(0.6)

    if _check(i.Text) then

        local a = function()
            return pcall(function()
                return loadstring(game:HttpGet(_url))()
            end)
        end

        b.Text = "SUCCESS"
        task.wait(0.4)

        s:Destroy()
        a()

    else
        b.Text = "INVALID"
        task.wait(1)
        b.Text = "VERIFY"
    end
end

--// EVENT HOOK (disamarkan)
b["MouseButton1Click"]:Connect(_main)
