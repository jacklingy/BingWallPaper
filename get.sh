#!/bin/sh
while true

do
	pic=$(wget -t 5 --no-check-certificate -qO- "https://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1")
	echo $pic|grep -q enddate||exit
	link=$(echo https://www.bing.com$(echo $pic|sed 's/.\+"url"[:" ]\+//g'|sed 's/".\+//g'))
	#wget $link 
#	echo "得到的连链接是：${link%rf*}"  #得初始的链接，包含一些参数
	link2=${link%rf*}   #去掉一部分参数
#	echo "link2是$link2"
	link3=${link2%&*}   #去掉另一些参数
# echo "最终的链接是$link3"   #得到最终的图片地址
	wget $link3 -O 1.jpg #保存到当前目录下并命名为1.png
	sleep 43200 #暂停脚本12小时后再执行
done
