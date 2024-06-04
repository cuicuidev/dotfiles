import os, glob, shutil
from typing import Iterable
from colors import ok, fail, warn, underline, bold, italic, Colors

HOME: str | None = os.environ.get("HOME")

if HOME is None:
    fail("HOME environment variable not found")
    exit(1)

BASEDIR: str = os.path.dirname(os.path.abspath(__file__))
print(BASEDIR)

def ignore(file: str) -> bool:
    ignore = [".git", ".gitignore", "README.md", "venv", "setup.py", "__pycache__", "colors.py"]
    if os.path.basename(file) in ignore:
        return True
    return False

def get_configs() -> Iterable[str]:
    files = glob.glob(os.path.join(BASEDIR, "*"))
    hidden_files = glob.glob(os.path.join(BASEDIR, ".*"))
    files = files + hidden_files
    configs = [file for file in files if not ignore(file)]
    return configs

def copy_configs(configs: Iterable[str]) -> None:
    for config in configs:
        config_name = os.path.basename(config)
        destination = os.path.join(HOME, config_name)

        if os.path.isdir(config):
            shutil.copytree(config, destination, dirs_exist_ok=True)    
        else:
            shutil.copy(config, destination)
        italic(f"Copied {config_name} to {HOME}")

def ask_installation_options(configs: Iterable[str]) -> Iterable[str]:
    configs_to_install = []
    for config in configs:
        config_name = os.path.basename(config)
        destination = os.path.join(HOME, config_name)

        install_this_config = input("Install " + Colors.BOLD + f"{config_name}" + Colors.END + " to "
                                    + Colors.BOLD + f"{destination}" + Colors.END + "? (" + Colors.OK
                                    + "y" + Colors.END + "/" + Colors.FAIL + "n" + Colors.END + ") ")
        if install_this_config.lower() == "y":
            configs_to_install.append(config)
            ok(f"Added {config_name} to install list")
        else:
            warn(f"Skipped {config_name}")

    return configs_to_install

def main() -> None:
    configs = get_configs()
    configs = ask_installation_options(configs=configs)
    copy_configs(configs=configs)


if __name__ == "__main__":
    main()
