@echo off
cd /d %~dp0
echo "apkDecompiler ver 1.0.0"
echo;
echo apkDecompiler�ւ悤�����I
echo ���̃A�v���P�[�V�����͔C�ӂ�Android�A�v���iapk�t�@�C���j���f�R���p�C�����邱�Ƃ��ł����I
echo ���܂Ɏ��s���邯�ǋ����Ȃ�����˂��I
echo;
echo ���s�̑O�Ɉȉ��̂��̂����邱�Ƃ��m�F���Ȃ����I
echo ---------------------------------
echo java���s��
echo python���s��
echo ---------------------------------
echo;
echo �����ł��ĂȂ��Ȃ炱�̉�ʂ���ď������Ă����蒼���Ă��傤�����I
echo;
echo �����A�������ł����Ȃ牽���{�^���������Ȃ����I
echo ��Ƃɂ�5�`10��������Ǝv����I�C���ɑ҂��Ă�ˁI
echo;
pause
mkdir tmp
scripts\7za920\7za.exe x -y -tzip -otmp\ %1
java -jar scripts\apktool.jar d %1 -o tmp2
python scripts\decompile.py %1
echo;
echo �g���Ă���Ă��肪�Ƃ���
echo �܂�������������g���Ă����̂���I
echo;
pause