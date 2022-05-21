#インストール先のパスを設定
export LD_LIBRARY_PATH="/home/<user_name>/mjpg-streamer/mjpg-streamer-experimental"
STREAMER="$LD_LIBRARY_PATH/mjpg_streamer"

# 表示する画像サイズとフレームレートを設定
# 画像サイズ(320× 240)
# フレームレート：10fps
XRES="320"
YRES="240"
FPS="10"

# Webサーバーの設定
WWWDOC="$LD_LIBRARY_PATH/www"
# 8080番ポートで待ち受ける
PORT="8080"

# ベーシック認証の設定
ID="AAA" #ベーシック認証用のID
PW="BBB" #ベーシック認証用のパスワード

# 起動用のコマンド
# bullseyeからはこっちでカメラモジュールが取れるっぽい?
$STREAMER -i "input_uvc.so -y -n -f 10 -r 320x240 -d /dev/video0" \
          -o "output_http.so -w $WWWDOC -p $PORT -c $ID:$PW"