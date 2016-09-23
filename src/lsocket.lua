#!/usr/bin/lua
--[[
   [print(package.path)
   [package.path=package.path..";/usr/share/lua/5.1/?.lua"
   ]]
function get_page(host)
    local socket = require("socket")
    local file = "/"
    
    --[[
        [创建一个tcp连接，连接到http裂解的标准端口->80
    ]]
    local sock = assert(socket.connect(host,80))
    sock:send("GET " .. file .. " HTTP/1.0\r\n\r\n");
    repeat 
        --[[
            [以1k的字节快来接受数据，并把接受到的字节块打印到屏幕
        ]]
        local chunk,status,partial = sock:receive(1024)
        print(chunk or partial)
    until status ~= "closed"
    --[[
        [关闭socket连接
    ]]
    sock:close()
end

function get_http_page(url)
    local http = require("socket.http")
    if not http then
        print("http实例化失败!")
        return false
    end
    local response = http.request(url)
    print(response or "获取["..url.."]页面失败")
    return true
end

--[[
   [get_http_page("http://www.baidu.com/")
   ]]
get_http_page("http://www.163.com/")

--[[
   [get_page("www.163.com")
   ]]
