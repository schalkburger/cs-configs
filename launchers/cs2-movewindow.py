import win32gui
import win32api
import time


def get_secondary_monitor_coords():
    # Enumerate through all monitors
    for monitor in win32api.EnumDisplayMonitors():
        # Check if the monitor is not the primary monitor
        if monitor != win32api.EnumDisplayMonitors(None, None)[0]:
            # Get the monitor coordinates
            return monitor[2][:2]


# Get the coordinates of the secondary monitor
secondary_monitor_coords = get_secondary_monitor_coords()

# Wait a bit for the window to open
time.sleep(5)  # Adjust the sleep time if necessary

# Get the handle for the CS2 Launcher window
hwnd = win32gui.FindWindow(None, "CS2 Launcher")

if hwnd:
    # Move the window to the secondary monitor
    win32gui.MoveWindow(
        hwnd,
        secondary_monitor_coords[0],
        secondary_monitor_coords[1],
        1440,  # Adjust width as needed
        1080,  # Adjust height as needed
        True,
    )
else:
    print("CS2 Launcher window not found")
