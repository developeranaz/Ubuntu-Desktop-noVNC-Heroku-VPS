FROM ubuntu:latest
RUN apt update
RUN apt install apt-transport-https curl -y
RUN curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|tee /etc/apt/sources.list.d/brave-browser-release.list
RUN apt update 
RUN apt install brave-browser -y
ENV DEBIAN_FRONTEND=noninteractive
ENV VNC_PASS="developeranaz" \
    VNC_TITLE="classzero" \
    VNC_RESOLUTION="1280x720" \
    VNC_SHARED=0 \
    DISPLAY=:0 \
    BRAVE_USE_SHM=1 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    TZ="Asia/Kolkata"
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
    apt-get autoclean -y  && \
    apt-get autoremove

COPY novnc.zip /novnc.zip
COPY . /system

RUN unzip -o /novnc.zip -d /usr/share
RUN rm /novnc.zip

RUN chmod +x /system/conf.d/websockify.sh
RUN chmod +x /system/supervisor.sh

CMD ["/system/supervisor.sh"]
