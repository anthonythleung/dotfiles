function dev_ubuntu --description 'SSH into dev-ubuntu account'
  if [ "$SSH_CONNECTION" = "" ]
    cd ~/Documents/Projects/dev-ubuntu; and vagrant up; vagrant ssh
  end
end
