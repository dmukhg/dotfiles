If you are using gtk apps from gnome but aren't using gnome, then your settings
for gtk-3.0 apps may be messed up.

First select a theme that supports gtk-3.0 themes. Eg. Adwaita. Now tell your
apps to use this theme.

```shell
mkdir -p ~/.config/gtk-3.0/
cp /usr/share/themes/Adwaita/gtk-3.0/settings.ini ~/.config/gtk-3.0/
```

Now if you try your apps, they may or may not work. Use the shell script in
this directory to create the necessary files.

change /usr/share/themes/Adwaita/gtk-3.0/gtk.css and gtk-main.css from

```css
@import url("resource:///org/gnome/adwaita/gtk-main.css");
```

to 

```css
@import url("file:///usr/share/themes/Adwaita/gtk-3.0/files/gtk-main.css");
```

Attribution:
http://tacticalvim.wordpress.com/2013/01/05/using-the-adwaita-gtk3-theme-with-xfce-and-lightdm/
