@echo off

SET FILE_PATH=%~dp0installed.txt

IF EXIST "%FILE_PATH%" (
    echo Installation file found, running the TensorRT Docker container...
    docker-compose -f docker-compose.tensorrt.yml up
) ELSE (
    echo Installation file not found, setting up the repository and running the TensorRT Docker container...
    git clone https://github.com/samfisherirl/FaceFusion-NSFW-One-Click-Installer.git
    cd facefusion-docker
    docker-compose -f docker-compose.tensorrt.yml up
    echo installed > "%FILE_PATH%"
)

echo.
echo To access the TensorRT container, browse:
echo http://localhost:7875
echo.