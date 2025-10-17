#!/bin/bash

# Copy the Slurm configuration file from the master node
sudo mkdir /etc/slurm
scp vm0:/etc/slurm/slurm.conf .
sudo cp ~/slurm.conf /etc/slurm/

# Start the Slurm daemon
sudo /opt/slurm/sbin/slurmd

echo "Worker node setup complete. Ensure the master node is running."
