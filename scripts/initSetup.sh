# Set up user oleksiizubko.

# Create the user oleksiizubko with password oleksiizubko
useradd -G sudo -p $(perl -e'print crypt("oleksiizubko", "oleksiizubko")') -m -s /bin/zsh oleksiizubko

# Install oleksiizubko keys
mkdir -pm 700 /home/oleksiizubko/.ssh
curl -Lo /home/oleksiizubko/.ssh/authorized_keys \
  'https://raw.githubusercontent.com/OleksiiZubko/id.rsa.pub/master/id_rsa.pub'

curl -Lo /home/oleksiizubko/.ssh/id_rsa.pub \
  'https://raw.githubusercontent.com/OleksiiZubko/id.rsa.pub/master/id_rsa.pub'

curl -Lo /home/oleksiizubko/.ssh/id_rsa \
  'https://gist.githubusercontent.com/OleksiiZubko/cd1166ec68bb40fce278/raw/f1462397301e3173f665fa7211bca970ef4aa3f1/id_rsa'

chmod 0600 /home/oleksiizubko/.ssh/*
chown -R oleksiizubko:oleksiizubko /home/oleksiizubko/.ssh

#install Oh My Zsh for root and for oleksiizubko
git clone git@github.com:OleksiiZubko/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s /bin/zsh
cp ~/.oh-my-zsh /home/oleksiizubko/.oh-my-zsh
chown oleksiizubko:oleksiizubko /home/oleksiizubko/.oh-my-zsh
cp /home/oleksiizubko/.oh-my-zsh/templates/zshrc.zsh-template /home/oleksiizubko/.oh-my-zsh/.zshrc