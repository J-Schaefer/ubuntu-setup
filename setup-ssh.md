# Setting up SSH

First you have to generate a pair of keys (a private and a public one).

```bash
ssh-keygen
```

Then enter a keyphrase if you want to.
To SSH into a PC you need to enter

```bash
ssh IP address
```

To do that faster you can associate a name with an IP address inside the file:

```bash
sudo nano /etc/hosts
```

To access a computer passwordless you can add your SSH key to the destination computers authorizes_keys file.

```bash
nano .ssh/authorized_keys
```

when the connection is refused do:

```bash
sudo apt update
sudo apt install openssh-server
sudo ufw allow 22
```
