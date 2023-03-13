--在终端打印文本显示给用户
print("驱动安装程序开始，正在检查网络状态...")
--添加库文件lfs，方便在下面使用lif.attributes函数检查文件属性
execute("apt install lua-filesystem")--安装库
local lfs = require("lfs")
--先定义本地变量package等于刚才我们安装的软件包的其中一个的包名
local package = "libnfc-dev"
--使用execute函数调用系统ping百度网站，如果可以Ping通，就说明网络没有问题可以进行接下来的操作
local result = os.execute("ping -c 1 www.baidu.com")
--返回值为0则成功，成功代表网络连接存在执行以下代码
if result == 0 then 
--告诉用户已经检查完网络，开始下载必须的库文件了
print("网络连接成功开始下载安装包")
--调用系统自带的软件包安装器去安装nfc的工具和驱动程序
os.execute("apt install libnfc-dev libnfc-examples mfoc mfcuk bless")
--通过系统自带的软件包查找器去查找是否存在这个软件包，如果不存在则
local command = "dpkg -s " .. package .. " >/dev/null 2>&1"
local exit_code = os.execute(command)
--exit_code可以获取execute函数的返回值，命令执行成功返回值为0
os.execute("touch .bless.log")
if exit_code == 0 then
  --在终端打印成功文本告诉用户软件包驱动到这里就安装完成了
  print("软件包安装成功!!!")
else--否则
  --在终端打印文本告诉用户失败了
  print("请检查软件包是否安装!!!")
end
else--网络连接失败开始安装准备在本地的软件包
  print("没有网络连接，开始安装本地包")
  --以下都是调用系统使用dpkg命令安装准备好的软件安装包
  os.execute("sudo dpkg -i deb/libnfc.deb")
  os.execute("sudo dpkg -i deb/libnfc-dev.deb")
  os.execute("sudo dpkg -i deb/libnfc6.deb")
  os.execute("sudo dpkg -i deb/libnfc-examples.deb")
  os.execute("sudo dpkg -i deb/mfcuk.deb")
  os.execute("sudo dpkg -i deb/mfoc.deb")
  os.execute("sudo dpkg -i deb/bless.deb")
  --安装完成使用touch命令生成一个名为.bless.log的文件，
  os.execute("touch .bless.log")
  --检查是否存在这个软件包文件
  local command = "dpkg -s " .. package .. " >/dev/null 2>&1"
  local exit_code = os.execute(command)
  --返回值为0则表示存在这个软件包
  if exit_code == 0 then
    print("软件包安装成功!!!")
  else--如果不存在那么打印请检查软件是否安装
    print("请检查软件包是否安装!!!")
  end
end
--调整驱动设置
local attr,err = lfs.attributes("etc/nfc")--使用lif.attributes函数检查文件属性，如果不存在那么
if err then
  print("文件夹不存在")
  --使用execute函数创建文件
  os.execute("mkdir /etc/nfc")
  os.execute("clear")
else
  print("文件夹存在")
  os.execute("cp deb/libnfc.conf /etc/nfc")--将配置文件复制到/etc/nfc/这个目录下面
  print("复制成功")--打印复制成功
end
os.exit()
--新建任务去执行软件主程序
os.execute("lua prometheus_main.lua")
