local module = {
    CLIENT_VAR = {
        PlayerSpeed = 35;
        JumpHeight = 15;
        MaxHealth = 100;
        CurrentMap = "";
        CurrentWeapon = "";
        CurrentSaveFile = "";
        KeyBindings = {
            [Enum.KeyCode.E] = "input_interact";
            [Enum.KeyCode.LeftShift] = "input_dash";
            [Enum.KeyCode.Backquote] = "input_devconsole";
            [Enum.KeyCode.One] = "inventory"
        };
        Custom = {
            MaxStamina = 3;
            Stamina = 3
        };
    };
    SERVER_VAR = {
        MaxMultiplayerHealth = 100;
        JumpHeight = 5;
        PlayerSpeed = 35;
        CurrentMap = ""
    };
    ENGINE_VAR = {
        TimeScale = 1;
        Gravity = 135;
        LVL_LOADINGCONFIG = {
            NO_TEX = {
                "trigger";
                "dev_collider";
                "ai_node";
            }
        };
        BakedWeaponList = {};
        WeaponList = {};
        BakedMapList = {};

    }
}

--[[VARIABLES]]

local LocalPlayer = game:GetService("Players").LocalPlayer
local Root = game:GetService("ReplicatedStorage")
local Debris = game:GetService("Debris")
local InputService = game:GetService("UserInputService")
--[[FUNCS]]

--[[ENGINE FUNCS]]

function module:DEVMAP(mapName:string?)
    
end

function module:CreateGUI(guiName:string)
    local GUI:ScreenGui = Root.Resources.GUI:FindFirstChild(guiName)
    GUI.Parent = LocalPlayer.PlayerGui
    if GUI:FindFirstChild("LOCAL") then
        local localscript = GUI:FindFirstChild("LOCAL")
        if localscript:IsA("LocalScript") then
            localscript.Enabled = true
        end
    end
end

function module:Startup(args)
    --anchors players to ensure that it doesn't fall to death lol-
    LocalPlayer.Character.PrimaryPart.Anchored = true
    
    
end

--[[GAME FUNCS]]

--[[
    Bind related keys to their designated actions
    
]]

function module:BindKeys(KeyTable:{Enum.KeyCode})
    --[[bind commands to keys specified
    example table:
    {
        [Enum.KeyCode.E] = "interact"
    }]]
    
end

--[[
    Plays sounds at designed point, or at GUI level (SoundService).
    
]]

function module:PlaySounds(Name:string,RollOffDistance:number,IsGUI:boolean,OriginPart:BasePart)
    local Sound:Sound? = Root.Sounds:FindFirstChild("Sound")
    if Sound then
        if IsGUI then
            if Sound:IsA("Sound") then
                local S = Sound:Clone()
                S.Parent = game:GetService("SoundService")
                S:Play()
                Debris:AddItem(S, S.TimeLength+5)
            end
        else
            if Sound:IsA("Sound") then
                if OriginPart then
                    local S = Sound:Clone()
                    S.Parent = OriginPart
                    S:Play()
                    S.RollOffMaxDistance = RollOffDistance
                    Debris:AddItem(S, S.TimeLength+5)
                else
                    warn("Sound "..Name.." was playable, but pointed OriginPart value is not ")
                end
            end
        end
    end
end

return module