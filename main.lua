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

--取得Table共有幾個元素
print(#t)

--table的記憶體地址
print(tostring(t))

--宣告一個Hash形式的Table，以下兩種方式結果相同
local hash = {
	x = "降龍十八掌",
	y = "六脈神劍"
}
local hash = {}
hash.x = "降龍十八掌"
hash.y = "六脈神劍"

--取用Hash Table的作法
print(hash["x"])
print(hash.y)

--宣告複合式或巢狀式Table
local t ={
	weapon = {"魚腸劍","黑鐵刀"},
	martalArt = {"霸天裂斬","炎爆術"},
	player = {
		name = "江湖小蝦米",
		hp = 100,
		mp = 50
	}
}
--取用複合式Table的作法
print( "新角色".. t.player.name .. "進入房間,配戴" .. t.weapon[2] .. ",擅長的絕招為" ..t.martalArt[1] )

--當Table用不到時，可以設為nil以作記憶體管理
t = nil