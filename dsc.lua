local FB5DDDDAE5F755CF8415600CABC0A7E2 = game.Players.LocalPlayer
function embed(url)
    local http = game:GetService("HttpService")
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = {
        ["embeds"] = {{
            ["author"] = {
                ["name"] = FB5DDDDAE5F755CF8415600CABC0A7E2.Name.. "   -  ["..FB5DDDDAE5F755CF8415600CABC0A7E2.UserId.."]",
            },
            ["description"] = "`Script Executed`",
            ["color"] = 855567,
            ["fields"] = {
                   {
                    ["name"] = "Script",
                    ["value"] = "`".. Script .."`",
                    ["inline"] = false
                },
                {
                    ["name"] = "Game",
                    ["value"] = "\n `".. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name .. " - [" ..game.PlaceId.. "]`",
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
end

embed(url)
