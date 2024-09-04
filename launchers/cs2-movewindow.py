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

# Get the dimensions of the secondary monitor
secondary_monitor_info = win32api.GetMonitorInfo(
    win32api.MonitorFromPoint(secondary_monitor_coords, 2)
)
secondary_monitor_rect = secondary_monitor_info["Monitor"]
secondary_monitor_width = secondary_monitor_rect[2] - secondary_monitor_rect[0]
secondary_monitor_height = secondary_monitor_rect[3] - secondary_monitor_rect[1]

# Calculate the bottom left corner coordinates
bottom_left_x = secondary_monitor_coords[0]
bottom_left_y = (
    secondary_monitor_coords[1] + secondary_monitor_height - 450
)  # Adjust height as needed

# Wait a bit for the window to open
time.sleep(1)  # Adjust the sleep time if necessary

# Get the handle for the CS2 Launcher window
hwnd = win32gui.FindWindow("CASCADIA_HOSTING_WINDOW_CLASS", None)

if hwnd:
    # Move the window to the bottom left corner of the secondary monitor
    win32gui.MoveWindow(
        hwnd,
        bottom_left_x,
        bottom_left_y,
        500,  # Adjust width as needed
        400,  # Adjust height as needed
        True,
    )
else:
    print("CS2 Launcher window not found")
