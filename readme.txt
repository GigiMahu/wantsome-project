My Wantsome Project:
- run "vagrant up" from environment directory, where the vagrantfile file is placed
- access Jenkins in a web browser 192.168.56.10:8080
- if there are problems with the plugins, restart Jenkins in web browser (Manage Jenkins -> Manage Plugins) \
or unix CLI (vagrant ssh cicd_server -> sudo systemctl restart jenkins.service)
- load Jenkins configuration from environment/jenkins.yaml file (Manage Jenkins -> Configuration as Code: \
https://github.com/GigiMahu/wantsome-project/blob/f36857c2a9fabe5ef3f0bf10bd904c4247a3278d/environment/jenkins.yaml \
-> Apply new configuration)
- build Jenkins jobs in order
