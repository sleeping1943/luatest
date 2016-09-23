#!/usr/bin/lua

local smtp = require("socket.smtp")
if not smtp then
    print("socket.smtp实例化失败")  
    return -1
end

local sender = "dongdong@xxx.com"
local recivers = {
    "shenwangdong@i-seal.com.cn",
    "shenwd@holystone.com",
    "liping@i-seal.com.cn",
    "csleeping@163.com"
}

mesgt = {
    headers = {
        subject = "just to test lua send email" 
    },
    --[[
       [body = "shenwangdong is a lucky boy,his gf make breakfast for him everyday! "
       ]]
}

local info = {
    from = sender,
    rcpt = recivers,
    source = smtp.message(mesgt)
}

for i=0,5,1 do
    mesgt.body = "shenwangdong is a lucky boy,his gf make breakfast for him everyday! "..tostring(i).." times"
    r , e = smtp.send{
        from = sender,
        rcpt = recivers,
        source = smtp.message(mesgt),
    }
    
    print("r"..tostring(r))
    print("e"..tostring(e))
end
