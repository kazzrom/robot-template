### Запуск робота:
```bash
python main.py
```

### Создание ресурса c локаторами и переменными ([подробнее](https://github.com/kazzrom/rf-pw-standards/blob/main/PROJECT_STRUCTURE.md#genpy)):
```bash
python gen.py <название нового ресурса>
```

### Создание образа и отправка его на Docker Registary ([подробнее](https://github.com/kazzrom/rf-pw-standards/blob/main/PROJECT_STRUCTURE.md#deploysh)):
```bash
./deploy.sh
```

### Просмотр действий робота в реальном времени (GUI)
Если разработка ведётся в Dev Container, то для проброса пользовательского интерйфейса браузера, с которым взаимодействует робот, необходимо запустить скрипт:
```bash
 /usr/local/bin/start-vnc.sh
 ```
После запуска перейти по ссылке `http://localhost:6080/vnc.html` и нажать кнопку 'Подключение'

Документация:
- [Правила оформления кода](https://github.com/kazzrom/rf-pw-standards/blob/main/STYLEGUIDE.md)
- [Описание структуры проекта](https://github.com/kazzrom/rf-pw-standards/blob/main/PROJECT_STRUCTURE.md)
