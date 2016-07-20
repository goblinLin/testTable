-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

--[[
	這個範例解釋Lua的Table用法
	Author: Zack Lin
	Time: 2015/3/12
]]
--宣告Table
local t = {"倚天劍","屠龍刀"}
--使用Table，index從1開始
print(t[1].. "," ..t[2])

--依次取得陣列Table各個元素
for i,v in ipairs(t) do
	print(i,v)
end

--取得Table共有幾個元素
print(#t)

--table的記憶體地址
print(tostring(t))

--利用ipairs印出所有Table的index和value
for i,v in pairs(t) do 
	print(i .. '->' .. v)
end

--宣告一個Hash形式的Table，以下兩種方式結果相同
local hash = {
	x = "降龍十八掌",
	y = "六脈神劍"
}
local hash = {}
hash.x = "降龍十八掌"
hash.y = "六脈神劍"

--利用pairs印出所有Table的key和value
for key,value in pairs(hash) do 
	print(key .. '->' .. value)
end

--取用Hash Table的作法
print(hash["x"])
print(hash.y)

--依次取得HashTable各個元素
for k,v in pairs(hash) do
	print(k,v)
end

--宣告複合式或巢狀式Table
local t ={
	weapon = {"魚腸劍","黑鐵刀"},
	martalArt = {"霸天裂斬","炎爆術"},
	player = {
		name = "江湖小蝦米",
		hp = 100,
		mp = 50
	},
}

--取用複合式Table的作法
print( "新角色".. t.player.name .. "進入房間,配戴" .. t.weapon[2] .. ",擅長的絕招為" ..t.martalArt[1] )

--深層table列印函式
function print_r ( t )  
    local print_r_cache={}
    local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
            print(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        print(indent.."["..pos.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                        print(indent..string.rep(" ",string.len(pos)+6).."}")
                    elseif (type(val)=="string") then
                        print(indent.."["..pos..'] => "'..val..'"')
                    else
                        print(indent.."["..pos.."] => "..tostring(val))
                    end
                end
            else
                print(indent..tostring(t))
            end
        end
    end
    if (type(t)=="table") then
        print(tostring(t).." {")
        sub_print_r(t,"  ")
        print("}")
    else
        sub_print_r(t,"  ")
    end
    print()
end

table.print = print_r

table.print( t )

--當Table用不到時，可以設為nil以作記憶體管理
t = nil

--Table的物件導向
local player = {
	--宣告物件屬性
	hp = 100,
	mp = 50,
	name = "江湖小蝦米",	
}
--宣告物件行為
player.greet = function()
	print(player.name .. '向英雄敬禮!')
end
player.attack = function(enmy)
	print(player.name .. '攻擊' .. enmy)
end

player.greet()
player.attack('史萊姆')
