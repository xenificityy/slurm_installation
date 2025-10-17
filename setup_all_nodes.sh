#!/bin/bash

# Update and install dependencies
sudo apt update && sudo apt upgrade -y
sudo apt install -y build-essential munge libmunge-dev libmunge2 \
    libpam0g-dev libssl-dev libhwloc-dev man-db chrony

# Set up munge
sudo systemctl enable munge
sudo systemctl start munge

# Verify munge
munge -n | unmunge

# Download and build Slurm
wget https://download.schedmd.com/slurm/slurm-23.02.3.tar.bz2
tar -xjf slurm-23.02.3.tar.bz2
cd slurm-23.02.3
./configure --prefix=/opt/slurm --sysconfdir=/etc/slurm
make -j$(nproc)
sudo make install

# Create necessary directories
sudo mkdir -p /var/spool/slurm /var/spool/slurmd
sudo chown -R ubuntu:ubuntu /var/spool/slurm /var/spool/slurmd

echo "All nodes setup complete. Proceed with master/worker-specific configuration."
