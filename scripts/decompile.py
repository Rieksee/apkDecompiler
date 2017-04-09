import os
import sys
import re
isclass = re.compile(r'^classes.*\.dex$')
jadpath = "scripts\\jad\\jad.exe"
classes = []
folders = []
tmpdir = 'tmp'
tmp2dir = 'tmp2'
apkpath = sys.argv[1]


def fild_all_files(directory):
    for root, dirs, files in os.walk(directory):
        yield files


def fild_all_dirs(directory):
    for root, dirs, files in os.walk(directory):
        yield root

if __name__ == '__main__':
    for files in fild_all_files(tmpdir):
        for onefile in files:
            if isclass.match(onefile):
                path = tmpdir + '\\' + onefile
                jarname = os.path.splitext(onefile)[0] + ".jar"
                classes.append(jarname)
                os.system('scripts\\dex2jar\\d2j-dex2jar.bat -o ' + tmp2dir + '\\' + jarname + " " + path)
        break

    os.system('rmdir /S /Q tmp')

    for classname in classes:
        foldername = tmp2dir + '\\' + os.path.splitext(classname)[0]
        os.system('scripts\\7za920\\7za.exe x -y -tzip -o' + foldername + ' ' + tmp2dir + '\\' + classname)
        folders.append(foldername)

    count = 0
    for dirname in folders:
        for onedir in fild_all_dirs(dirname):
                cmd = jadpath + " -o -d" + onedir + " -sjava " + onedir + "\*.class"
                print cmd
                os.system(cmd)
                cmd = "del " + onedir + "\*.class"
                os.system(cmd)

    dirname = os.path.dirname(apkpath)
    filename = os.path.basename(apkpath)
    newdirname = os.path.splitext(filename)[0]
    os.system('move tmp2 ' + dirname + "\\" + newdirname)
