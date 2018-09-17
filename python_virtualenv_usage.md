# Python 開發必備神器之一：virtualenv
Python virtualenv 並獨立出 Python 環境。可使每個項目環境與其他項目獨立開來，保持環境的干淨，解決包衝突問題。

Python的第三方包成千上萬，在一個Python環境下開發時間越久，安裝依賴越多，就越容易出現依賴包衝突的問題。為了解決這個問題，開發者們開發出了 virtualenv，可以搭建虛擬 並獨立的Python環境。這樣就可以使每個項目環境與其他項目獨立開來，保持環境的干淨，解決包衝突問題。

安裝 virtualenv
virtualenv 是一個第三方包，是管理虛擬環境的常用方法之一。
此外，Python 3 中還自帶了虛擬環境管理包。

我們可以用的 easy_install 或者 pip 安裝。

1
$ pip install virtualenv
基本用法
創建項目的虛擬環境
1
2
$ cd my_project_folder
$ virtualenv venv # venv 可替換為别的虛擬環境名稱
執行後，在本地會生成一個與虛擬環境同名的文件夾，包含 Python 可執行文件和 pip 庫的拷貝，可用於安裝其他包。

但是默認情況下，虛擬環境中不會包含也無法使用系統環境的global site-packages。比如係統環境里安裝了請求requests，在虛擬環境裡import requests會提示 ImportError。如果想使用系統環境的第三方軟件包，可以在創建虛擬環境時使用參數–system-site-packages。

1
$ virtualenv --system-site-packages venv
另外，你還可以自己指定虛擬環境所使用的 Python 版本，但前提是系统中已經安裝了該版本：

1
$ virtualenv -p /usr/bin/python2.7 venv
使用虛擬環境
進入虛擬環境目錄，啟動虛擬環境。

1
2
3
$ cd venv
$ source bin/activate # Windows 系統下運行 Scripts\
$ python -V
如果未對命令行進行個性化，此時命令行前面應該會多出一個括號，括號裡為虛擬環境的名稱。啟動虛擬環境後安裝的所有模塊都會安裝到該虛擬環境目錄裡。

退出虛擬環境：

1
$ deactivate
如果項目開發完成後想刪除虛擬環境，直接刪除虛擬環境目錄即可。

使用 virtualenvwrapper
上述 virtualenv 的操作其實已經夠簡單了，但對於開發者來說還是不夠簡便，所以便有了 virtualenvwrapper 。這是 virtualenv 的擴展工具，提供了一系列命令行命令，可以方便地創建，刪除，複製，切換不同的虛擬環境。同時，使用該擴展後，所有虛擬環境都會被放置在同一個目錄下。

安装 virtualenvwrapper
1
$ pip install virtualenvwrapper
設置環境參數
把下面兩行添加到 ~/.bashrc（或者~/.zshrc） 裡。

1
2
3
4
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
   export WORKON_HOME=$HOME/.virtualenvs
   source /usr/local/bin/virtualenvwrapper.sh
fi
其中，.virtualenvs 是可以自定義的虛擬環境管理目錄。

然後執行：source ~/.bashrc，就可以使用 virtualenvwrapper 了。Windows 安裝過程，請参考官方文件。

使用方法
創建虛擬環境：

1
$ mkvirtualenv venv
注意：mkvirtualenv 也可以使用 virtualenv 的參數，比如 –python 來指定 Python 版本。創建虛擬環境後，會自動切換到此虛擬環境裡。虛擬環境目錄都在 WORKON_HOME 裡。

其他命令如下：

```
lsvirtualenv -b # 列出虛擬環境

workon [環境名稱] # 切換虛擬環境

lssitepackages # 查看環境中安装了哪些包

cdvirtualenv [子目錄名] # 進入當前環境的目錄

cpvirtualenv [source] [dest] # 複製虛擬環境

deactivate # 退出虛擬環境

rmvirtualenv [環境名稱] # 刪除虛擬環境
```