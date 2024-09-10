local module = {
    CLIENT_VAR = {
        PlayerSpeed = 35;
        JumpHeight = 5;
        MaxHealth = 100;
        CurrentMap = "";
        CurrentWeapon = "";
    };
    SERVER_VAR = {
        MaxMultiplayerHealth = 100;
        JumpHeight = 5;
        PlayerSpeed = 35;
        CurrentMap = ""
    };
    ENGINE_VAR = {
        TimeScale = 1;
        Gravity = 135
    }
}

--[[VARIABLES]]

local LocalPlayer = game:GetService("Players").LocalPlayer
local Root = game:GetService("ReplicatedStorage")
local Debris = game:GetService("Debris")

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
    LocalPlayer.Character.PrimaryPart.Anchored = true
end

--[[GAME FUNCS]]

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