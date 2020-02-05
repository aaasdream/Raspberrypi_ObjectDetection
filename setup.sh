#!/bin/bash
#===================================說明============================================================
#此安裝檔的目的，在於快速安裝Tensorflow 2.0 、 Tensorflow lite 2.1 與 Coral USB加速器驅動於樹梅派4上

#使用的作業系統來自
# https://www.raspberrypi.org/downloads/raspbian/  
# Raspbian Buster with desktop and recommended software
# Version:September 2019
# Release date:2019-09-26
# 內建的python 3.7 

#建議先安裝VirtualEnv建立好虛擬環境 再執行此安裝程式
# pip3 install virtualenv
# python3 -m venv TF20
# source ./TF20/bin/activate

#===============================以下開始執行安裝=====================================================

#更新系統
sudo apt update
pip3 install --upgrade pip


#安裝 opencv 3.4.6.27
sudo apt-get -y install libatlas-base-dev libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev qt4-dev-tools libatlas-base-dev libjasper-dev libqtgui4
pip3 install opencv-python==3.4.6.27


#安裝tensorflow 2.0
wget https://github.com/lhelontra/tensorflow-on-arm/releases/download/v2.0.0/tensorflow-2.0.0-cp37-none-linux_armv7l.whl
pip3 install tensorflow-2.0.0-cp37-none-linux_armv7l.whl
rm tensorflow-2.0.0-cp37-none-linux_armv7l.whl


#安裝tensorflow lite 2.1
pip3 install https://dl.google.com/coral/python/tflite_runtime-2.1.0-cp37-cp37m-linux_armv7l.whl
             
#安裝coral usb accelerator driver
echo "deb https://packages.cloud.google.com/apt coral-edgetpu-stable main" | sudo tee /etc/apt/sources.list.d/coral-edgetpu.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-get update
sudo apt-get install libedgetpu1-std


#安裝jupyter 
pip3 install matplotlib 
pip3 install Pillow 
pip3 install jupyterlab

