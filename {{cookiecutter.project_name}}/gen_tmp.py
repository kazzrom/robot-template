import os
import sys


def create_resource(name: str):
{% raw %}
    resource_content = f'''*** Settings ***
Documentation    {name}
Resource    ${{EXECDIR}}${{/}}resources${{/}}common.resource
Variables    ${{EXECDIR}}${{/}}variables${{/}}{name}.py
Variables    ${{EXECDIR}}${{/}}locators${{/}}{name}.py


*** Keywords ***
My Keyword
    Log To Console    keyword
'''
{% endraw %}
    
    files = {
        f"resources/{name}.resource": resource_content,
        f"variables/{name}.py": "",
        f"locators/{name}.py": ""
    }

    for path, content in files.items():
        if os.path.exists(path):
            print(f"!!! Файл {path} уже существует, пропускаю.")
            continue
            
        with open(path, "w", encoding="utf-8") as f:
            f.write(content)
        print(f"+++ Создан: {path}")


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Использование: python gen.py <название_ресурса>")
    else:
        create_resource(sys.argv[1])
