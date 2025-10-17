# Slurm Installation and Configuration

This repository contains scripts to set up and configure a Slurm cluster. The scripts are designed to automate the installation and configuration process for the master node and worker nodes.
---

## Files in This Repository

- **`setup_master_node.sh`**: Script to set up the Slurm controller (master node).
- **`setup_worker_node.sh`**: Script to set up the Slurm compute nodes (worker nodes).
- **`setup_all_nodes.sh`**: Script to set up both the master and worker nodes in one step.
- **`slurm.conf`**: Configuration file for the Slurm cluster.

---

## Prerequisites

1. **Operating System**: Ensure all nodes are running a compatible Linux distribution (e.g., Ubuntu).
2. **Munge**: Install and configure Munge for authentication across all nodes.
3. **Network**: Ensure all nodes can communicate with each other (e.g., via hostname or IP).
4. **Root Access**: Run the scripts with `sudo` privileges.

---

## Instructions

### 1. Set Up the Master Node
Run the following command on the master node to set up the Slurm controller:
```bash
sudo bash setup_master_node.sh
```

### 2. Set Up Worker Nodes
Run the following command on each worker node to set up the Slurm compute nodes:  
```bash
sudo bash setup_worker_node.sh
```

### 3. Set Up All Nodes (master and workers both)
If you want to set up both the master and worker nodes in one step, use the following command:
```bash
sudo bash setup_all_nodes.sh
```

Note: Make sure you have given ubuntu access permission to /var directory on all VMs (VM0 to VMn; where 'n' is total vms), use command:
```bash
sudo chown -R ubuntu:ubuntu /var
```
Keep your slurm.conf file at /etc/slurm/ directory


Execute the `sinfo` command on VM0 to make sure its working. It should show,
PARTITION AVAIL  TIMELIMIT  NODES  STATE NODELIST
debug*       up   infinite      5   unk* vm[1-5]
