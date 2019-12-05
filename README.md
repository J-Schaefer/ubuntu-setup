# Setting up a new computer with Ubuntu

## Setting up ROS

To install ROS start the script `install_ros.bash`.
The script will install Melodic or Kinetic depending on the Ubuntu version.

To install the Frank_ROS stuff, execute the script `install_franka.bash`.

## Automatically installed programs

List of basic programs that will be installed automatically:

* Guake
* Gnome-Tweaks
* htop
* hardinfo
* Seafile client
* Shutter

Execute the script `install_programs.bash` for that.

## Manually to install programs

* VS Code: <https://code.visualstudio.com>
  * Install or sync extensions
* Zotero: <https://www.zotero.org/download/>
  * Start script `zotero`
  * Install extension <https://github.com/retorquere/zotero-better-bibtex/releases>
  * Change Key Format to : `[auth:nopunctordash][authForeIni][year][month:capitalize][shorttitle3_3]`
  * Add js content to Better BibTeX --> Advanced --> Postscript
  * Tick the option `Deterministically order references and field...`
  * Change Skip word list
  * AFTER that add your account or your items
  * Otherwise refresh bibtex keys
* LaTeX: <https://www.tug.org/texlive/acquire-netinstall.html>
* Telegram: <https://telegram.org/apps>

### Gnome Extensions

First install the package Chrome-Gnome-Shell when you're using Chrome: <https://wiki.gnome.org/Projects/GnomeShellIntegrationForChrome/Installation> using

````bash
sudo apt install chrome-gnome-shell
````

Next install the necessary browser extension:

Chrome: <https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep>

Firefox:
<https://addons.mozilla.org/en-US/firefox/addon/gnome-shell-integration/>

Then you can install the gnome extensions

* Multi Monitors Add-On <https://extensions.gnome.org/extension/921/multi-monitors-add-on/>
* Enable scrolling through open windows:
  
  ````bash
  gsettings set org.gnome.shell.extensions.dash-to-dock scroll-action 'cycle-windows'
  ````

* User Themes <https://extensions.gnome.org/extension/19/user-themes/>

### Set up Ubuntu

#### Enable asterisks in passwords

Enter

````bash
sudo visudo
````

add the line

````bash
Defaults        pwfeedback
````

beneath the line

````bash
Defaults        env_reset
````

and save the file.

#### Enable Super key for drag and drop

In Gnome Tweaks in `Windows` enable `Windows Action Key`

## Set up Thunderbird

* Create/set up signatures
* Change Account labels
* Advanced --> Config Editor...
  * Separator entfernen: `mail.identity.default.suppress_signature_separator` auf `true`
  * Change default order
    * `mailnews.default_news_sort_order` = `2`
    * `mailnews.default_news_sort_type` =  `18`
    * `mailnews.default_sort_order` = `2`
    * `mailnews.default_sort_type` = `18`
* Composition
  * Remove tick at `Use Paragraph format instead of Body Text by default`
