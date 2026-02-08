local scr
if getgenv().src == "taxiboss" then
	scr = "loadstring(game:HttpGet(('https://raw.githubusercontent.com/o8uzi/script-hub/refs/heads/main/taxiboss.lua')))()"
elseif getgenv().src == "farmit" then
	scr = "loadstring(game:HttpGet(('https://raw.githubusercontent.com/o8uzi/Farm-It-Script/refs/heads/main/script.lua')))()"
elseif getgenv().src == "petfactory" then
	scr = "loadstring(game:HttpGet(('https://raw.githubusercontent.com/o8uzi/petfactory/refs/heads/main/script.lua')))()"
else
	scr = "Unknown"
end

local player = game.Players.LocalPlayer

function SendMessageEMBED(url, embed)
    local http = game:GetService("HttpService")
    local headers = {
        ["Content-Type"] = "application/json"
    }
	local data = {
		["embeds"] = {{
			["author"] = { 
				["name"] = player.Name.. "  -  [".. player.UserId.."]",
			},
			["color"] = 986895,
			["fields"] = {
				{
					["name"] = "Executor :",
					["value"] = "```"..identifyexecutor() .."```",
					["inline"] = false
				},
				{
					["name"] = "Script : ",
					["value"] = "```lua\n".. scr .. "```\n",
					["inline"] = false
				},
				{
					["name"] = "Game : ",
					["value"] = "```".. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.. " - [".. game.PlaceId.. "] ```",
					["inline"] = false
				}
			}
		}},

	}
    local body = http:JSONEncode(data)
    local response = request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })
    print("Sent")
end


--Examples 

local url = "https://discord.com/api/webhooks/1469900906878210170/2D-KPghbDkqyM7j165vrGfa7iQKHzLdCZf2N0zgErzs28A0acarlmsFAiKiDCRhL6iqy"
SendMessageEMBED(url, "Hello")
