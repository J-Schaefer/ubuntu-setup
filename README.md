# Setting up a new computer with Ubuntu 18.04

## Necessary programs to install

### Auto install

List of basic programs that will be installed automatically:

* ROS Melodic
* Gnome-Tweaks
* hardinfo
* Seafile client
* Shutter
* Guake

Execute the script `install.bash` for that.

### Manual install

* VS Code: <https://code.visualstudio.com>
  * Install or sync extensions
* Zotero: <https://www.zotero.org/download/>
* LaTeX: <https://www.tug.org/texlive/acquire-netinstall.html>
* Telegram: <https://telegram.org/apps>

### Gnome Extensions

First install the package Chrome-Gnome-Shell when you're using Chrome: <https://wiki.gnome.org/Projects/GnomeShellIntegrationForChrome/Installation> using

````bash
sudo apt-get install chrome-gnome-shell
````

Next install the necessary browser extension: <https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep> in Chrome or <https://addons.mozilla.org/en-US/firefox/addon/gnome-shell-integration/> when you're using Firefox.

Then you can install the gnome extensions

* Multi Monitors Add-On <https://wiki.gnome.org/Projects/GnomeShellIntegrationForChrome/Installation>
* Enable scrolling through open windows:
  
  ````bash
  gsettings set org.gnome.shell.extensions.dash-to-dock scroll-action 'cycle-windows'
  ````

## Set up Thunderbird

* Signatures
* Change Account labels
* E-Mail-Signaturen einstellen
* Advanced --> Config Editor...
  * Separator entfernen: `mail.identity.default.suppress_signature_separator` auf `true`
  * Change default order
    * `mailnews.default_news_sort_order` = `2`
    * `mailnews.default_news_sort_type` =  `18`
    * `mailnews.default_sort_order` = `2`
    * `mailnews.default_sort_type` = `18`
* Composition
  * Remove tick at `Use Paragraph format instead of Body Text by default`
