#!/bin/bash
ls -l / | grep "bin" 
ping_with_arguments.sh
bash -x ping_with_arguments.sh 127.0.0.1
chmod u+x ping_with_arguments.sh 