print("驱动安装程序开始，检查网络状态")
local lfs = require("lfs")--添加库文件lfs，方便在下面使用lif.attributes函数检查文件属性
local result = os.execute("ping -c 1 www.baidu.com")--使用execute函数调用系统ping百度网站
if result == 0 then --返回值为0则成功，成功执行以下代码
  print("网络连接成功开始下载安装包")
  os.execute("apt install libnfc-dev libnfc-examples mfoc mfcuk bless")
  local package = "libnfc-dev"
local command = "dpkg -s " .. package .. " >/dev/null 2>&1"
local exit_code = os.execute(command)
if exit_code == 0 then--exit_code可以获取execute函数的返回值，命令执行成功返回值为0
  print("软件包安装成功!!!")
else
  print("请检查软件包是否安装!!!")
end
else--否则执行以下代码
  print("没有网络连接，开始安装本地包")
  os.execute("sudo dpkg -i deb/libnfc.deb")--以下都是调用系统使用dpkg命令安装准备好的软件安装包
  os.execute("sudo dpkg -i deb/libnfc-dev.deb")
  os.execute("sudo dpkg -i deb/libnfc6.deb")
  os.execute("sudo dpkg -i deb/libnfc-examples.deb")
  os.execute("sudo dpkg -i deb/mfcuk.deb")
  os.execute("sudo dpkg -i deb/mfoc.deb")
  os.execute("sudo dpkg -i deb/bless.deb")
  os.execute("touch .bless.log")
  local package = "libnfc-dev"--设置查找的软件包
  local command = "dpkg -s " .. package .. " >/dev/null 2>&1"--检查是否存在这个软件包文件
  local exit_code = os.execute(command)--返回值为0则表示存在这个软件包
  if exit_code == 0 then
    print("软件包安装成功!!!")
  else--如果不存在那么打印请检查软件是否安装
    print("请检查软件包是否安装!!!")
  end
end
local attr,err = lfs.attributes("etc/nfc")--使用lif.attributes函数检查文件属性，如果不存在那么
if err then
  print("文件夹不存在")
  os.execute("mkdir /etc/nfc")--使用execute函数创建文件
  os.execute("clear")
else
  print("文件夹存在")
  os.execute("cp deb/libnfc.conf /etc/nfc")--将配置文件复制到/etc/nfc/这个目录下面
  print("复制成功")--打印复制成功
end
os.execute("lua prometheus_main.lua")--打开一个新的终端去执行主程序
