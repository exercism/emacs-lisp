# Installing Emacs

Since Emacs Lisp (elisp) is the extension language for Emacs, you'll need to
install [GNU Emacs](http://www.gnu.org/software/emacs/) first.

It is recommended to get the latest Emacs, but 28.1 or higher should be considered the target implementation for the exercises.
If you already have Emacs installed you can check the Emacs version via `M-x emacs-version RET`.

## On OS X
The easiest way is to visit [Emacs For Mac OS X](http://emacsformacosx.com/) and download the dmg, which will
install GNU Emacs as a packaged OS X app.

Alternatives exist, such as Aquamacs (not recommended) or installing via
[Homebrew](https://formulae.brew.sh/formula/emacs), if you prefer.

## On Linux
On some distros, Emacs is already installed, since it's part of GNU.

### Ubuntu
The currently recommended way to install the most recent Emacs is via [snap](https://snapcraft.io/emacs):

```
sudo snap install emacs --classic
```

If you don't want to use snap you can also install Emacs via snap, but the version available from the Ubuntu repositories is often out of date.
If you want to install a more recent version of Emacs via apt you'll need to use a [PPA](https://launchpad.net/ubuntu/+ppas?name_filter=emacs) or [build from source](https://www.emacswiki.org/emacs/BuildingEmacs).

If you don't care about installing the latest version, it should be as simple as

```
sudo apt-get install emacs
```

### Arch
Arch usually ships with the latest Emacs version, so run:

```
sudo pacman -S emacs
```

and you should be set.

### Other distros
Check with your distro to see what version is current, and use your package
manager or build from source as appropriate.

### Windows
To install Emacs on Windows head over to the nearest
[FTP archive mirror](https://ftpmirror.gnu.org/emacs/windows), grab the installer (=emacs-XX.X-installer.exe=), and launch it.
If you don't want use Emacs without installing it you can grab the file with the pattern =emacs-XX.x.zip=, unpack it and launch `bin\runemacs.exe`.

If you are using [MSYS2](https://www.msys2.org/) you can install the 64bits build of Emacs with

```
pacman -S mingw-w64-x86_64-emacs
```

or the 32bits build with

```
pacman -S mingw-w64-i686-emacs
```
