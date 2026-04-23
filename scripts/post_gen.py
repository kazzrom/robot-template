import argparse
import subprocess


parser = argparse.ArgumentParser()
parser.add_argument("--playwright", type=str)
parser.add_argument("--dev_containers", type=str)
args, _ = parser.parse_known_args()

install_playwright = args.playwright == "True"
use_dev_containers = args.dev_containers == "True"


def run_command(command):
    result = subprocess.run(command, shell=True, capture_output=True, text=True)
    if result.returncode != 0:
        print(f"Ошибка при выполнении: {command}")
        print(result.stderr)
    return result.returncode


def init_venv():
    print("Инициализирую виртуальное окружение через uv")
    run_command("uv init --no-workspace")

    libraries = ["robotframework", "dotenv"]

    if install_playwright:
        libraries.append("robotframework-browser")

    if libraries:
        print(f"Устанавливаю библиотеки: {', '.join(libraries)}")
        lib_string = " ".join(libraries)
        run_command(f"uv add {lib_string}")

    if "robotframework-browser" in libraries:
        print("Инициализирую Playwright (rfbrowser init chromium)")
        run_command("uv run rfbrowser init chromium")


def init_git():
    print("Инициализирую Git")
    run_command("git init")
    run_command("git branch -m main")
    run_command("git add .")
    run_command('git commit -m "chore: initial commit from template"')
    run_command("git checkout -b dev")
    print("+++ Git репозиторий готов. Текущая ветка: dev")


def main():
    if not use_dev_containers:
        init_venv()
    init_git()


main()
