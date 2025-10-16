locals {
  dock_items = [
    { name = "Safari", type = "App", path = "file://localhost/Applications/Safari.app/" },
    { name = "Mail", type = "App", path = "file://localhost/Applications/Mail.app/" },
    { name = "Calendar", type = "App", path = "file://localhost/Applications/Calendar.app/" },
    { name = "Contacts", type = "App", path = "file://localhost/Applications/Contacts.app/" },
    { name = "Notes", type = "App", path = "file://localhost/Applications/Notes.app/" },
    { name = "Reminders", type = "App", path = "file://localhost/Applications/Reminders.app/" },
    { name = "Music", type = "App", path = "file://localhost/Applications/Music.app/" },
    { name = "Photos", type = "App", path = "file://localhost/Applications/Photos.app/" },
    { name = "Messages", type = "App", path = "file://localhost/Applications/Messages.app/" },
    { name = "FaceTime", type = "App", path = "file://localhost/Applications/FaceTime.app/" },
    { name = "Downloads Folder", type = "Folder", path = "~/Downloads" },
    { name = "Documents Folder", type = "Folder", path = "~/Documents" },
    { name = "Applications", type = "Folder", path = "/Applications" },
    { name = "Desktop Folder", type = "Folder", path = "~/Desktop" },
    { name = "Hosts File", type = "File", path = "/etc/hosts" },
    { name = "Bash Profile", type = "File", path = "~/.bash_profile" },
    { name = "System Preferences", type = "App", path = "file://localhost/Applications/System Settings.app/" },
    { name = "Terminal", type = "App", path = "file://localhost/Applications/Utilities/Terminal.app/" },
    { name = "Finder", type = "App", path = "file://localhost/System/Library/CoreServices/Finder.app/" },
    { name = "Activity Monitor", type = "App", path = "file://localhost/Applications/Utilities/Activity Monitor.app/" }
  ]
}

resource "jamfpro_dock_item" "dock_items" {
  for_each = { for d in local.dock_items : d.name => d }

  name = "${var.team-prefix}-${each.value.name}"
  type = each.value.type
  path = each.value.path
}
