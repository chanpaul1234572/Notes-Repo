# System Configuration record

## Anti-virus
Kaspersky endpoint

## Software mangament:
brew 

## Firewall:
Security Growler

## Browser:
Chrome(with plugin)

## Editor:
VS code
Neovim
Bracket

## Terminal:
Iterm2

## Python:

### Python3:
Anaconda(not yet installed)

### Python2.7:
Pip
Wheels
Requests

### Proxy:
Privoxy: 
To have launchd start privoxy now and restart at login:
  brew services start privoxy
Or, if you don't want/need a background service you can just run:
  privoxy /usr/local/etc/privoxy/config

Tor: To have launchd start tor now and restart at login:
  brew services start tor
Or, if you don't want/need a background service you can just run:
  tor

Encrypt: A CA file has been bootstrapped using certificates from the SystemRoots
keychain. To add additional certificates (e.g. the certificates added in
the System keychain), place .pem files in
  /usr/local/etc/openssl/certs

and run
  /usr/local/opt/openssl/bin/c_rehash

openssl is keg-only, which means it was not symlinked into /usr/local,
because Apple has deprecated use of OpenSSL in favor of its own TLS and crypto libraries.

If you need to have openssl first in your PATH run:
  echo 'export PATH="/usr/local/opt/openssl/bin:$PATH"' >> ~/.zshrc

For compilers to find openssl you may need to set:
  export LDFLAGS="-L/usr/local/opt/openssl/lib"
  export CPPFLAGS="-I/usr/local/opt/openssl/include"

## Software signature:
GnuPG 

## Virtual Machine 
### Virtual Box + Vargent
### VMware:
Ubuntu 18.04.1 (/Users/paulchan/Documents/Virtual Machines.localized)

## VPN:
Forticlient

## /etc/hosts:
Setted

## video player:
VLC player

## Compression and Extraction tool
the unarchiver
keka

##javascript runtime
node.js v10.9.0
npm 6.2.0
icu4c is keg-only, which means it was not symlinked into /usr/local,
because macOS provides libicucore.dylib (but nothing else).

If you need to have icu4c first in your PATH run:
  echo 'export PATH="/usr/local/opt/icu4c/bin:$PATH"' >> ~/.zshrc
  echo 'export PATH="/usr/local/opt/icu4c/sbin:$PATH"' >> ~/.zshrc

For compilers to find icu4c you may need to set:
  export LDFLAGS="-L/usr/local/opt/icu4c/lib"
  export CPPFLAGS="-I/usr/local/opt/icu4c/include"

==> Summary
🍺  /usr/local/Cellar/icu4c/62.1: 250 files, 67.3MB
==> Installing node
==> Downloading https://homebrew.bintray.com/bottles/node-10.9.0.high_sierra.bot
######################################################################## 100.0%
==> Pouring node--10.9.0.high_sierra.bottle.tar.gz
==> Caveats
Bash completion has been installed to:
  /usr/local/etc/bash_completion.d
==> Summary
🍺  /usr/local/Cellar/node/10.9.0: 4,022 files, 49.0MB
==> Caveats
==> icu4c
icu4c is keg-only, which means it was not symlinked into /usr/local,
because macOS provides libicucore.dylib (but nothing else).

If you need to have icu4c first in your PATH run:
  echo 'export PATH="/usr/local/opt/icu4c/bin:$PATH"' >> ~/.zshrc
  echo 'export PATH="/usr/local/opt/icu4c/sbin:$PATH"' >> ~/.zshrc

For compilers to find icu4c you may need to set:
  export LDFLAGS="-L/usr/local/opt/icu4c/lib"
  export CPPFLAGS="-I/usr/local/opt/icu4c/include"

==> node
Bash completion has been installed to:
  /usr/local/etc/bash_completion.d

## keep Screen active
KeepingYouAwake

## DNS protection:
DNSmasq (with dnssec)
To configure dnsmasq, take the default example configuration at
  /usr/local/etc/dnsmasq.conf and edit to taste.
To have launchd start dnsmasq now and restart at startup:
  sudo brew services start dnsmasq

## Connection
telnet