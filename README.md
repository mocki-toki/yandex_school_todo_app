<h6 align="center">
    <picture>
      <img alt="Done" src="assets/app_icon.png">
    </picture>
    <br>
</h6>

<h3 align="center">
Done
<h6 align="center">
  <a href="https://github.com/cirnok/todo_app/releases"><img alt="Releases" src="https://img.shields.io/badge/Releases-purple.svg"></a>
  <a href="CHANGELOG.md"><img alt="Changelog" src="https://img.shields.io/badge/Changelog-blue.svg"></a>
  <a href="https://github.com/cirnok/todo_app/actions/workflows/android.yml"><img alt="Android" src="https://github.com/cirnok/todo_app/actions/workflows/android.yml/badge.svg"></a>
</h6>
<br>
</h3>

<p align="center">
  <img height="400" src="https://user-images.githubusercontent.com/25152332/182955150-c16f04af-6267-4119-93fb-24c8841ad143.png">
  <img height="400" src="https://user-images.githubusercontent.com/25152332/182955177-3442352c-17ac-42be-a85d-effd6838262f.png">
  <img height="400" src="https://user-images.githubusercontent.com/25152332/182955192-0211347a-026c-49eb-8775-e3f8563e59a4.png">
  <img height="400" src="https://user-images.githubusercontent.com/25152332/182955209-0dc669be-bb16-45bc-bec8-8ec93764c3f0.png">
</p>

## Описание

To-do Flutter приложение, в рамках проектной деятельности во время участия в Школе мобильной разработки Яндекса.

## Зависимости

**State management:** [`bloc`](https://pub.dev/packages/bloc)

**Dependency injection:** [`dino`](https://github.com/Exeteres/dino)

**Database:** [`hive`](https://pub.dev/packages/hive)

**Network:** [`dio`](https://pub.dev/packages/dio), [`retrofit`](https://pub.dev/packages/retrofit)

## Важно

Перед сборкой приложения, необходимо выполнить последовательность команд:

```bash
flutter pub run index_generator
flutter pub run build_runner build --delete-conflicting-outputs
flutter pub run index_generator
```

Для Visual Studio Code можно выполнить задачу "Generate code", в меню, вызываемом сочетанием клавиш cmd + shift + b.

## Функционал

### Добавление, удаление и редактирование задач.

Пользователь взаимодействует с локальной БД приложения, после чего выполняется асинхронная операция синхронизации с API.
Это позволяет работать с приложением максимально быстро и плавно, без необходимости ожидания подгрузки информации, либо завершения действий (создания, изменения, удаления задачи).

Если синхронизация не удалась (нет интернета, ошибка сервера и тд), то операция повторяется каждые 5 секунд, пока не окажется успешной.

В состоянии простоя, приложение синхронизирует локальную БД с данными из API каждую минуту. Также синхронизация проводится при открытии приложения, изменении состояния подключения к сети и возврате в приложение из background.

### Merging изменений локальной базы данных с данными из API.

В локальной БД хранятся не только задачи, но и состояния несинхронизированных с API изменений. При синхронизации происходит слияние данных из API с несинхронизированными изменениями из локальной БД.

Решение конфликтов при слиянии происходит по стратегии, направленной на минимализацию возможного ущерба. Это позволяет отменить удаление задач, если экземляр задачи в синхронизированной копии на сервере окажется более актуальным, чем в локальной копии (либо наоборот, на устройстве актуальнее чем на сервере), в которой была запрошена операция удаления.

Например, если пользователь удалил задачу на `устройстве 1` без доступа к сети, а на `устройстве 2`, которое может синхронизироваться с API, изменил данную задачу, то при следующей успешной синхронизации на `устройстве 1` удаление будет отменено, что позволит не потерять актуальные изменения.

Также, если на устройстве с доступом к сети удалить задачу, а потом внести изменения в экземпляре данной задачи на другом устройстве, и провести синхронизацию с API, то задача будет восстановлена на сервере.

#### Также было реализовано

- [x] Тёмная тема
- [x] Локализация
- [x] Navigator 1.0

#### В планах

- [ ] Firebase Crashlytics
- [ ] Firebase Analytics
- [ ] Remote Config: переключение цвета важности
- [ ] Анимации
- [ ] Переход на Navigator 2.0
- [ ] Поддержка горизонтальной ориентации
- [ ] Поддержка больших экранов
- [ ] Unit-тесты
- [ ] Интеграционные тесты
- [ ] Deeplink
- [ ] Flavors (Testing, Production)
