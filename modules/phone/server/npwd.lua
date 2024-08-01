print('^4 [kmack_bridge] ^9 Loaded npwd Phone^7')


local Phone = {}

function Phone.GetEmail(source)
    -- no email so we just use text
    local playerData = exports.npwd.getPlayerData({ source = source })
    return playerData.phoneNumber
end

function Phone.SendEmail(to, from, subject, message, attachment)
    if attachment and attachment.x then
        exports.npwd:emitMessage({
            senderNumber = from,
            targetNumber = to,
            message = subject.."\n\n"..message,
            embed = {
                type = "location",
                coords = { attachment.x, attachment.y, attachment.z },
                phoneNumber = from
            }
        })
    else
        exports.npwd:emitMessage({
            senderNumber = from,
            targetNumber = to,
            message = subject.."\n\n"..message,
        })
    end
end

function Phone.GetPhoneNumber(source)
    local playerData = exports.npwd.getPlayerData({ source = source })
    return playerData.phoneNumber
end

function Phone.SendSMS(from, to, message, attachment)
    if attachment and attachment.x then
        exports.npwd:emitMessage({
            senderNumber = from,
            targetNumber = to,
            message = subject.."\n\n"..message,
            embed = {
                type = "location",
                coords = { attachment.x, attachment.y, attachment.z },
                phoneNumber = from
            }
        })
    else
        exports.npwd:emitMessage({
            senderNumber = from,
            targetNumber = to,
            message = subject.."\n\n"..message,
        })
    end
end

function Phone.SendSMSLocation(from, to, coords)
    exports.npwd:emitMessage({
        senderNumber = from,
        targetNumber = to,
        message = 'You have been sent a location',
        embed = {
            type = "location",
            coords = { coords.x, coords.y, coords.z },
            phoneNumber = from
        }
    })
end

function Phone.SendDarkChatMsg(channel, username, message)

end

function Phone.SendDarkChatLocation(channel, username, coords)

end


return Phone