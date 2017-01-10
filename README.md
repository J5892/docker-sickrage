# Dockerfile to set up SickRage on ARM based systems

The main goal of this Dockerfile is to easily set up SickRage using Docker on the Raspberry Pi 2/3 (or any compatible ARM chipset).

## Quick setup

`docker run -p 8081:8081 --name sickrage -d -v /*custom_config_dir*:/config -v /*custom_data_dir*:/data -v /*tvshows_dir*:/tvshows -v /*download_dir*:/downloads -v /etc/localtime:/etc/localtime:ro erikdevries/rpi-sickrage`

## More details

The command above runs the Docker image and sets a couple of custom paths.

* /config where the configuration is stored (it's advised to configure this so the configuration is stored outside of the container)
    * `e.g. /home/pi/sickrage/config`
* /data where the database, logs, plugins and cache are stored (it's advised to configure this so the database is stored outside of the container)
    * `e.g. /home/pi/sickrage/data`
* /tvshows should point to the location where SickRage should move downloaded tvshows to (e.g. a folder/nfs share on the host)
    * `e.g. /mnt/tvshows`
* /downloads should point to the location where (e.g. sabnzbd) downloads tvshows to be processed by SickRage (e.g. a folder/nfs share on the host)
    * `e.g. /mnt/downloads`
* /etc/localtime points to locale of the host, this is optional but might come in handy when you configured a custom locale
    * `e.g. /etc/localtime:ro`

Secondly the command exposes the container on port 8081, names it "sickrage" and runs it detached (so it will run in the background).

In the command above the image is pulled from Docker Hub. If you want to build the image yourself, you can. See below. 

## Build Docker container

`docker build -t rpi-sickrage .`

Finally run the command in `quick setup` but replace `erikdevries/rpi-sickrage` with `rpi-sickrage` 
