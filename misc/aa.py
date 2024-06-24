import pyautogui
import time
from colorama import Fore, Style
import sys
import os
from pynput import keyboard  # Import keyboard module from pynput


# Function to get the absolute path
def resource_path(relative_path):
    """Get absolute path to resource, works for dev and for PyInstaller"""
    try:
        base_path = sys._MEIPASS
    except Exception:
        base_path = os.path.abspath(
            os.path.dirname(__file__)
        )  # Adjusted to ensure correct path

    return os.path.join(base_path, relative_path)


# Get absolute path of the image
image_path = resource_path("image.png")
# print(f"Absolute image path: {image_path}")

# Check if the image file exists
# if os.path.exists(image_path):
#     print(f"Image file exists at: {image_path}")
# else:
#     print("Image file does not exist.")
#     sys.exit(1)


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


# Function to detect and click the image on the screen
def detect_and_click(image_path):
    print(
        Fore.BLUE
        + "Auto Accept script started and waiting for Accept button."
        + Style.RESET_ALL
    )
    time.sleep(3)
    while not stop_script:
        try:
            location = pyautogui.locateCenterOnScreen(image_path)
            if location:
                x, y = location
                pyautogui.click(x, y)
                print(
                    Fore.GREEN
                    + "Game found and Accept button clicked."
                    + Style.RESET_ALL
                )
                print(Fore.GREEN + "Restarting in 3 seconds" + Style.RESET_ALL)
                time.sleep(3)
            else:
                print("No game found. Retrying in 2 seconds...")
                time.sleep(2)
        except pyautogui.ImageNotFoundException:
            print("No game found yet. Waiting for Accept button...")
            time.sleep(4)
        except Exception as e:
            print(f"An unexpected error occurred: {e}")
            time.sleep(1)


# Start the detection and click process
print("Press 'q' to stop the script.")

# Set up a listener for keypresses
listener = keyboard.Listener(on_press=on_press)
listener.start()  # Start listening for keypresses

# Start the main function
detect_and_click(image_path)

# Wait for the listener to finish before exiting
listener.join()
