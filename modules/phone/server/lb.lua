print('^4 [kmack_bridge] ^9 Loaded LB Phone^7')

local Phone = {}

function Phone.GetEmail(source)
    local currentPhone = exports["lb-phone"]:GetEquippedPhoneNumber(source)
    local email = exports["lb-phone"]:GetEmailAddress(currentPhone)
    return email
end

function Phone.SendEmail(to, from, subject, message, attachment)
    exports['lb-phone']:SendMail({
        to = to,
        sender = from,
        subject = subject,
        message = message,
        attachment = attachment
    })
end

function Phone.GetPhoneNumber(source)
    local currentPhone = exports["lb-phone"]:GetEquippedPhoneNumber(source)
    return currentPhone
end

function Phone.SendSMS(from, to, message, attachment)
    exports["lb-phone"]:SendMessage(from, to, message, attachment)
end

function Phone.SendSMSLocation(from, to, coords)
    exports["lb-phone"]:SendCoords(from, to, coords)
end

function Phone.SendDarkChatMsg(channel, username, message)
    exports["lb-phone"]:SendDarkChatMessage(username, channel, message)
end

function Phone.SendDarkChatLocation(channel, username, coords)
    exports["lb-phone"]:SendDarkChatLocation(username, channel, coords)
end


return Phone