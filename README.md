# Minikube Quickstart
A collection of bash scripts and Ansible playbooks to get a simple minikube deployment working.


## Usage
If not installing on localhost then update the hosts file to have target machines.
Also update the hosts file to change variables used by Ansible.

Run `setup-local-minikube.sh` to setup dependencies and run playbooks.


## Requirements
None. Will setup Ansible, Docker and Minikube after running the bash script.


## Note
Only tested on CentOS 7. Might not fully work on other distros.


## License
MIT
