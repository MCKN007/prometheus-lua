print("程序启动成功")
io.write("请输入将要保存的文件名称:")
local savefile_name = io.read()--读取输入的文件名
print("开始读取数据")
print("文件读取完成将保存在当前文件夹下面")
os.execute("mfoc -O" .. savefile_name .. ".dump")


