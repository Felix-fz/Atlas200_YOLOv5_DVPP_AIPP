# 检查 build 文件夹是否存在
if [ ! -d "build" ]; then
  # 如果 build 文件夹不存在，则创建它
  mkdir build
  echo "Build folder created."
else
  echo "Build folder already exists."
fi


# 进入 build 文件夹
cd build

# 运行 cmake ..
cmake ..

make

echo "=============================="

./main
