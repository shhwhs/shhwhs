local function getName(addr)
    local str = "" -- 初始化一个空字符串用于存储结果
    local t = {} -- 创建一个表用于存储要读取的内存地址和类型
    for i=1, 80 do 
        t[i] = {address=addr+i-1, flags=gg.TYPE_BYTE} -- 填充表，每个元素包含地址和类型（字节）
    end
    t = gg.getValues(t) -- 读取内存值

    for i, v in ipairs(t) do -- 遍历读取到的内存值
        if v.value==0 then break end -- 如果值为0，则停止读取
        if v.value<0 then return "" end -- 如果值为负，则返回空字符串
        str = str..string.char(v.value&0xFF) -- 将读取的字节值转换为字符并追加到结果字符串return
        end
        return str
   end
   local function tohex(val)
  return string.format("%X", val)
end

   local nc={}
local so=gg.getRangesList("libil2cpp.so") -- 获取libil2cpp.so的地址列表
for i=1,#so do 
    nc[i]=so[i].state 
    if nc[i]=="Xa" then 
        nc=i 
        break 
    end 
end
local so=so[nc].start  -- 获取libil2cpp.so的起始地址
function Exit()
print(os.date"当前时间:%Y年/️%m月/%d日%H:%M:%S")
	os.exit()
end

function Main()
N = gg.multiChoice({
    "扫基址",--1
    "方法定位类和方法名",
    "获取类名",
       "dump方法andclass",
       "dump所有dll",
       "dump字段",
    "退出",
    }, nil, os.date(""))
      if N == nil then else
  if N[1] == true then Mai() end
  if N[2] == true then kk() end
  if N[3] == true then klo() end
    if N[4] == true then mop() end
    if N[5] == true then lko() end
  if N[6] == true then lkil() end
  if N[7] == true then Exit() end
XGK = -1
  end
  end
function Mai()
    -- 搜索特定数值
    local prompt = gg.prompt({"搜的值"}) -- 弹出提示框，让用户输入类名
if prompt then
    local plm = prompt[1] -- 获取用户输入的第一个值
    gg.searchNumber(plm, 4)
    -- 获取搜索结果
    end
    local results = gg.getResults(20000)

    if #results == 0 then
        -- 如果没有找到结果，打印消息并退出函数
        print("没有找到结果")
        return
    end

    -- 清除搜索结果
    gg.clearResults()

    -- 假设libil2cpp.so的起始地址是已知的
    local lib_start_address = gg.getRangesList('base.odex')[1].start

    -- 遍历搜索结果
    for i, v in ipairs(results) do
   
        -- 计算偏移量
        v.offset = lib_start_address - v.address
        -- 打印信息
        v.offset = string.format('%X', v.offset)
        v.address=string.format('%X', v.address)
        v.value=string.format('%X', v.value)
        -- 确保v.value是数字类型
        if type(v.value) == "number" then
            print(i, v.value, v.address, v.value, v.offset)
        else
            -- 如果v.value不是数字类型，打印提示信息
            print("v.value 不是数字类型")
        end
   end
    -- 打印标题信息
    print('第一个是排数', '依次是值', '地址', '指针地址', '与libil2cpp.so偏移')

    -- 提供一个用于设置新值的函数模板
    print([[复制以下到别一个脚本 
    -- BaseAddressY函数定义
    
    function BaseAddressY(address, value)
so = gg.getRangesList('base.odex')[1].start
  local tt = {}
  tt[1] = {}
  tt[1].address = so - address
  tt[1].flags = 4
  tt[1].value = value
  gg.setValues(tt)
  end

    BaseAddressY(0x偏移,修改值)
    ]])
end
-- 以下代码用于将特定的Lua注释添加到文件末尾
-- 以只读方式打开文件
file = io.open("test.lua", "w+")

-- 设置默认输出文件为 test.lua
io.output(file)

-- 在文件最后一行添加 Lua 注释
io.write([[local prompt = gg.prompt({"10进制转换"}) -- 弹出提示框，让用户输入类名
if prompt then
    local txt = prompt[1] -- 获取用户输入的第一个值
    local num = tonumber(txt) -- 尝试将输入转换为数字
    if num then
        a = string.format('%X', num) -- 如果成功转换为数字，转换为十六进制字符串
        print(a) -- 打印十六进制字符串
    else
        print("输入的不是有效的数字，请重新输入。") -- 如果转换失败，提示用户
    end
end]])


-- 关闭打开的文件
io.close(file)






function kk()

local prompt = gg.prompt({"方法地址+h"}) -- 弹出提示框，让用户输入类名
if prompt then
    local a = prompt[1] -- 获取用户输入的第一个值
    gg.setRanges(32 | 4)
gg.searchNumber(a)--自己动这个dll名
    

local fff = gg.getResults(1)

yy=fff[1].address+0xC local knkn = {{address = yy,flags = 4}}--方法名1                   
knkn = gg.getValues(knkn) tu=knkn[1].value knkn=knkn[1].value & 0xffffffff
knkn=string.format('%X', knkn)
print('类实例地址'..knkn)
jj={{address=tu+8,flags=4}}
ll=gg.getValues(jj)
oo=ll[1].value & 0xffffffff print('类名'..getName(oo))
dd=fff[1].address+8
local kn = {{address = dd,flags = 4}}--方法名1 
kn=gg.getValues(kn) mm=kn[1].value & 0xffffffff
print('方法名'..getName(mm))
end
end
function klo()
local prompt = gg.prompt({"dll值"}) -- 弹出提示框，让用户输入类名
if prompt then
    local a = prompt[1] -- 获取用户输入的第一个值
    gg.setRanges(4)
