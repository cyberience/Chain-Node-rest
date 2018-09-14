#!/bin/bash

npm rebuild zeromq

cd ../src
forever index.js &