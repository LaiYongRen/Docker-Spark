1.Download Dockerfile and docker-compose.yml
```
$git clone https://github.com/xxxxsars/Docker-Spark.git
```

2.Create Docker images (your can change images tag then should be change docker-compose.yml images name)
```
$cd Docker-Spark
$docker build -t test:v3 .
```

3.Running Spark cluster container 
```
$docker-compose up
```
4.Web ui test (jupyter test have to enter token,token in ternimal can see it)

http://localhost:8080

http://localhost:8888
