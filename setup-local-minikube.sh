#!/bin/bash

run_ansible_playbooks() {
  ansible-galaxy role install -r $PWD/roles/requirements.yml
  ansible-playbook -i hosts -vv $PWD/setup-minikube-from-scratch.yml
  ansible-playbook -i hosts -vv $PWD/start-minikube.yml
  sudo kubectl get pods --all-namespaces
  echo ""
  echo "Wait a few seconds and run 'sudo kubectl get pods --all-namespaces' to see if everything's working as expected :)"
  echo ""
}

YUM_PACKAGE_NAME="python python-devl python-pip openssl-devel git ansible"
DEB_PACKAGE_NAME="python2.7 python-dev python-pip libssl-dev git ansible"

  if cat /etc/*release | grep ^NAME | grep CentOS; then
    echo "==============================================="
    echo "Installing packages $YUM_PACKAGE_NAME on CentOS"
    echo "==============================================="
    sudo yum install -y $YUM_PACKAGE_NAME
    run_ansible_playbooks
  elif cat /etc/*release | grep ^NAME | grep Red; then
    echo "==============================================="
    echo "Installing packages $YUM_PACKAGE_NAME on RedHat"
    echo "==============================================="
    sudo yum install -y $YUM_PACKAGE_NAME
    run_ansible_playbooks
  elif cat /etc/*release | grep ^NAME | grep Fedora; then
    echo "================================================"
    echo "Installing packages $YUM_PACKAGE_NAME on Fedorea"
    echo "================================================"
    sudo yum install -y $YUM_PACKAGE_NAME
    run_ansible_playbooks
  elif cat /etc/*release | grep ^NAME | grep Ubuntu; then
    echo "==============================================="
    echo "Installing packages $DEB_PACKAGE_NAME on Ubuntu"
    echo "==============================================="
    apt-get install -y $DEB_PACKAGE_NAME
    run_ansible_playbooks
  elif cat /etc/*release | grep ^NAME | grep Debian ; then
    echo "==============================================="
    echo "Installing packages $DEB_PACKAGE_NAME on Debian"
    echo "==============================================="
    apt-get install -y $DEB_PACKAGE_NAME
    run_ansible_playbooks
  elif cat /etc/*release | grep ^NAME | grep Mint ; then
    echo "============================================="
    echo "Installing packages $DEB_PACKAGE_NAME on Mint"
    echo "============================================="
    apt-get install -y $DEB_PACKAGE_NAME
    run_ansible_playbooks
  elif cat /etc/*release | grep ^NAME | grep Knoppix ; then
    echo "================================================="
    echo "Installing packages $DEB_PACKAGE_NAME on Kanoppix"
    echo "================================================="
    apt-get install -y $DEB_PACKAGE_NAME
    run_ansible_playbooks
  else
    echo "OS NOT DETECTED, couldn't install package $PACKAGE"
    exit 1;
  fi

exit 0
