print("卡片写入程序启动成功")
io.write("请将要写入的文件拖这里然后回车确认：")
local write1 = io.read()--读取输入的文件名
io.write("请将密钥文件拖到这里然后回车确认：")
local write2 = io.read()--同上
os.execute("nfc-mfclassic W a"..write2.. ".dump"..write1..".dump")
print("卡片写入成功")
os.exit()
os.execute("lua prometheus_main.lua")
