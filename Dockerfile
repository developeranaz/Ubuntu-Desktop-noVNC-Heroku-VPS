FROM pingme998/chr:1
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update ## \
RUN #apt install falkon -y  ## \
RUN apt install dbus-x11 -y  ## \
RUN apt install sudo -y  ## \
RUN apt install bash -y  ## \
RUN apt install net-tools -y  ## \
RUN apt install novnc -y  ## \
RUN apt install x11vnc -y  ## \
RUN apt install xvfb -y  ## \
RUN apt install supervisor -y  ## \
RUN apt install xfce4 -y  ## \
RUN apt install gnome-shell -y  ## \
RUN apt install ubuntu-gnome-desktop -y  ## \
RUN apt install gnome-session -y  ## \
RUN apt install gdm3 -y  ## \
RUN apt install tasksel -y  ## \
RUN apt install ssh  -y  ## \
RUN apt install terminator -y  ## \
RUN apt install git -y  ## \
RUN apt install nano -y  ## \
RUN apt install curl -y  ## \
RUN apt install wget -y  ## \
RUN apt install zip -y  ## \
RUN apt install unzip -y
    

COPY novnc.zip /novnc.zip
COPY . /system

RUN unzip -o /novnc.zip -d /usr/share
RUN rm /novnc.zip

RUN chmod +x /system/conf.d/websockify.sh
RUN chmod +x /system/supervisor.sh

CMD ["/system/supervisor.sh"]
