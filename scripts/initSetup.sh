# Set up user Oleksii.

# Create the user oleksii with password oleksii
useradd -G sudo -p $(perl -e'print crypt("oleksii", "oleksii")') -m -s /bin/zsh oleksii

# Install oleksii keys
mkdir -pm 700 /home/oleksii/.ssh
curl -Lo /home/oleksii/.ssh/authorized_keys \
  'https://raw.githubusercontent.com/OleksiiZubko/id.rsa.pub/master/id_rsa.pub'

curl -Lo /home/oleksii/.ssh/id_rsa.pub \
  'https://raw.githubusercontent.com/OleksiiZubko/id.rsa.pub/master/id_rsa.pub'

curl -Lo /home/oleksii/.ssh/id_rsa \
  'https://gist.githubusercontent.com/OleksiiZubko/cd1166ec68bb40fce278/raw/f1462397301e3173f665fa7211bca970ef4aa3f1/id_rsa'

chmod 0600 /home/oleksii/.ssh/*
chown -R oleksii:oleksii /home/oleksii/.ssh

#install Oh My Zsh for root and for oleksii
git clone git@github.com:OleksiiZubko/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s /bin/zsh
cp ~/.oh-my-zsh /home/oleksii/.oh-my-zsh
chown oleksii:oleksii /home/oleksii/.oh-my-zsh
cp /home/oleksii/.oh-my-zsh/templates/zshrc.zsh-template /home/oleksii/.oh-my-zsh/.zshrc