import os
import subprocess
from gi.repository import Nautilus, GObject

class CopyAsPathExtension(GObject.GObject, Nautilus.MenuProvider):
    def __init__(self):
        pass

    def menu_activate_cb(self, menu, files):
        paths = "\n".join([f.get_location().get_path() for f in files])
        subprocess.run(["xclip", "-selection", "clipboard"], input=paths.encode())
        subprocess.run(["notify-send", "Copy as Path", "Paths copied to clipboard"])

    def get_file_items(self, window, files):
        item = Nautilus.MenuItem(
            name="CopyAsPathExtension::CopyAsPath",
            label="Copy as Path",
            tip="Copy the full path to the clipboard",
        )
        item.connect("activate", self.menu_activate_cb, files)
        return [item]
