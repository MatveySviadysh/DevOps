ansible (path if not in conf file) all -m ping 

ansible -i Lac/Ansible/inventory/hosts.yml all -m setup
ansible -i Lac/Ansible/inventory/hosts.yml all -m shell -a"uptime"
ansible -i Lac/Ansible/inventory/hosts.yml all -m copy -a "src=local_file.txt dest=/home/newuser/ mode=0644"
ansible -i Lac/Ansible/inventory/hosts.yml all -m file -a "path=/home/newuser/mydir state=directory mode=0755"
ansible -i Lac/Ansible/inventory/hosts.yml all -m get_url -a "url=https://example.com/file.txt dest=/tmp/file.txt"
ansible -i Lac/Ansible/inventory/hosts.yml all -m wait_for -a "path=/tmp/ready.txt timeout=60"
ansible -i Lac/Ansible/inventory/hosts.yml all -m file -a "path=/tmp/testfile.txt state=absent"
ansible -i Lac/Ansible/inventory/hosts.yml all -m apt -a "upgrade=yes update_cache=yes" --become
ansible -i Lac/Ansible/inventory/hosts.yml all -m reboot --become
