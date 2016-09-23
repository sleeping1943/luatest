#!/usr/bin/lua
local json = require("json")
local index = {
    temperature="气温",
    weather="天气",
    wind="风速",
    week="工作周",
    city="城市",
    date_y="日期",
    dressing_index="体感",
    dressing_advice="穿衣",
    uv_index="紫外线",
    comfort_index="舒适",
    travel_index="旅行",
    exercise_index="运动",
}
function parse_json(raw)
    if not (json or raw) then 
        print("参数错误")
        return -1
    end
    local data = json.decode(raw)
    local today = data.result.today
    if type(today) == "table" then
        for k,v in pairs(today) do 
            if v and type(v) == "string" and  v ~= "" and v ~= "null" then
                print(tostring(index[k] or "指数").."\t:"..v)
            end
        end
    else 
        print("today's type:"..type(today))
    end
    --[[
       [json.util.printValue(data,"JSONVALUE")
       ]]
    return 0
end

--[[
   [local fname = "./weather.json"
   [local fd = io.open(fname,"r")
   [if not fd then
   [    print("打开文件"..tostring(fname).."失败")
   [    return -1
   [end
   [
   [local rawdata = fd:read("*all")
   [if not rawdata then
   [    print("读取数据失败")
   [    return -1
   [end
   [
   [fd:close()
   [parse_json(json,rawdata)
   [
   ]]






