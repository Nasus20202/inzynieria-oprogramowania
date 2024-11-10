#!/bin/bash

sed -i '/Unregistered Trial Version/d' ./diagram.svg
ffmpeg -y -i diagram.svg diagram.png