# 專案目的  
這個專案的目的是希望能夠快速的安裝好執行Tensorflow Object Detection API的執行環境，在樹梅派3、4上。  
並可使用 Coral usb accelerator Edge tpu加速  

# 樹梅派作業系統(在PC操作)
https://www.raspberrypi.org/downloads/raspbian/  
Raspbian Buster with desktop and recommended software  
內建的python 3.7  
使用[SD Memory Card Formatter](https://www.sdcard.org/downloads/formatter/) 格式化SD卡  
使用[balenaEtcher ](https://www.balena.io/etcher/) 把作業系統寫入SD卡  

# 強烈建議建立虛擬環境(以下在樹梅派操作)
開源軟體經常會碰到版本地獄問題，建議使用virtualenv  
因為建立虛擬環境會產生虛擬環境的資料夾，請先建立存放虛擬工作環境的資料夾以存放虛擬環境。  
於console視窗將工作目錄切換到虛擬工作環境的資料夾。  
示範安裝與建立TF21的環境  
```
pip3 install virtualenv  
python3 -m venv TF21  
source ./TF21/bin/activate  
```
# 執行[setup.sh](https://github.com/aaasdream/Raspberrypi_ObjectDetection/blob/master/setup.sh) 可以快速安裝起執行推理的環境
快速安裝OpenCV  
快速安裝Tensorflow 2.1  
快速安裝Tensorflow Lite 2.1  
快速安裝Coral USB 加速器驅動  
快速安裝samba 網路檔案共享  
```
/bin/bash  setup.sh  
```

# 開啟遠端網頁編輯軟體Jupyter
可以在電腦使用網頁編輯樹梅派上的python，執行完之後console會顯示token將他複製到樹梅派瀏覽器上即可以更改密碼。  
```
jupyter notebook --ip=0.0.0.0
```

# 開啟網路檔案分享(非必要，有需要再開)  
安裝完成可以使用nano如下開啟samba設定檔
```
sudo nano /etc/samba/smb.conf
```
設定檔的最下方加入幾行文字，存檔並離開。 注意這是免密碼開啟分享，請於私人網路使用，於公用網路將會暴露Desktop資料夾下方所有檔案。  
```
[Desktop]
    comment = 快速分享桌面
    path = /home/pi/Desktop
    public = yes
    browseable = yes
    writable = yes
    create mask = 0776
    directory mask = 0776
    force user = pi
```
編輯存檔完成重新啟動服務即可網路分享，讓PC傳送檔案至樹梅派桌面。  
```
sudo service smbd restart
```
於windows 檔案瀏覽器打上 ```\\樹梅派IP``` 即可打開分享資料夾   


