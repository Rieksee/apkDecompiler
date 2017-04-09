@echo off
cd /d %~dp0
echo "apkDecompiler ver 1.0.0"
echo;
echo apkDecompilerへようこそ！
echo このアプリケーションは任意のAndroidアプリ（apkファイル）をデコンパイルすることができるわ！
echo たまに失敗するけど許しなさいよねっ！
echo;
echo 実行の前に以下のものがあることを確認しなさい！
echo ---------------------------------
echo java実行環境
echo python実行環境
echo ---------------------------------
echo;
echo 準備できてないならこの画面を閉じて準備してからやり直してちょうだい！
echo;
echo さあ、準備ができたなら何かボタンを押しなさい！
echo 作業には5～10分かかると思うわ！気長に待ってよね！
echo;
pause
mkdir tmp
scripts\7za920\7za.exe x -y -tzip -otmp\ %1
java -jar scripts\apktool.jar d %1 -o tmp2
python scripts\decompile.py %1
echo;
echo 使ってくれてありがとう☆
echo また何かあったら使っていいのよっ！
echo;
pause