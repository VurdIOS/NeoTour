# NeoTour
## Приложение для путешествия
## 🦦🦦🦦

---

### Немного по технологиям.
- MVVM
- UICollectionViewDiffableDataSource
- UICollectionViewCompositionalLayout
- URLSession
- MockServer Postman
- iOS SDK, XCODE и тд.

### Представляю вашему вниманию приложение для организации путешествий!
Данное приложение было создано для изучения продвинутой работы с коллекциями, а именно с использованием UICollectionViewDiffableDataSource и UICollectionViewCompositionalLayout

Для работы с сетевыми запросами был создан моковый сервер в Postman. Получение данных реализовано с помощью нативного инструмента URLSession

Приложение на данный момент полностью функционирует, возможно со временем могут ссылки на картинки отвалиться( 

## Стартовый экран
Первый экран приложение встречает красивой картинкой загруженной из сети и предлагает пройти дальше для ознакомления с турами
<div align="center">
  <img src="https://github.com/VurdIOS/NeoTour/blob/main/ScreenShotsForREADME/FirstView.png?raw=true" width="250" height="541" alt="Стартовый экран" />
</div>

## Основной экран
Это основное место где шла вся работа, та самая "продвинутая" работа с коллекциями. Здесь представлена одна коллекция разделенная на 3 секции с использованием UICollectionViewCompositionalLayout.
Первая секция это названия категорий туров, имеет горизонтальную прокрутку, все категории грузятся из сети, что позволяет удаленно без изменений в коде добавить несколько категорий и соответственно фильтрация сразу же будет работать.
Далее горизонтальная прокрутка карточек туров которые и фильтруются по категориям, сменяются они красивой анимацией.
И последняя секция вертикальный скрол с неограниченными турами загруженными из сети.
(Дублирование карточек связано с тем что это моковые данные и номерные названия во второй коллеции связано с тестом выбора по категориям, а так как это данные из сети и решил не лесть в постман не менять все там)
<div align="center">
  <img src="https://github.com/VurdIOS/NeoTour/blob/main/ScreenShotsForREADME/mainView.png?raw=true" width="250" height="541" alt="Основной функционал" />
</div>

## Экран детальной информации о туре
После выбора интересующего тура мы проваливаемся в карточку данного тура где можем увидеть основную информацию и комментарии по направлению загруженные из сети. Далее мы можем забровнировать тур нажав на соответствующую кнопку. 
В зависимости от количества комментариев экран может скролиться, так как сам по себе экран таблица
<div align="center">
  <img src="https://github.com/VurdIOS/NeoTour/blob/main/ScreenShotsForREADME/DetailView.png?raw=true" width="250" height="541" alt="Виджет корзины" />
</div>

## Экран бронирования
При нажатии на кнопку бронирования снизу всплавает окно брони в которое нужно ввести свои данные, номер и комментарий, а также количество людей. При нажатии на флажок в поле номера выпадает окошка с выбором кодов стран.
Так как приложение сидит на моковом сервера отсюда уже пост запроса нет, но при желании добавить не составит труда)
<div align="center">
  <img src="https://github.com/VurdIOS/NeoTour/blob/main/ScreenShotsForREADME/OrderView.png?raw=true" width="250" height="541" alt="корзина" />
</div>


---


## Это был хороший опыт, приступаем к следующему проложению)

---

