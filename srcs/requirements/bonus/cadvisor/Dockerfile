FROM	debian:buster-slim

RUN 	apt-get update && apt-get upgrade \
#&&	wget https://github.com/google/cadvisor/releases/download/v0.37.0/cadvisor\
&&	wget https://github.com/google/cadvisor/releases/download/v0.47.0/cadvisor-v0.47.0-linux-amd64 -O cadvisor \
&&	chmod +x cadvisor

CMD [ "./cadvisor"]
