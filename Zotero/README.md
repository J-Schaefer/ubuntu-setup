# Installation of Zotero

First one has to download the binaries from <https://www.zotero.org/download/>.
To install the program move the folder into the desired directory and start the  script `zotero`.

## LaTeX

To use it with LaTeX, the extension _Better BibTeX for Zotero_ should be installed (see [here](https://github.com/retorquere/zotero-better-bibtex/releases)). After downloading the file the Add-On can be installed in Zotero with _Tools &rarr; Add-ons_.

There are some improvements respectively bug fixes, that can improve the overall experience.

* Change Key Format to : `[auth:nopunctordash][authForeIni][year][month:capitalize][shorttitle3_3]`  
  That helps when the library is synced using the Zotero servers. Because the BibTeX key are generated on the local machine there could be duplicate keys when they are too short.
* Add js content to Better BibTeX --> Advanced --> Postscript (see file)
* Change Skip word list (see file)
* AFTER that add your account for synchronisation or your items
* Otherwise refresh bibtex keys
