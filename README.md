# Atlas200_YOLOv5_DVPP_AIPP

在Atlas200DK平台上基于DVPP和AIPP实现部署YOLOv5（v6.0）

· DVPP解码JPG，并Resize

· AIPP实现颜色转换：YUV420sp_U8 to RGB

## 效果：

| 前处理    | 推理     | 后处理    |
| ------ | ------ | ------ |
| 5.21ms | 1.09ms | 4.41ms |

## 环境：

CANN版本：6.0.0.alpha003 

OS版本：Ubuntu18.04

## 文件结构：

├─build <br>
├─cvt_yolov5s <br>
├─data <br>
├─inc <br>
├─model <br>
├─res <br>
└─src <br>

## 使用：

1. 下载yolov5，并切换版本：

   ```
   git clone https://github.com/ultralytics/yolov5.git
   git checkout v6.0
   pip install -r requirements.txt
   ```

2. 模型转换pt --> onnx：
   
   ```
   python export.py --include onnx --weights yolov5s.pt --img 640 --batch 1 --opset=11
   ```

3. 下载本代码：
   
   ```
   
   ```

4. 模型转换onnx --> om:
   ```
   atc --mode=0 --model yolov5s.onnx --framework=5 --output=yolov5s_v6 --soc_version=Ascend310 --insert_op_conf=yuv420sp_aipp.cfg
   ```
将转换的.om模型放到model文件夹下

5. 编译运行
   ```
   ./build.sh
   ````

## 结果：

![](../Atlas200_YOLOv5_DVPP_AIPP/res/out_yolov5_1.jpg)



## 参考
https://github.com/lenLRX/Atlas_ACL_E2E_Demo/

https://github.com/zoufangyu1987/Atlas200DK_YOLO_V5_CPP_DVPP
