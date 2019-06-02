hadoop                             #唤起hadoop 
hadoop version                     #查询版本
echo $HADOOP_HOME                  #查询安装位置
hadoop fs -ls                      #查询分布式文件系统文件
hadoop fs -ls /00lifeng            #查询分布式文件系统上的文件夹内容 
hadoop fs -mkdir /00lifeng/cloudy  #创建文件夹    
hadoop fs -rm -r /00lifeng/cloudy  #删除指定 文件夹（-r）
cd+空格   #切换到根目录
cd data   #两个数据文件夹
cd shanghai
emacs -Q 300268_match_New.csv #-Q表示快速启动   
#Alt+X  输入revert-buffer-with 自动补全，回车，输入gbk，来更改查看编码
#Ctrl+X 与Ctrl+C退出
hadoop fs -put 600863.SH.CSV  /00lifeng/cloudy    #上传本地文件到分布式系统指定文件夹
hadoop fs -get /00lifeng/cloudy/600863.SH.CSV .   #下载分布式文件系统的文件到当前文件夹(.)
hadoop fs    #查询命令
hadoop fs -touchz /00lifeng/cloudy/new.txt   #touchz新建文件
cat 600863.SH.CSV  | wc    #查询当前目录下600863.SH.CSV的行数与词数， |表示管道，用wc计算行列

#课件文件夹：
cd Workshop+00lifeng

#使用hadoop查询文件600863.SH.CSV的行数
#input和output指定的文件夹均为分布式文件系统的文件夹(HDFS Hadoop 
#Distributed File System)
#output指定的文件夹如果不存在会新建，如果存在会报错，因此再次使用需要删除原文件夹
hadoop jar\ 
/usr/lib/hadoop-current/share/hadoop/tools/lib/hadoop-streaming-2.7.2.jar \
-input /00lifeng/cloudy/600863.SH.CSV  \
-output /00lifeng/cloudy/output \
-mapper "/usr/bin/cat" \
-reducer "/bin/wc"



