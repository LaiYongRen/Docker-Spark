

FROM p7hb/docker-spark


USER root

# Spark dependencies
ENV APACHE_SPARK_VERSION 2.1.1
ENV HADOOP_VERSION 2.7

#ipython install 
RUN apt-get -y update && \
	apt-get -y install python3-setuptools && \
	easy_install3 pip && \
	pip3 install ipython[notebook] && \
	alias python=python3


#Setting path 
ENV SPARK_HOME /usr/local/spark
ENV PYTHONPATH $SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.4-src.zip
ENV MESOS_NATIVE_LIBRARY /usr/local/lib/libmesos.so
ENV SPARK_OPTS --driver-java-options=-Xms1024M --driver-java-options=-Xmx4096M --driver-java-options=-Dlog4j.logLevel=info


RUN /$SPARK_HOME/sbin/start-master.sh

EXPOSE 4040 8080 8081 8888

USER $NB_USER


#CMD ipython notebook --ip 0.0.0.0 --port 8888 --no-browser --allow-root --profile=pyspark