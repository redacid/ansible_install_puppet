### Show inventory ###

`ansible-inventory --list`

or 

`ansible-inventory --graph`


### Copy file to all hosts in inventory ###

`ansible all -m copy -a "src=testfile.txt dest=/home/ansible mode=644" -b`

### Delete file on all hosts in inventory ###

`ansible all -m file -a "path=/home/ansible/testfile.txt state=absent" -b`

### Execute command on all hosts in inventory #

`ansible all -m shell -a "uptime"`


-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-





















This README would normally document whatever steps are necessary to get your application up and running.

### What is this repository for? ###

* Quick summary
* Version
* [Learn Markdown](https://bitbucket.org/tutorials/markdowndemo)

### How do I get set up? ###

* Summary of set up
* Configuration
* Dependencies
* Database configuration
* How to run tests
* Deployment instructions

### Contribution guidelines ###

* Writing tests
* Code review
* Other guidelines

### Who do I talk to? ###

* Repo owner or admin
* Other community or team contact