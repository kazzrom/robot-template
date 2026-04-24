### include_it_enterprise (bool) - Включить файлы для работы с IT-Enterprise?
- `Yes` - сохраняет готовые файлы для авторизации и работы с IT-Enterprise. Автоматически устанавливает опцию `install_playwright` в `True`.
- `No` - не включает эти файлы в проект.

### install_playwright (bool) - Установить Playwright (Browser Library)?
- `Yes` - устанавливает Playwright, а конкретнее `robotframework-browser`.

### use_dev_containers (bool) - Использовать Dev Containers?
- `Yes` - сохраняет папку `.devcontainer` и готовый `devcontainer.json` для запуска проекта в контейнере. Для работы необходимо установить Docker и расширение Dev Containers в Visual Studio Code.
- `No` - не включает эту папку в проект. Для инициализации проекта необходим uv и Node.js. Шаблонизатор сам создаст виртуальную среду, установит необходимые библиотеки и зависимости.
