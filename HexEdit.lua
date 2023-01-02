print("正在检查是否安装bleass")
local lfs = require("lfs") --添加库文件lfs，方便在下面使用lif.attributes函数检查文件属性
local blesslog = ".bless.log"
local attr = lfs.attributes(blesslog)
if attr then
os.execute("sudo dpkg -i deb/bless.deb")
 local file = io.open(blesslog, "w")
  if file then
    -- 创建成功
    file:close()
  else
    -- 创建失败
    end
    os.exit()
    os.execute("lua HexEdit.lua")
else
io.write("将要打开的文件托进这里:")
local BLread_file = io.read()
os.execute("bless" ..BLread_file.. "" )
end
os.exit()
os.execute("lua prometheus_main.lua")
