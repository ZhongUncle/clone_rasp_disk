# clone_rasp_disk
Tool for cloning Raspberry Pi disk or SD card to another driver (even for smaller space). You can use it in your Raspberry, rather than using another Linux device. And it is very simple!

## Usage
The usage is simple:

```
./clone_rasp_disk.sh [target_device_name]
```

For example:

```
./clone_rasp_disk.sh /dev/sdb
```

It will clone your local Raspberry Pi system and files to target disk `/dev/sdb`. 

## Details & Explanations
If you want to know more details and explanations, please read this blog: 
- English version: [How to clone system to smaller disk/SD card on Raspberry Pi - ZhongUncle‘s  blog](https://zhonguncle.github.io/blogs/60276f40ad2e87f4620c0126ce780fb7.html)
- 中文版: [如何克隆树莓派系统到较小的硬盘/SD卡上（如何分区、设置修复引导） - ZhongUncle CSDN](https://blog.csdn.net/qq_33919450/article/details/136404094) 

## Bugs
If you find a bug, please report it in issue!

