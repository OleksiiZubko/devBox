# Set up user oleksiizubko.

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
rm -rf ~/.oh-my-zsh
git clone https://github.com/OleksiiZubko/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s /bin/zsh
cp ~/.oh-my-zsh /home/oleksiizubko/.oh-my-zsh -R
chown oleksiizubko:oleksiizubko /home/oleksiizubko/.oh-my-zsh
cp /home/oleksiizubko/.oh-my-zsh/templates/zshrc.zsh-template /home/oleksiizubko/.zshrc

#Git config
cat <<EOT > /home/oleksiizubko/.gitconfig
[user]
	name = Oleksii Zubko
	email = oleksii.zubko@gmail.com
[core]
	editor = vim
	whitespace = fix,-indent-with-non-tab,trailing-space,cr-at-eol
	excludesfile = ~/.gitignore
[color]
	ui = auto
[color "branch"]
	current = yellow bold
	local = green bold
	remote = cyan bold
[color "diff"]
	meta = yellow bold
	frag = magenta bold
	old = red bold
	new = green bold
	whitespace = red reverse
[color "status"]
	added = green bold
	changed = yellow bold
	untracked = red bold
[diff]
	tool = vimdiff
[difftool]
	prompt = false
[gitflow "prefix"]
	feature = feature-
	release = release-
	hotfix = hotfix-
	support = support-
	versiontag = v
[alias]
	a = add --all
	ai = add -i
	#############
	ap = apply
	as = apply --stat
	ac = apply --check
	#############
	ama = am --abort
	amr = am --resolved
	ams = am --skip
	#############
	b = branch
	ba = branch -a
	bd = branch -d
	br = branch -r
	#############
	c = commit
	ca = commit -a
	cm = commit -m
	cem = commit --allow-empty -m
	cam = commit -am
	cd = commit --amend
	cad = commit -a --amend
	ced = commit --allow-empty --amend
	#############
	d = diff
	dc = diff --cached
	dl = difftool
	dlc = difftool --cached
	dk = diff --check
	dp = diff --patience
	dck = diff --cached --check
	#############
	f = fetch
	fo = fetch origin
	fu = fetch upstream
	#############
	fp = format-patch
	#############
	fk = fsck
	#############
	g = grep -p
	#############
	l = log --oneline
	lg = log --oneline --graph --decorate
	#############
	ls = ls-files
	lsf = "!git ls-files | grep -i"
	#############
	m = merge
	ma = merge --abort
	mc = merge --continue
	ms = merge --skip
	nmerge = merge --no-ff
	#############
	co = checkout
	cob = checkout -b
	#############
	pr = prune -v
	#############
	ps = push
	psf = push -f
	psu = push -u
	pso = push origin
	psao = push --all origin
	psfo = push -f origin
	psuo = push -u origin
	psom = push origin master
	psfom = push -f origin master
	psuom = push -u origin master
	#############
	pl = pull
	plu = pull -u
	plo = pull origin
	plp = pull upstream
	plom = pull origin master
	plpm = pull upstream master
	#############
	pb = pull --rebase
	pbo = pull --rebase origin
	pbp = pull --rebase upstream
	pbom = pull --rebase origin master
	pbpm = pull --rebase upstream master
	#############
	rb = rebase
	rba = rebase --abort
	rbc = rebase --continue
	rbi = rebase --interactive
	rbs = rebase --skip
	#############
	re = reset
	rh = reset HEAD
	reh = reset --hard
	rem = reset --mixed
	res = reset --soft
	rehh = reset --hard HEAD
	remh = reset --mixed HEAD
	resh = reset --soft HEAD
	#############
	r = remote
	ra = remote add
	rr = remote rm
	rv = remote -v
	rm = remote rename
	rp = remote prune
	rs = remote show
	rao = remote add origin
	rau = remote add upstream
	rso = remote show origin
	rsu = remote show upstream
	rpo = remote prune origin
	rpu = remote prune upstream
	#############
	st = status
	sb = status -s -b
	#############
	sa = stash apply
	sc = stash clear
	sd = stash drop
	sl = stash list
	sp = stash pop
	ss = stash save
	sw = stash show
	#############
	w = show
	wp = show -p
	wr = show -p --no-color
	#############
	svnr = svn rebase
	svnd = svn dcommit
	svnl = svn log --oneline --show-commit
	#############
	assume = update-index --assume-unchanged
	unassume = update-index --no-assume-unchanged
	assumed = "!git ls-files -v | grep ^h | cut -c 3-"
	unassumeall = !git assumed | xargs git update-index --no-assume-unchanged
	assumeall = "!git st -s | awk {'print $2'} | xargs git assume"
	#############
	ours = "!f() { git checkout --ours $@ && git add $@; }; f"
	theirs = "!f() { git checkout --theirs $@ && git add $@; }; f"
	#############
	whois = "!sh -c 'git log -i -1 --pretty=\"format:%an <%ae>\n\" --author=\"$1\"' -"
	whatis = show -s --pretty='tformat:%h (%s, %ad)' --date=short
	#############
	barebranch = !sh -c 'git symbolic-ref HEAD refs/heads/$1 && git rm --cached -r . && git clean -xfd' -
	flat = clone --depth 1
	subpull = !git submodule foreach git pull --tags origin master
	subrepo = !sh -c 'filter-branch --prune-empty --subdirectory-filter $1 master' -
	human = name-rev --name-only --refs=refs/heads/*
	serve = !git daemon --reuseaddr --verbose  --base-path=. --export-all ./.git
	snapshot = !git stash save "snapshot: $(date)" && git stash apply "stash@{0}"
EOT