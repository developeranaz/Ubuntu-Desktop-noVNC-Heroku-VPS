FROM ubuntu:20.10
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt install dbus-x11 -y  && \
    apt install sudo -y  && \ 
    apt install bash -y  && \ 
    apt install net-tools -y  && \
    apt install novnc -y  && \ 
    apt install x11vnc -y  && \ 
    apt install xvfb -y  && \
    apt install supervisor -y  && \ 
    apt install xfce4 -y  && \
    apt install gnome-shell -y  && \
    apt install ubuntu-gnome-desktop -y  && \
    apt install gnome-session -y  && \ 
    apt install gdm3 -y  && \ 
    apt install tasksel -y  && \
    apt install ssh  -y  && \
    apt install terminator -y  && \
    apt install git -y  && \
    apt install nano -y  && \
    apt install curl -y  && \
    apt install wget -y  && \ 
    apt install zip -y  && \
    apt install unzip -y  && \
    apt install falkon -y  && \
    apt-get autoclean -y  && \
    apt-get autoremove

COPY novnc.zip /novnc.zip
COPY . /system

RUN unzip -o /novnc.zip -d /usr/share
RUN rm /novnc.zip

RUN chmod +x /system/conf.d/websockify.sh
RUN chmod +x /system/supervisor.sh

CMD ["/system/supervisor.sh"]
