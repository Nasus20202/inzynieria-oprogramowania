#!/bin/bash

sed -i '/Unregistered Trial Version/d' ./diagram.svg
ffmpeg -y -i diagram.svg -vf scale=-1:1920 diagram.png