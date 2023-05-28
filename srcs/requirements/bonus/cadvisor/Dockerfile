FROM	debian:buster-slim

RUN 	apt-get update && apt-get upgrade -y \
&&	apt-get install wget -y \
&&	wget https://github.com/google/cadvisor/releases/download/v0.47.0/cadvisor-v0.47.0-linux-amd64 -O cadvisor \
&&	chmod +x cadvisor

EXPOSE 8080

#install cadvisor and execute it (that all)
#it will use port 8080 without ssl
CMD [ "./cadvisor"]
