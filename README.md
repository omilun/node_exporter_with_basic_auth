## nginx_node_exporter
node exporter with basic auth (username and password)

At first you have to fill two variables (`USERNAME` and `PASSWD`).
```sh
username="eNteE yOUr UsEr NaMe HerE" # like admin
pass=`sudo openssl passwd -apr1` # make a hash of a password for nginx htpasswd
sudo docker run -d --name node_exporter_nginx -p 9100:9180 -e USERNAME=$username -e PASSWD=$pass omilun/nginx_node_exporter:0.17
```
 you can get metrics by a command like below command:
```sh 
curl USERNAME:Un_Hashed_PASSWORD@url:9100/metrics 
```
