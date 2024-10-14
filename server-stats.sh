//Server Performance Stats Project through https://roadmap.sh
//Code to gather and list the following statistics: OS Version, Uptime, Total CPU Usage, Total Memory Usage, Total Disk Usage, Top 5 Processes by CPU Usage, Top 5 Processes by Memory Usage.

echo HOSTNAME = $(hostname)
echo OS VERSION = $(lsb_release -d | awk '{print$2,$3,$4}')
echo UPTIME = $(uptime --pretty)
echo TOTAL CPU USAGE = $(top -bn1 | grep Cpu | head -n 1 | awk '{print (100 - $8)}')
echo TOTAL MEM USAGE = $(top -bn1 | grep Mem | head -n 1 | awk '{print ($4 - $6)-$10}')
echo TOTAL DISK USAGE = $(df | awk '{s+=$4} END {print s/1000000}')

echo -e "Top 5 Processes By CPU Usage"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

echo -e "Top 5 Processes By Memory Usage"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
