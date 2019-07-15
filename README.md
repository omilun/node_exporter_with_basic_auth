## Run NodeExporter with basic authentication


```sh
sudo docker run -d --name node_exporter_nginx_basic_auth -p 9100:9100 -e USERNAME=<YOUR---UserName> -e PASSWD=<YOUR---PassWord> omilun/node-exporter-basic-auth:0.17
```

 you can get metrics by a command like below command:
```sh 
curl USERNAME:PASSWORD@localhost:9100/metrics 
```

if you want to share container network with host you will need below command but it opens two node-exporter ports (9180[without security], 9100[with basic auth])

```sh
sudo docker run -d --name node_exporter_nginx_basic_auth --net=host -e USERNAME=<YOUR---UserName> -e PASSWD=<YOUR---PassWord> omilun/node-exporter-basic-auth:0.17
```
you have to block :9180 for don't let anyone to access to them.

```sh
sudo iptables -A OUTPUT -p tcp --dport 9180 -j REJECT 
sudo iptables -A OUTPUT -p tcp --sport 9180 -j REJECT
```
