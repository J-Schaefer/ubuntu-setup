# How to use the newest version of QtCreator in ROS

```bash
sudo gedit /etc/profile
```

add at the bottom (this is the path to the QtCreator executable):

```bash
export PATH=/path/to/QtCreator/executable/bin:$PATH
```

then execute

```bash
. /etc/profile
```

Restart system and you're done!
