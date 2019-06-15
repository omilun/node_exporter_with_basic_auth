## nginx_node_exporter
node exporter with basic auth (username and password)

```sh
sudo docker run -d --name node_exporter_nginx -p 9100:9100 -e USERNAME=<YOUR---Username> -e PASSWD=<YOUR---Password> omilun/nginx_node_exporter:0.17
```
 you can get metrics by a command like below command:
```sh 
curl USERNAME:PASSWORD@url:9100/metrics 
```
