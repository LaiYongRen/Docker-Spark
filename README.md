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


5.Pyspark Test (using this script will connect worker-3 jupyter to spark master)
```
import pyspark
conf = pyspark.SparkConf()
conf.setMaster('spark://spark-master:7077')
conf.setAppName('My Jupyter Notebook')

# 'spark.hadoop.foo.bar' sets key 'foo.bar' in the Hadoop Configuaration.
conf.set('spark.hadoop.yarn.resourcemanager.address', 'spark-master')
conf.set('spark.hadoop.fs.default.name', 'hdfs://spark-master/')

sc = pyspark.SparkContext(conf=conf)
```

