# Setup Apache2 VirtualHosting 
## The term Virtual Host refers to the practice of running more than one web site (such as company1.example.com and company2.example.com) on a single machine. Virtual hosts can be "IP-based", meaning that you have a different IP address for every web site, or "name-based", meaning that you have multiple names running on each IP address. The fact that they are running on the same physical server is not apparent to the end user.
## Apache was one of the first servers to support IP-based virtual hosts right out of the box. Versions 1.1 and later of Apache support both IP-based and name-based virtual hosts (vhosts). The latter variant of virtual hosts is sometimes also called host-based or non-IP virtual hosts

### Step 1: Install Apache2
``` bash
sudo apt-get update
sudo apt-get install apache2
```

### Step 2: Create Virtual Hosting Configuration Files
Virtual host configurations file will live in the directory : **/etc/apache2/sites-available**

To create some new virtual host config files, For examples:
``` bash
sudo nano /etc/apache2/sites-available/VirtualHost1.conf
sudo nano /etc/apache2/sites-available/VirtualHost2.conf
sudo nano /etc/apache2/sites-available/VirtualHost3.conf
```
### Step 3: Configure VirtualHost Files:
The format is usually like that:
``` bash
<VirtualHost *:80>
    ServerName www.virtualhost1.com
    ServerAdmin webmaster@virtualhost1.com
    DocumentRoot /var/www/html/virtualhost1.com
    ErrorLog /var/log/apache2/virtual.host.error.log
    CustomLog /var/log/apache2/virtual.host.access.log combined
    LogLevel warn
</VirtualHost>
```
Repeat the same for VirtualHost 2:
```bash
<VirtualHost *:80>
    ServerName www.virtualhost1.com
    ServerAdmin webmaster@virtualhost1.com
    DocumentRoot /var/www/html/virtualhost1.com
    ErrorLog /var/log/apache2/virtual.host.error.log
    CustomLog /var/log/apache2/virtual.host.access.log combined
    LogLevel warn
</VirtualHost>
```

### Step 4: Create DocumentRoot directories for those websites location
``` bash
sudo mkdir -p /var/www/html/virtualhost1.com
sudo mkdir -p /var/www/html/virtualhost2.com
...
```
Then put those website contents into those directoies

### Step 5: Configure /etc/hosts
Add some line on the **/etc/hosts**, For example
```bash
127.0.0.1    virtualhost1.com
127.0.0.1    virtualhost2.com
...
```

### Step 6: enable each site
``` bash
sudo a2ensite VirtualHost1.conf
sudo a2ensite VirtualHost2.conf
...
```

### Step 7: Restart Apache2
```
sudo service apache2 restart
```
