print('^4 [kmack_bridge] ^9 Loaded QS Phone^7')

local Phone = {}

function Phone.GetEmail(source)
    return source --- qs uses source to send emails
end

function Phone.SendEmail(to, from, subject, message, attachment)
    exports['qs-smartphone-pro']:sendNewMail(to, {
        sender = from,
        subject = subject,
        message = message,
    })
end

function Phone.GetPhoneNumber(source)
    local Bridge = exports.kmack_bridge:GetBridge() --- cause it requires identifier
    local identifier = Bridge.Framework.PlayerDataS(source).Pid
   return exports['qs-smartphone-pro']:GetPhoneNumberFromIdentifier(identifier, false)
end

function Phone.SendSMS(from, to, message, attachment)
    local phone = from
    local targetPhone = to
    local message = message
    local type = 'message' -- message, location
    exports['qs-smartphone-pro']:sendNewMessage(phone, targetPhone, message, type)
end

function Phone.SendSMSLocation(from, to, coords)
    local phone = from
    local targetPhone = to
    local message = coords
    local type = 'location' -- message, location
    exports['qs-smartphone-pro']:sendNewMessage(phone, targetPhone, message, type)
end

function Phone.SendDarkChatMsg(channel, username, message)
    return false --- waiting on a way to do this right from qs 
end

function Phone.SendDarkChatLocation(channel, username, coords)
    return false --- waiting on a way to do this right from qs 
end


return Phone