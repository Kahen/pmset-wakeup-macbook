// 120 分钟后进入休眠，延长清醒时间
sudo pmset -c sleep 120
// 显示器休眠时间：30 分钟
sudo pmset -c displaysleep 30
// 硬盘休眠时间：60 分钟
sudo pmset -c disksleep 60
// 内存供电，内存镜像不写入硬盘
sudo pmset -c hibernatemode 0
// 关闭 standby 模式
sudo pmset -c standby 0
// 关闭 autopoweroff
sudo pmset -c autopoweroff 0
// 休眠时持续联网
sudo pmset -c tcpkeepalive 1
