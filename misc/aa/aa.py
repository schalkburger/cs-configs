import pyautogui
import time
from colorama import Fore, Style
import sys
import os
from pynput import keyboard  # Import keyboard module from pynput


# Function to get the absolute path
def resource_path(relative_path):
    try:
        base_path = sys._MEIPASS
    except Exception:
        base_path = os.path.abspath(
            os.path.dirname(__file__)
        )  # Adjusted to ensure correct path

    return os.path.join(base_path, relative_path)


# Get absolute paths of the images
image_accept_path = resource_path("accept.png")
image_ban_path = resource_path("ban.png")

# Create a global variable to track script status
stop_script = False


# Define a function to stop the script on keypress
def on_press(key):
    global stop_script
    try:
        if key.char == "q":  # Stop the script when 'q' is pressed
            stop_script = True
            print("Stopping script...")
            return False  # Stop listener
    except AttributeError:
        pass


# Function to detect and click the accept image on the screen
def detect_and_click(image_accept_path, image_ban_path):
    global stop_script  # Declare global at the beginning of the function
    print(Fore.BLUE + "Auto Accept starting in 1 second." + Style.RESET_ALL)
    time.sleep(1)
    while not stop_script:
        try:
            # Check for the accept button
            location_accept = pyautogui.locateCenterOnScreen(image_accept_path)
            if location_accept:
                x, y = location_accept
                pyautogui.click(x, y)
                print(
                    Fore.GREEN
                    + "Game found and Accept button clicked."
                    + Style.RESET_ALL
                )
                print(
                    Fore.BLUE
                    + "Waiting for everyone to Accept... restarting search in 5 seconds."
                    + Style.RESET_ALL
                )
                time.sleep(5)

                # Check for the ban button
                location_ban = pyautogui.locateOnScreen(image_ban_path)
                if location_ban:
                    print(
                        Fore.RED
                        + "Ban phase detected. Stopping Auto Accept in 3 seconds."
                        + Style.RESET_ALL
                    )
                    time.sleep(3)
                    # Set the global variable to stop the script
                    stop_script = True
                    break  # Exit the loop to stop the script

            else:
                print("No game found. Retrying in 3 seconds...")
                time.sleep(3)
        except pyautogui.ImageNotFoundException:
            print(
                Fore.YELLOW
                + "No game found. Waiting for Accept button..."
                + Style.RESET_ALL
            )
            time.sleep(5)
        except Exception as e:
            print(Fore.RED + f"An unexpected error occurred: {e}" + Style.RESET_ALL)
            time.sleep(1)


# Start the detection and click process
print("Press 'q' to stop the script.")

# Set up a listener for keypresses
listener = keyboard.Listener(on_press=on_press)
listener.start()  # Start listening for keypresses

# Start the main function
detect_and_click(image_accept_path, image_ban_path)

# Stop the listener and wait for it to finish
listener.stop()
listener.join()
