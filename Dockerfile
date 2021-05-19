FROM ubuntu:20.10
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt install dbus-x11 
    apt install sudo 
    apt install bash 
    apt install net-tools \
    apt install novnc 
    apt install x11vnc 
    apt install xvfb \
    apt install supervisor 
    apt install xfce4 \
    apt install gnome-shell 
    apt install ubuntu-gnome-desktop
    apt install gnome-session 
    apt install gdm3 
    apt install tasksel \
    apt install gnome-session 
    apt install gdm3 
    apt install tasksel \
    apt install ssh 
    apt install terminator \
    apt install git 
    apt install nano
    apt install curl
    apt install wget 
    apt install zip 
    apt install unzip 
    apt install falkon 

RUN apt-get autoclean
RUN apt-get autoremove

COPY novnc.zip /novnc.zip
#COPY supervisor.conf /system/supervisor.conf
COPY . /system
RUN unzip -o /novnc.zip -d /usr/share
#RUN cp -r /novnc/ /usr/share/novnc
#RUN mv /usr/share/novnc/vnc.html /usr/share/novnc/index.html
RUN chmod +x /system/conf.d/websockify.sh
RUN chmod +x /system/supervisor.sh

CMD ["/system/supervisor.sh"]
