import os
import random
import subprocess
import json
import argparse

HOME = os.getenv("HOME")

WALLPAPER_FOLDER = os.path.join(HOME, ".wallpapers")  # type: ignore
STATE_FILE = os.path.join(WALLPAPER_FOLDER, "state.json")  # type: ignore

def get_wallpapers(folder):
    wallpapers = [f for f in os.listdir(folder) if f.endswith(('.jpg', '.jpeg', '.png', '.bmp', '.gif'))]
    wallpapers.sort()
    return wallpapers

def load_state():
    if os.path.exists(STATE_FILE):
        with open(STATE_FILE, 'r') as f:
            state = json.load(f)
        last_index = state.get("last_index", random.randint(0, len(get_wallpapers(WALLPAPER_FOLDER)) - 1))
    else:
        last_index = random.randint(0, len(get_wallpapers(WALLPAPER_FOLDER)) - 1)
    return last_index

def save_state(index):
    with open(STATE_FILE, 'w') as f:
        json.dump({"last_index": index}, f)

def main(reverse):
    wallpapers = get_wallpapers(WALLPAPER_FOLDER)
    if not wallpapers:
        print("No wallpapers found in the specified folder.")
        return

    last_index = load_state()
    di = -1 if reverse else 1
    next_index = (last_index + di) % len(wallpapers)
    next_wallpaper = os.path.join(WALLPAPER_FOLDER, wallpapers[next_index])

    try:
        subprocess.run([
            "swww",
            "img",
            next_wallpaper,
            "--transition-type",
            "random",
        ], check=True)

        subprocess.run([
            "wal",
            "-i",
            next_wallpaper,
            "-n"
        ])
        print(f"Wallpaper changed to: {next_wallpaper}")

    except subprocess.CalledProcessError as e:
        print(f"Error changing wallpaper: {e}")
    
    save_state(next_index)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Cycle wallpapers with optional reverse direction.")
    parser.add_argument(
        "--reverse", 
        action="store_true", 
        help="Cycle through wallpapers in reverse order."
    )
    args = parser.parse_args()

    # Call the change_wallpaper function with the reverse flag
    main(reverse=args.reverse)

