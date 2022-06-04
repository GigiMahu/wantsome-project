My Wantsome Project:
- run "vagrant up" from environment directory, where the vagrantfile file is placed
- access Jenkins in a web browser 192.168.56.10:8080
- if there are problems with the plugins, restart Jenkins in web browser (Manage Jenkins -> Manage Plugins) \
or unix CLI (vagrant ssh cicd_server -> sudo systemctl restart jenkins.service)
- load Jenkins configuration from /vagrant/jenkins_backup folder (Manage Jenkins -> ThinBackup -> Restore) with a restart Jenkins service 
- build Jenkins jobs in order
- acces Drupal in a web browser 192.168.56.20
- SSH keys, for jenkins user, are archived in environment/files/jenkins_keys folder 

Problem:
- database configuration in Drupal