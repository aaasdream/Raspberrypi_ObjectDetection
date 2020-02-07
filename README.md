# 樹梅派上執行物件檢測
將物件檢測API(ObjectDetectionAPI)佈署到樹梅派(Raspberry pi)4

# 使用的作業系統來自
https://www.raspberrypi.org/downloads/raspbian/  
Raspbian Buster with desktop and recommended software  
Version:September 2019  
Release date:2019-09-26  
內建的python 3.7  

# 建議建立虛擬環境
示範安裝與建立TF20的環境
> pip3 install virtualenv  
> python3 -m venv TF20  
> source ./TF20/bin/activate  

# 執行[setup.sh](https://github.com/aaasdream/Raspberrypi_ObjectDetection/blob/master/setup.sh) 可以快速安裝起執行推理的環境
> /bin/bash  setup.sh  

# 開啟網路檔案分享
安裝完成可以使用nano如下開啟samba設定檔
>sudo nano /etc/samba/smb.conf
設定檔的最下方加入幾行文字，存檔並離開。 注意這是免密碼開啟分享，請於私人網路使用，於公用網路將會暴露Desktop資料夾下方所有檔案。
>[Desktop]
>    comment = 快速分享桌面  
>    path = /home/pi/Desktop  
>    public = yes  
>    browseable = yes  
>    writable = yes  
>    create mask = 0776  
>    directory mask = 0776  
>    force user = pi  



