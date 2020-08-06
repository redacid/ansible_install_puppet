### TODO #
* Сделать проверку версии агента puppet на хостах

### Установка ansible последней версии #

`sudo apt update`

`sudo apt install software-properties-common`

`sudo apt-add-repository --yes --update ppa:ansible/ansible`

`sudo apt install ansible`

### Перед запуском сценариев на всех хостах #
##### Centos #

`useradd --home-dir /home/ansible --groups wheel --create-home --shell /bin/bash --password PASSWORD ansible`

##### Ubuntu #
`useradd --home-dir /home/ansible --groups sudo --create-home --shell /bin/bash --password PASSWORD ansible`

##### Разрешить повышение прав для пользователя ansible без введения пароля #

`echo "ansible ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ansible`

тогда в группу sudo или wheel при создании пользователя добавлять не нужно

##### Создать директорию для ключей #
`mkdir /home/ansible/.ssh`

##### Добавить ключ для пользователя ansible на все хосты #

`echo "ssh-rsa AAAAB3NzaC1y .... d6IcbQ== ansible@node2.ios.in.ua" | sudo tee /home/ansible/.ssh/authorized_keys`

`chown -R ansible:ansible /home/ansible/.ssh`

`chmod 755 /home/ansible/.ssh`

`chmod 644 /home/ansible/.ssh/authorized_keys`

Проверка ключей при запуске проводиться не будет тк в конфигурационном файле(ansible.cfg) указана опция host_key_checking = false в секции [defaults]

### Просмотреть inventory ###

`ansible-inventory --list`
or 
`ansible-inventory --graph`

### Копировать файл на все хосты inventory ###

`ansible all -m copy -a "src=testfile.txt dest=/home/ansible mode=644" -b`

### Удалить файл со всех хостов inventory ###

`ansible all -m file -a "path=/home/ansible/testfile.txt state=absent" -b`

### Выполнить коммандку на всех хостах inventory #

`ansible all -m shell -a "uptime"`

### Считать все переменные с хостов inventory #

`ansible all -m setup`


### Запустить сценарий на группу серверов #

`ansible-playbook puppet.yml --extra-var "DEPLOYSERVERS=test_servers"`
