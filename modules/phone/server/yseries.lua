print('^4 [kmack_bridge] ^9 Loaded Yseries Phone^7')

local Phone = {}

function Phone.GetEmail(source)
    return exports["yseries"]:GetPhoneNumberBySourceId(source) -- You can send email via phone number in yseries
end

function Phone.SendEmail(to, from, subject, message, attachment)
    local receiverType = 'phoneNumber'
    local receiver = to
    local attachmentL = nil
    --- check if attachment is coords or file
    if attachment then
        if attachment.x then
            attachmentL = {
                location = {x = attachment.x, y = attachment.y}
            }
        else
            attachmentL = {
                photo = attachment
            }
        end
    end
    exports['yseries']:SendMail({
        title = subject,
        sender = from,
        senderDisplayName = from,
        content = message,
        attachments = attachmentL
    }, receiverType, receiver)
end

function Phone.GetPhoneNumber(source)
   return exports["yseries"]:GetPhoneNumberBySourceId(source)
end

function Phone.SendSMS(from, to, message, attachment)
    -- no direct sms in yseries yet :( 
        local receiverType = 'phoneNumber'
        local receiver = to
        local attachmentL = nil
        --- check if attachment is coords or file
        if attachment then
            if attachment.x then
                attachmentL = {
                    location = {x = attachment.x, y = attachment.y}
                }
            else
                attachmentL = {
                    photo = attachment
                }
            end
        end
        exports['yseries']:SendMail({
            title = subject,
            sender = from,
            senderDisplayName = from,
            content = message,
            attachments = attachmentL
        }, receiverType, receiver)
end

function Phone.SendSMSLocation(from, to, coords)
    local receiverType = 'phoneNumber'
    local receiver = to
    local attachmentL = nil
    --- check if attachment is coords or file
    exports['yseries']:SendMail({
        title = 'You have been sent a location!',
        sender = from,
        senderDisplayName = from,
        content = 'Location',
        attachments = {
            location = {x = coords.x, y = coords.y}
        }
    }, receiverType, receiver)
end

function Phone.SendDarkChatMsg(channel, username, message)
    -- doesnt support sending dark chat messages via code currently.
    return false -- waiting on update from yseries to support this
end

function Phone.SendDarkChatLocation(channel, username, coords)
    -- doesnt support sending dark chat messages via code currently.
    return false -- waiting on update from yseries to support this
end


return Phone