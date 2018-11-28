HTTP DNS  
======  
  
一个极其微小快速的dns代理工具，以http的形式查询DNS  
可有效防止dns污染/劫持  
支持域名编码加密，服务端编码的代码要跟客户端一致  

编译:  
--------
~~~~~
    make  
~~~~~

### 客户端启动参数:  
    -l [监听ip:]监听端口  
    -d 目标ip[:目标端口]  
    -c 缓存路径  
    -L 限制缓存数目  
    -e 设置对查询的域名编码编号(1-127)  
    -H 设置Host  
    -h 显示这个信息  

### 服务端启动参数:  
    -l [监听ip:]监听端口  
    -u 上游ip[:上游端口]  
    -e 设置对域名进行编码的编号(1-127)
    -H hosts路径  
    -h 显示帮助  
  
