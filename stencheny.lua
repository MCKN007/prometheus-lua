print("加密卡破解程序启动成功")
--io.write("请输入要保存的文件名：")
--local mfcuk_name = io.read()
os.execute("mfcuk -C -R 0:A -s 250 -S 250 -v 3")
os.exit()
os.execute("lua prometheus_main.lua")
