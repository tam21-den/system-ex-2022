# system-ex-2022

演習用

### mjpg-streamerをインストールする

基本は[このページ](https://raspi-katsuyou.com/index.php/2020/06/30/11/10/44/644/)を基準にする.

昨年の演習で使ってたページ.

ただし,今回使うRaspberry piはzeroで,OSバージョンも違うので少し変更する.

#### ネームサーバを追加する
  IP固定しているとaptがこけるので,強制的に特定のネームサーバを向かせる.

  ```
  sudo nano /etc/resolv.conf
  ```
  
  でファイルに入って,末尾に
  
  ```
  nameserver <nameserver_ip_1>
  nameserver <nameserver_ip_2>
  ```
  
  を追記する.
  
  #### パッケージをインストールする
  
  1.  ```
      sudo apt update
      ```
      
      を実行する.
      
      もしこの段階で
      
      ```
      エラー:1 http://archive.raspberrypi.org/debian bullseye InRelease
      'archive.raspberrypi.org' が一時的に解決できません
      ```
      
      が出てきたらaptがこけているので,ネームサーバを追加できているか確認するか,IPの固定を外して作業する.
  
  2.  ```
      sudo apt install git cmake libjpeg9-dev
      ```

      参考ページではlibjpeg8-devを使っていたが,廃止されたらしいので今回はlibjpeg9-devを使う.
      
  3.  ```
      git clone https://github.com/jacksonliam/mjpg-streamer.git
      ```

      でmjpg-streamerの関連ファイルをリポジトリから落としてくる.

  4.  ```
      cd mjpg-streamer/mjpg-streamer-experimental
      ```
      でディレクトリを移動して,以下のコマンドで本体をビルドする.

      ```
      make
      ```

      ```
      sudo make install
      ```
      
 #### スクリプトを作成する
  mjpg-streamerの起動スクリプトはstart.shを参照.

  mjpg-streamer/mjpg-streamer-experimentalにstart.shをコピーして使う.

  入力ストリームについて,参考ページではinput_raspicam.soを入力として取っていたが,そのストリームが無かったのでinput_uvc.soを入力として扱う.
  Raspberry Pi OS bullseye特有の現象かもしれないので要調査
  
#### ストリーミングを起動する
  mjpg-streamer/mjpg-streamer-experimentalで,
  
  ```
  sudo sh start.sh
  ```
  
  起動したのち,

  http://[ラズパイのIPアドレス]:8080

  にアクセスするとストリームをテストできる.