gg.searchNumber(a)--自己动这个dll名
end
local okn = gg.getResults(18000)
for _, result in ipairs(okn) do
    local addz = result.address+0x8 -- 方法信息的地址偏移
    local knkn = {{address = addz,flags = 32}}--方法名1
knkn = gg.getValues(knkn)
local tdfd = knkn[1].value & 0xFFFFFFFF
print('类名'..getName(tdfd))
end
end
function mop()
local file = io.open('dump(方法).lua','w+')
local prompt = gg.prompt({"填:+dll"},{':Assembly-CSharp.dll'}) -- 弹出提示框，让用户输入类名
if prompt then
    local a = prompt[1] -- 获取用户输入的第一个值
    gg.setRanges(-2080896|4)--自己动内存
gg.searchNumber(a)--自己动这个dll名
gg.setRanges(4)
gg.searchPointer(0)
gg.searchPointer(0)
end

local okn = gg.getResults(100000,nil)
for _, result in ipairs(okn) do
    local addz = result.address + 0x4c-- 方法信息的地址偏移
    local knkn = {{address = addz,flags = 4}}--方法名1
knkn = gg.getValues(knkn)
local tdfd = knkn[1].value
local ytu=result.address + 0xA4
local yru={{address = ytu,flags = 2}}
yiu=gg.getValues(yru)
dd={}
for i=1,yiu[1].value*0x4,0x4 do
dd[i]={address=tdfd+i-1, flags=4}
dd=gg.getValues(dd)
--for i, v in ipairs(dd[i].value) do -- 遍历读取到的内存值
        if dd[i].value==0 then break end -- 如果值为0，则停止读取
hh=dd[i].value & 0xffffffff
ff={{address = hh,flags = 32}}
ff=gg.getValues(ff)
gf=ff[1].value & 0xffffffff
--print('偏移'..string.format('%X',gf-so & 0xffffffff))
ds=hh+8
fd={{address = ds,flags = 32}}
fd=gg.getValues(fd)
gh=fd[1].value & 0xffffffff
--print('方法名'..getName(gh))
local addo = result.address+0x8 -- 方法信息的地址偏移
    local knkj = {{address = addo,flags = 32}}--方法名1
knkj = gg.getValues(knkj)
local tdfh = knkj[1].value & 0xFFFFFFFF
--print('类名'..getName(tdfh))
local ado = result.address -- 方法信息的地址偏移
    local kkj = {{address = ado,flags = 32}}--方法名1
kkj = gg.getValues(kkj)
local tfh = kkj[1].value & 0xFFFFFFFF
ytru={{address = tfh,flags = 32}}
ytru=gg.getValues(ytru)
ter=ytru[1].value
--print('dll '..getName(ter))
file:write("\n\n方法名："..getName(gh).."   方法偏移：0x"..string.format("%x", gf-so & 0xffffffff).." dll "..getName(ter).." 类名 "..getName(tdfh))
end
end
end
--end


function lko()
gg.setRanges(4)
gg.searchNumber(':mscorlib',1)
gg.searchPointer(0)

okn=gg.getResults(20)
for _, result in ipairs(okn) do
    local addz = result.address + 0x10-- 方法信息的地址偏移
    print(addz..'区分')
dd={}

for i=0,2400,12 do
dd[i]={address=addz+i, flags=32}
--print(dd[i])
dd=gg.getValues(dd)
if dd[i].value==0 then break end
hh=dd[i].value & 0xffffffff
--print(hh)
ff={{address = hh,flags = 32}}
ff=gg.getValues(ff)
gf=ff[1].value & 0xffffffff
gfh={{address = gf,flags = 32}}
gfh=gg.getValues(gfh)
ujh=gfh[1].value & 0xffffffff
print('dll '..getName(ujh))
end
end
end
function lkil()
local file = io.open('dump(字段).lua','w+')
local prompt = gg.prompt({"填:+dll"},{':Assembly-CSharp.dll'}) -- 弹出提示框，让用户输入类名
if prompt then
    local a = prompt[1] -- 获取用户输入的第一个值
    gg.setRanges(-2080896|4)--自己动内存
gg.searchNumber(a)--自己动这个dll名
gg.setRanges(4)
gg.searchPointer(0)
gg.searchPointer(0)
end

local okn = gg.getResults(100000,nil)
for _, result in ipairs(okn) do
local yyuu=result.address + 0xA8
local yyuu={{address = yyuu,flags = 2}}
tyfu=gg.getValues(yyuu)
dd={}
ye=result.address+0x40
local ye={{address = ye,flags = 32}}
ye=gg.getValues(ye)
hgu=ye[1].value
for i=1,tyfu[1].value*0x14,0x14 do
dd[i]={address=hgu+i-1, flags=4}
dd=gg.getValues(dd)
if dd[i].value==0 then break end
uer=dd[i].value
yy={}
yy[i]={address=hgu+i-1-2+14, flags=2}
yy=gg.getValues(yy)
yto=yy[i].value
local addo = result.address+0x8 -- 方法信息的地址偏移
    local knkj = {{address = addo,flags = 32}}--方法名1
knkj = gg.getValues(knkj)
local tdfh = knkj[1].value & 0xFFFFFFFF
file:write("\n\n字段名："..getName(uer)..'偏移 0x'..tohex(yto).." 类名: "..getName(tdfh))
end
end
end
gg.showUiButton()
while true do
	if gg.isClickedUiButton() then
	Main()
	end

end


while(true)do
if gg.isVisible(true) then
XGK=1
gg.setVisible(false)
end
gg.clearResults()
if XGK==1 then
Main()
end
end
