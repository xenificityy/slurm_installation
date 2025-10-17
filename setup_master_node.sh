#!/bin/bash

# Create Slurm configuration file
sudo mkdir -p /etc/slurm
sudo cp /opt/slurm/etc/slurm.conf.example /etc/slurm/slurm.conf

# Edit the Slurm configuration file
sudo bash -c 'cat > /etc/slurm/slurm.conf' <<EOF
ControlMachine=vm0
SlurmUser=slurm
StateSaveLocation=/var/spool/slurm
SlurmdSpoolDir=/var/spool/slurmd
NodeName=vm[1-5] CPUs=4 State=UNKNOWN
PartitionName=debug Nodes=vm[1-5] Default=YES MaxTime=INFINITE State=UP
EOF

# Start the Slurm controller
sudo /opt/slurm/sbin/slurmctld

echo "Master node setup complete. Ensure worker nodes are configured and running."
