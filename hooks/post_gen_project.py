import os
import subprocess


def run_command(command):
    """Вспомогательная функция для запуска команд в терминале"""
    result = subprocess.run(command, shell=True, capture_output=True, text=True)
    if result.returncode != 0:
        print(f"Ошибка при выполнении: {command}")
        print(result.stderr)
    return result.returncode


def finalize_files():
    if os.path.exists(".env.example"):
        os.rename(".env.example", ".env")
        print("+++ Файл .env создан и готов к заполнению.")

    if os.path.exists("gen_tmp.py"):
        os.rename("gen_tmp.py", "gen.py")
        print("+++ Файл gen.py создан и готов к заполнению.")


def include_it_enterprise():
    if "{{ cookiecutter.include_it_enterprise }}" == "no":
        files_it_enterprise = [
            "resources/it_enterprise.resource",
            "variables/it_enterprise.py",
            "locators/it_enterprise.py",
        ]

        for file in files_it_enterprise:
            if os.path.exists(file):
                os.remove(file)


def init_venv():
    print("Инициализирую виртуальное окружение через uv")
    run_command("uv init --no-workspace")

    libraries = ["robotframework", "dotenv"]

    if "{{ cookiecutter.install_playwright }}" == "yes":
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
    include_it_enterprise()
    init_venv()
    finalize_files()
    init_git()


if __name__ == "__main__":
    main()
