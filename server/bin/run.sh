#!/bin/bash

npm rebuild zeromq
npm -i forever

cd ../src
forever index.js