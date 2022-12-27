print("开始运行扫描程序")
local scan_nfc = os.execute("dpkg -s libnfc-dev")
if scan_nfc == 0 then --判断是否安装，返回值为0代表安装了
    print("安装成功")
    print("请检查设备是否连接，如果能看到这段话停留那么就是已经连接好了")
    os.execute("nfc-poll")--执行扫描程序
    else--如果没有安装那么
        print("请返回步骤1安装驱动的")
        os.execute("qterminal -e lua prometheus_main.lua")
        os.execute("exit")--弹出终端窗口返回步骤1去执行
end
os.exit()