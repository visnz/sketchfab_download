# usage
# bash array.sh URL 



curl $1 > tmp.html
for i in `cat tmp.html |grep  -o 'href="https:\/\/sketchfab\.com\/3d-models\/[0-9a-z\-]*"' |sed '1~2!d' |awk -F\" '{ print $2 }'`;
do 
./run.bat $i;
done

rm tmp.html

# 删除没有下载成功的文件夹
for i in `ls '/d/sketchfab_dl/'`;do if [[ `ls "/d/sketchfab_dl/"$i|wc|awk '{ print $1 }'` == 1 ]];then rm "/d/sketchfab_dl/"$i -r ;fi;done

# 把空格识别符 %20 转换为下划线 _
for i in `ls '/d/sketchfab_dl/'`;do mv '/d/sketchfab_dl/'$i `echo '/d/sketchfab_dl/'$i|sed 's/%20/_/g'`;done

