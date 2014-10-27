docker-ntipa-box-consumer
=========================



### To build:
	Spostarsi nella directory e lanciare il comando
    sudo docker build -t tornabene/docker-ntipa-box-consumer .
    

### To run:

    sudo docker pull tornabene/ntipa-box-consumer-docker
    sudo docker run -d --name consumer1.ntipa.it -P  tornabene/docker-ntipa-box-consumer
    sudo docker run -d --dns 10.10.130.5  -P --name ntipaBoxConsumer -t -i tornabene/docker-ntipa-box-consumer
    
    
    