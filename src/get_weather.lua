#!/usr/bin/lua

require("juhe")
require("urlcode")
require("parse_weather")

--递归打印table数据
function printable(t)
    for k,v in pairs(t) do
        if type(v) == "table" then
            printable(v)
        else
            print(k..":"..v)
        end
    end
end

local http = require("socket.http")
if not http then
    print("socket.http not found!")
    return -1
end

print("请输入您要查询哪个城市的天气:")
local addr = encodeURI(io.read())
local host = "http://v.juhe.cn/weather/index"
local url= host.."?cityname="..addr.."&dtype=&format=&key="..key
local response = http.request(url)
parse_json(response)

