#!/bin/bash
# Use tmux for training
cd ~/HMER/CAN
log="logs/$(date +'%Y-%m-%d-%H-%M').log"
python -u train.py | tee $log

# Quit GPU
job_id=$(squeue -u $USER -h -o %i)
scancel $job_id
