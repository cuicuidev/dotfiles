import os, glob, shutil
from typing import Iterable

HOME: str = os.environ.get("HOME")

BASEDIR: str = os.path.dirname(os.path.abspath(__file__))
print(BASEDIR)

def ignore(file: str) -> bool:
    ignore = [".git", ".gitignore", "README.md", "venv", "setup.py"]
    if os.path.basename(file) in ignore:
        return True
    return False

def get_configs() -> Iterable[str]:
    files = glob.glob(os.path.join(BASEDIR, "*"))
    hidden_files = glob.glob(os.path.join(BASEDIR, ".*"))
    files = files + hidden_files
    print(files)
    configs = [file for file in files if not ignore(file)]
    print(configs)
    return configs

def copy_configs(configs: Iterable[str]) -> None:
    for config in configs:
        config_name = os.path.basename(config)
        destination = os.path.join(HOME, config_name)

        if os.path.isdir(config):
            shutil.copytree(config, destination, dirs_exist_ok=True)    
        else:
            shutil.copy(config, destination)
        print(f"Copied {config_name} to {HOME}")


def main() -> None:
    configs = get_configs()
    copy_configs(configs=configs)


if __name__ == "__main__":
    main()
