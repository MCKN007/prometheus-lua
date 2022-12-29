print("开始运行扫描程序")

local lfs = require("lfs")
local ChenMengyuan = "prometheus.log"
local ERROR = "error.log"
local attr = lfs.attributes(ChenMengyuan)
if attr then
  -- 文件存在
  local scan_nfc = os.execute("dpkg -s libnfc-dev")
else
  -- 文件不存在
  print("No")
 
  -- 创建新文件
  local file = io.open(ERROR, "w")
  if file then
    -- 创建成功
    print("请检查驱动程序")
    os.execute("cat > error.log << 驱动没有安装或者没有配置设备")
    file:close()
  else
    -- 创建失败
    print("权限不足！！！")
    end
end
os.execute("qterminal -e lua prometheus_main.lua")
os.exit()