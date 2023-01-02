function Chenyulu()
    os.execute("clear")
end
local lfs = require("lfs") --添加库文件lfs，方便在下面使用lif.attributes函数检查文件属性

local runlog = "prometheus.log"
local attr = lfs.attributes(runlog)
if attr then
print("                                  _   _                    ")
print("                                 | | | |                   ")
print("   _ __  _ __ ___  _ __ ___   ___| |_| |__   ___ _   _ ___  ")
print("  | '_ \| '__/ _ \| '_ ` _ \ / _ \ __| '_ \ / _ \ | | / __|")
print("  | |_) | | | (_) | | | | | |  __/ |_| | | |  __/ |_| \__ \ ")
print("  | .__/|_|  \___/|_| |_| |_|\___|\__|_| |_|\___|\__,_|___/ ")
print("  | |  ")
print("  |_|   ")
print("")
print("welcome use prometheus_nfc program v0.0.1")
print("输入1运行驱动安装程序\n输入2运行卡片扫描程序\n输入3运行卡片读取程序\n输入4运行卡片写入程序\n输入5运行加密卡破解程序\n输入6运行数据修改程序\n输入7删除操作记录")
io.write("输入:")
local input = tonumber(io.read())--读取输入内容，然后根据内容执行相应的命令
if input == 1 then
    os.execute("lua driver_nfc.lua") 
elseif input == 2 then    
    os.execute("lua scan_nfc.lua")
elseif input == 3 then
    os.execute("lua readcard_nfc.lua")
elseif input == 4 then
    os.execute("lua writecard_nfc.lua")
elseif input == 5 then
    os.execute("lua stencheny.lua")
elseif input == 6 then
    os.execute("lua HexEdit.lua")
elseif input == 7 then
    os.execute("lua .lua")
end
os.exit()
else
    print("开始安装必须要的库文件")
local result = os.execute("ping -c 1 www.baidu.com")--使用execute函数调用系统ping百度网站
if result == 0 then --返回值为0则成功，成功执行以下代码
    print("网络连接成功开始下载安装包")
    os.execute("apt install lua-filesystem")--使用系统包管理器安装需要的lua库文件
    local package = "lua-filesystem"--设置查找的软件包
  local luafls_command = "dpkg -s " .. package .. " >/dev/null 2>&1"--检查是否存在这个软件包文件
  local lua_fls = os.execute(luafls_command)
if lua_fls == 0 then --lua_fls可以获取execute函数的返回值，命令执行成功返回值为0
    print("软件包安装成功!!!")
else
    print("请检查软件包是否安装!!!")
end
  else--否则执行以下代码
    print("开始安装本地安装包")
    os.execute("dpkg -i lua-filesystem.deb")
  end
Chenyulu()
 local file = io.open(runlog, "w")
  if file then
    -- 创建成功
    file:close()
  else
    -- 创建失败
    end
print("程序启动成功")
print("输入1运行驱动安装程序\n输入2运行卡片扫描程序\n输入3运行卡片读取程序\n输入4运行卡片写入程序\n输入5运行加密卡破解程序\n输入6运行数据修改程序\n输入7删除操作记录")
io.write("输入:")
local input = tonumber(io.read())--读取输入内容，然后根据内容执行相应的命令
if input == 1 then
    os.execute("lua driver_nfc.lua") 
elseif input == 2 then    
    os.execute("lua scan_nfc.lua")
elseif input == 3 then
    os.execute("lua readcard_nfc.lua")
elseif input == 4 then
    os.execute("lua writecard_nfc.lua")
elseif input == 5 then
    os.execute("lua stencheny.lua")
elseif input == 6 then
    os.execute("qterminal -e lua HexEdit.lua")
elseif input == 7 then
    os.execute("qterminal -e lua .lua")
end
os.exit()
end




















--使用execute()函数的时候，需要使用系统命令工具打开新的终端
--在linux上可以使用qterminal命令，例如：os.execute("qterminal -e lua run.lua")
