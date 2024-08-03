import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'uk', 'ru'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? ukText = '',
    String? ruText = '',
  }) =>
      [enText, ukText, ruText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Home
  {
    'ubnscupp': {
      'en': 'Flights',
      'ru': 'Рейсы',
      'uk': 'Авіарейси',
    },
    'atvc6iqr': {
      'en': 'Aircraft',
      'ru': 'Самолет',
      'uk': 'Літак',
    },
    'pjg1bqqz': {
      'en': 'Airports',
      'ru': 'Аэропорты',
      'uk': 'Аеропорти',
    },
    'at9l86kl': {
      'en': 'Users',
      'ru': 'Пользователи',
      'uk': 'Користувачі',
    },
    'ehv5p6gs': {
      'en': 'Finances',
      'ru': 'Финансы',
      'uk': 'Фінанси',
    },
    '6mev8r9u': {
      'en': 'Dashboard',
      'ru': 'Панель приборов',
      'uk': 'Панель приладів',
    },
  },
  // Auth1
  {
    '48nprh5c': {
      'en': 'Sign In',
      'ru': 'Войти',
      'uk': 'Увійти',
    },
    'rarnkde6': {
      'en': 'Let\'s get started by filling out the form below.',
      'ru': 'Давайте начнем с заполнения формы ниже.',
      'uk': 'Давайте почнемо, заповнивши форму нижче.',
    },
    '69fbpcfe': {
      'en': 'Email',
      'ru': 'Электронная почта',
      'uk': 'Електронна пошта',
    },
    'yyzf0rz1': {
      'en': 'Password',
      'ru': 'Пароль',
      'uk': 'Пароль',
    },
    's21bf2z0': {
      'en': 'Sign In',
      'ru': 'Войти',
      'uk': 'Увійти',
    },
    'oeefxtqu': {
      'en': 'Forgot Password',
      'ru': 'Забыли пароль',
      'uk': 'Забули пароль',
    },
    'cyjs70hb': {
      'en': 'Or sign up with',
      'ru': 'Или зарегистрируйтесь с помощью',
      'uk': 'Або зареєструйтесь у',
    },
    '2ekw4tiz': {
      'en': 'Continue with Google',
      'ru': 'Продолжить с Google',
      'uk': 'Продовжуйте з Google',
    },
    't9hip06w': {
      'en': 'Continue with Apple',
      'ru': 'Продолжить с Apple',
      'uk': 'Продовжуйте з Apple',
    },
    'lumlotd6': {
      'en': 'Sign Up',
      'ru': 'Зарегистрироваться',
      'uk': 'Зареєструватися',
    },
    'm6zyfa64': {
      'en': 'Let\'s get started by filling out the form below.',
      'ru': 'Давайте начнем с заполнения формы ниже.',
      'uk': 'Давайте почнемо, заповнивши форму нижче.',
    },
    'sgj8wzmt': {
      'en': 'Email',
      'ru': 'Электронная почта',
      'uk': 'Електронна пошта',
    },
    'e5qtb9l4': {
      'en': 'Password',
      'ru': 'Пароль',
      'uk': 'Пароль',
    },
    's4i34zmi': {
      'en': 'Confirm Password',
      'ru': 'Подтвердите пароль',
      'uk': 'Підтвердьте пароль',
    },
    'o1vax8m3': {
      'en': 'Create Account',
      'ru': 'Зарегистрироваться',
      'uk': 'Створити акаунт',
    },
    'f5kpe3rz': {
      'en': 'Or sign up with',
      'ru': 'Или зарегистрируйтесь с помощью',
      'uk': 'Або зареєструйтесь у',
    },
    '7ig21is0': {
      'en': 'Continue with Google',
      'ru': 'Продолжить с Google',
      'uk': 'Продовжуйте з Google',
    },
    'fkx2d4nk': {
      'en': 'Continue with Apple',
      'ru': 'Продолжить с Apple',
      'uk': 'Продовжуйте з Apple',
    },
    'ces97de0': {
      'en': 'Home',
      'ru': 'Дом',
      'uk': 'додому',
    },
  },
  // FlightsScreen
  {
    '33avkdr7': {
      'en': 'Flights',
      'ru': 'Рейсы',
      'uk': 'Авіарейси',
    },
    '930xfzto': {
      'en': 'Flight Number: AA123',
      'ru': 'Номер рейса: AA123',
      'uk': 'Номер рейсу: AA123',
    },
    '3k6ixj1v': {
      'en': 'Departure: JFK',
      'ru': 'Вылет: JFK',
      'uk': 'Відправлення: JFK',
    },
    'ngef5qq4': {
      'en': 'Arrival: LAX',
      'ru': 'Прибытие: Лос-Анджелес',
      'uk': 'Прибуття: LAX',
    },
    '4oz8nq8k': {
      'en': 'Time: 10:00 AM - 1:00 PM',
      'ru': 'Время: 10:00 - 13:00',
      'uk': 'Час: 10:00 - 13:00',
    },
    '2mezuz7t': {
      'en': 'Flight Number: UA456',
      'ru': 'Номер рейса: UA456',
      'uk': 'Номер рейсу: UA456',
    },
    'phidchgx': {
      'en': 'Departure: SFO',
      'ru': 'Отправление: Сан-Франциско',
      'uk': 'Відправлення: SFO',
    },
    'ul2qb3y5': {
      'en': 'Arrival: ORD',
      'ru': 'Прибытие: ЗАКАЗАТЬ',
      'uk': 'Прибуття: ОРД',
    },
    'ggm0rq9a': {
      'en': 'Time: 11:00 AM - 4:00 PM',
      'ru': 'Время: 11:00 - 16:00',
      'uk': 'Час: 11:00 - 16:00',
    },
    'e5ur803i': {
      'en': 'Flight Number: DL789',
      'ru': 'Номер рейса: DL789',
      'uk': 'Номер рейсу: DL789',
    },
    'nhd5zbj4': {
      'en': 'Departure: ATL',
      'ru': 'Отправление: АТЛ',
      'uk': 'Відправлення: ATL',
    },
    'hguinjts': {
      'en': 'Arrival: MIA',
      'ru': 'Прибытие: Пропал без вести',
      'uk': 'Прибуття: МВС',
    },
    '8ntbed8j': {
      'en': 'Time: 2:00 PM - 5:00 PM',
      'ru': 'Время: 14:00 - 17:00',
      'uk': 'Час: 14:00 - 17:00',
    },
    'l0i9mseu': {
      'en': 'Choose Category',
      'ru': 'Выберите категорию',
      'uk': 'Виберіть категорію',
    },
    '9oevnwu4': {
      'en': 'Category Name',
      'ru': 'Название категории',
      'uk': 'Назва категорії',
    },
    'c0xht0un': {
      'en': 'Category Name',
      'ru': 'Название категории',
      'uk': 'Назва категорії',
    },
    '8agefktt': {
      'en': 'Category Name',
      'ru': 'Название категории',
      'uk': 'Назва категорії',
    },
    'u5s70d22': {
      'en': 'Category Name',
      'ru': 'Название категории',
      'uk': 'Назва категорії',
    },
    'yr6iutzu': {
      'en': 'Category Name',
      'ru': 'Название категории',
      'uk': 'Назва категорії',
    },
    '88rb55zh': {
      'en': 'New Flight',
      'ru': 'Новый рейс',
      'uk': 'Новий рейс',
    },
    'scvloreb': {
      'en': 'Page Title',
      'ru': 'Заголовок страницы',
      'uk': 'Назва сторінки',
    },
  },
  // AirportsScreen
  {
    'ycverw1h': {
      'en': 'Airports',
      'ru': 'Аэропорты',
      'uk': 'Аеропорти',
    },
    'o3ss27by': {
      'en': 'Search airports...',
      'ru': 'Поиск аэропортов...',
      'uk': 'Пошук аеропортів...',
    },
    'cwl3vecu': {
      'en': 'Airport 1',
      'ru': 'Аэропорт 1',
      'uk': 'Аеропорт 1',
    },
    'lwur39yd': {
      'en': 'Location 1',
      'ru': 'Местоположение 1',
      'uk': 'Розташування 1',
    },
    'ism5x7ya': {
      'en': 'Airport 2',
      'ru': 'Аэропорт 2',
      'uk': 'Аеропорт 2',
    },
    'd0x1lxzd': {
      'en': 'Location 2',
      'ru': 'Местоположение 2',
      'uk': 'Розташування 2',
    },
    'f0o15icz': {
      'en': 'Airport 3',
      'ru': 'Аэропорт 3',
      'uk': 'Аеропорт 3',
    },
    '1tyjm0tw': {
      'en': 'Location 3',
      'ru': 'Местоположение 3',
      'uk': 'Розташування 3',
    },
    '77bvawme': {
      'en': 'Airport 4',
      'ru': 'Аэропорт 4',
      'uk': 'Аеропорт 4',
    },
    'cmlg58nq': {
      'en': 'Location 4',
      'ru': 'Местоположение 4',
      'uk': 'Розташування 4',
    },
    '0jlqv0z7': {
      'en': 'Airport 5',
      'ru': 'Аэропорт 5',
      'uk': 'Аеропорт 5',
    },
    '4c5393lm': {
      'en': 'Location 5',
      'ru': 'Местоположение 5',
      'uk': 'Розташування 5',
    },
  },
  // UsersScreen
  {
    'hlqsyihq': {
      'en': 'Card Header',
      'ru': 'Заголовок карты',
      'uk': 'Заголовок картки',
    },
    'b3k0dq0t': {
      'en': 'Create tables and ui elements that work below.',
      'ru':
          'Создайте таблицы и элементы пользовательского интерфейса, которые будут работать ниже.',
      'uk': 'Створюйте таблиці та елементи інтерфейсу, які працюють нижче.',
    },
    'x92phkug': {
      'en': 'ID',
      'ru': 'ИДЕНТИФИКАТОР',
      'uk': 'ID',
    },
    'qrcxvkjc': {
      'en': 'User Information',
      'ru': 'информация о пользователе',
      'uk': 'Інформація про користувача',
    },
    '5zl6211c': {
      'en': 'Date Created',
      'ru': 'Дата создания',
      'uk': 'Дата створення',
    },
    'u3v5n15h': {
      'en': 'Last Active',
      'ru': 'Последнее посещение',
      'uk': 'Останній активний',
    },
    'ms7u1xn2': {
      'en': 'Status',
      'ru': 'Положение дел',
      'uk': 'Статус',
    },
    'kvzosebw': {
      'en': 'Actions',
      'ru': 'Действия',
      'uk': 'Дії',
    },
    '6bc7qby9': {
      'en': '#2424',
      'ru': '#2424',
      'uk': '#2424',
    },
    'yr19y1hp': {
      'en': 'Randy Peterson',
      'ru': 'Рэнди Петерсон',
      'uk': 'Ренді Петерсон',
    },
    'ldzwj01f': {
      'en': 'randy.p@domainname.com',
      'ru': 'randy.p@domainname.com',
      'uk': 'randy.p@domainname.com',
    },
    'x9fs6nnv': {
      'en': 'Jan. 20th, 2023',
      'ru': '20 января 2023 г.',
      'uk': '20 січня 2023 р',
    },
    'jj7cw8wf': {
      'en': 'A few moments ago',
      'ru': 'Несколько минут назад',
      'uk': 'Кілька хвилин тому',
    },
    'qwvz0zjd': {
      'en': 'Active',
      'ru': 'Активный',
      'uk': 'Активний',
    },
    'pn6mi6z1': {
      'en': '#2424',
      'ru': '#2424',
      'uk': '#2424',
    },
    'wpa9irbr': {
      'en': 'Randy Peterson',
      'ru': 'Рэнди Петерсон',
      'uk': 'Ренді Петерсон',
    },
    'tmdawc3v': {
      'en': 'randy.p@domainname.com',
      'ru': 'randy.p@domainname.com',
      'uk': 'randy.p@domainname.com',
    },
    'hl5vs5tq': {
      'en': 'Jan. 20th, 2023',
      'ru': '20 января 2023 г.',
      'uk': '20 січня 2023 р',
    },
    'tpup3oj1': {
      'en': 'A few moments ago',
      'ru': 'Несколько минут назад',
      'uk': 'Кілька хвилин тому',
    },
    '8bb6uvx7': {
      'en': 'Active',
      'ru': 'Активный',
      'uk': 'Активний',
    },
    '6fni21ft': {
      'en': '#2427',
      'ru': '#2427',
      'uk': '#2427',
    },
    '7u8rliqt': {
      'en': 'Randy Peterson',
      'ru': 'Рэнди Петерсон',
      'uk': 'Ренді Петерсон',
    },
    '22rnni0p': {
      'en': 'randy.p@domainname.com',
      'ru': 'randy.p@domainname.com',
      'uk': 'randy.p@domainname.com',
    },
    '4otcof90': {
      'en': 'Jan. 20th, 2023',
      'ru': '20 января 2023 г.',
      'uk': '20 січня 2023 р',
    },
    '6efpy8q7': {
      'en': 'A few moments ago',
      'ru': 'Несколько минут назад',
      'uk': 'Кілька хвилин тому',
    },
    'ou7nu5fj': {
      'en': 'Active',
      'ru': 'Активный',
      'uk': 'Активний',
    },
    'ymtvw6k3': {
      'en': 'Users',
      'ru': 'Пользователи',
      'uk': 'Користувачі',
    },
  },
  // AircraftScreen
  {
    'm8lkp3nw': {
      'en': 'Aircraft Screen',
      'ru': 'Экран самолета',
      'uk': 'Екран літака',
    },
    'tbqawwwo': {
      'en': 'New Aircraft',
      'ru': 'Новый самолет',
      'uk': 'Новий літак',
    },
    '2te2vghj': {
      'en': 'Aircraft Model',
      'ru': 'Модель самолета',
      'uk': 'Модель літака',
    },
    'vyxvaq86': {
      'en': 'Boeing 737',
      'ru': 'Боинг 737',
      'uk': 'Боїнг 737',
    },
    'm999vxzv': {
      'en': 'Registration No.',
      'ru': 'Номер регистрации.',
      'uk': 'реєстраційний номер',
    },
    'i9upebwv': {
      'en': 'N12345',
      'ru': 'N12345',
      'uk': 'N12345',
    },
    'nb3iaas1': {
      'en': 'Capacity',
      'ru': 'Емкость',
      'uk': 'Ємність',
    },
    'a0m9xkb3': {
      'en': '180',
      'ru': '180',
      'uk': '180',
    },
    'qcjxljp3': {
      'en': 'Aircraft Model',
      'ru': 'Модель самолета',
      'uk': 'Модель літака',
    },
    'zf984rie': {
      'en': 'Airbus A320',
      'ru': 'Аэробус А320',
      'uk': 'Airbus A320',
    },
    '168ee45f': {
      'en': 'Registration No.',
      'ru': 'Номер регистрации.',
      'uk': 'реєстраційний номер',
    },
    'epxfksko': {
      'en': 'N54321',
      'ru': 'N54321',
      'uk': 'N54321',
    },
    '09p51le6': {
      'en': 'Capacity',
      'ru': 'Емкость',
      'uk': 'Ємність',
    },
    'apvlsmw4': {
      'en': '150',
      'ru': '150',
      'uk': '150',
    },
    'ja91c268': {
      'en': 'Aircraft Model',
      'ru': 'Модель самолета',
      'uk': 'Модель літака',
    },
    's13p09ly': {
      'en': 'Boeing 747',
      'ru': 'Боинг 747',
      'uk': 'Боїнг 747',
    },
    '18hccsxo': {
      'en': 'Registration No.',
      'ru': 'Номер регистрации.',
      'uk': 'реєстраційний номер',
    },
    '2u1wwiga': {
      'en': 'N67890',
      'ru': 'N67890',
      'uk': 'N67890',
    },
    'raioofgy': {
      'en': 'Capacity',
      'ru': 'Емкость',
      'uk': 'Ємність',
    },
    '1npy4wlu': {
      'en': '400',
      'ru': '400',
      'uk': '400',
    },
  },
  // FinancesScreen
  {
    'g4pyx0du': {
      'en': 'Financial Overview',
      'ru': 'Финансовый обзор',
      'uk': 'Фінансовий огляд',
    },
    'v106rtet': {
      'en': 'Income',
      'ru': 'Доход',
      'uk': 'Дохід',
    },
    '9h7b96wf': {
      'en': 'Salary',
      'ru': 'Зарплата',
      'uk': 'Зарплата',
    },
    'too5k6ga': {
      'en': '\$5000',
      'ru': '5000\$',
      'uk': '5000 доларів США',
    },
    'z66crjg0': {
      'en': 'Investments',
      'ru': 'Вложения',
      'uk': 'Інвестиції',
    },
    '2gaihu3s': {
      'en': '\$2000',
      'ru': '2000 долларов',
      'uk': '2000 доларів США',
    },
    'b52mk73f': {
      'en': 'Other',
      'ru': 'Другой',
      'uk': 'Інший',
    },
    'e6k49otq': {
      'en': '\$500',
      'ru': '500 долларов',
      'uk': '500 доларів США',
    },
    '5g5cakc7': {
      'en': 'Expenses',
      'ru': 'Затраты',
      'uk': 'Витрати',
    },
    'hdeis2dm': {
      'en': 'Rent',
      'ru': 'Арендовать',
      'uk': 'Оренда',
    },
    'ho5xhdmc': {
      'en': '\$1500',
      'ru': '1500\$',
      'uk': '1500 доларів США',
    },
    'b90in1b9': {
      'en': 'Groceries',
      'ru': 'Бакалея',
      'uk': 'Бакалія',
    },
    '8194ults': {
      'en': '\$600',
      'ru': '600 долларов',
      'uk': '600 доларів США',
    },
    '2antsp3v': {
      'en': 'Utilities',
      'ru': 'Коммунальные услуги',
      'uk': 'Комунальні послуги',
    },
    '8ohk912w': {
      'en': '\$300',
      'ru': '300 долларов',
      'uk': '300 доларів США',
    },
    'qoztrz1e': {
      'en': 'Transport',
      'ru': 'Транспорт',
      'uk': 'Транспорт',
    },
    'txtgkenj': {
      'en': '\$200',
      'ru': '200 долларов',
      'uk': '200 доларів США',
    },
    'ttzdootb': {
      'en': 'Entertainment',
      'ru': 'Развлечение',
      'uk': 'Розваги',
    },
    'ipj9zmy0': {
      'en': '\$400',
      'ru': '400 долларов',
      'uk': '400 доларів США',
    },
    'adxgeb9p': {
      'en': 'Generate Report',
      'ru': 'Создать отчет',
      'uk': 'Створити звіт',
    },
  },
  // FlightDetailsScreen
  {
    '84954yz3': {
      'en': 'Flight Details',
      'ru': 'Детали полета',
      'uk': 'Деталі польоту',
    },
    'tui6ldek': {
      'en': 'Flight Number',
      'ru': 'Номер рейса',
      'uk': 'Номер рейсу',
    },
    '5daw7eig': {
      'en': 'FL1234',
      'ru': 'FL1234',
      'uk': 'FL1234',
    },
    'zgm9kod2': {
      'en': 'Departure: JFK Airport',
      'ru': 'Вылет: Аэропорт имени Джона Кеннеди',
      'uk': 'Відправлення: аеропорт JFK',
    },
    'iziqg7wx': {
      'en': 'Arrival: LAX Airport',
      'ru': 'Прибытие: Аэропорт Лос-Анджелеса',
      'uk': 'Прибуття: аеропорт LAX',
    },
    '48ho5cq8': {
      'en': 'Departure Date: 08 Dec 2023, 9:40am',
      'ru': 'Дата отправления: 08 декабря 2023 г., 9:40 утра',
      'uk': 'Дата відправлення: 08 грудня 2023 р. 9:40',
    },
    '73t0ufw9': {
      'en': 'Arrival Date: 08 Dec 2023, 12:30pm',
      'ru': 'Дата прибытия: 08 декабря 2023 г., 12:30',
      'uk': 'Дата прибуття: 08.12.2023, 12:30',
    },
    'sulffwch': {
      'en': 'Aircraft Model: Boeing 737',
      'ru': 'Модель самолета: Boeing 737',
      'uk': 'Модель літака: Boeing 737',
    },
    'h6vkr6xu': {
      'en': 'Registration Number: N12345',
      'ru': 'Регистрационный номер: N12345',
      'uk': 'Реєстраційний номер: N12345',
    },
    '2ebjpjyd': {
      'en': 'Pilot: John Doe',
      'ru': 'Пилот: Джон Доу',
      'uk': 'Пілот: Джон Доу',
    },
    'bsvnyjjx': {
      'en': 'License: ABC123456',
      'ru': 'Лицензия: ABC123456',
      'uk': 'Ліцензія: ABC123456',
    },
    'mt42u8uo': {
      'en': 'Flight Status: Scheduled',
      'ru': 'Статус рейса: запланирован',
      'uk': 'Статус рейсу: за розкладом',
    },
    'bittgona': {
      'en': 'Passengers:',
      'ru': 'Пассажиры:',
      'uk': 'Пасажири:',
    },
    'oik01izs': {
      'en': '1. Alice Smith',
      'ru': '1. Элис Смит',
      'uk': '1. Еліс Сміт',
    },
    '2qohjngi': {
      'en': '2. Bob Johnson',
      'ru': '2. Боб Джонсон',
      'uk': '2. Боб Джонсон',
    },
    'edsm78qw': {
      'en': 'Edit',
      'ru': 'Редактировать',
      'uk': 'Редагувати',
    },
  },
  // AircraftDetailsScreen
  {
    'qwmcgxdh': {
      'en': 'Aircraft Details',
      'ru': 'Подробности о самолете',
      'uk': 'Деталі літака',
    },
    'j20s2lqu': {
      'en': 'Model: Boeing 737',
      'ru': 'Модель: Боинг 737',
      'uk': 'Модель: Boeing 737',
    },
    'pvzkgney': {
      'en': 'Registration Number: N12345',
      'ru': 'Регистрационный номер: N12345',
      'uk': 'Реєстраційний номер: N12345',
    },
    'yn3azb0w': {
      'en': 'Capacity: 180',
      'ru': 'Вместимость: 180',
      'uk': 'Місткість: 180',
    },
    'l3um3x4x': {
      'en': 'Maintenance History:',
      'ru': 'История обслуживания:',
      'uk': 'Історія технічного обслуговування:',
    },
    'zzyk8bqj': {
      'en':
          '1. 01/01/2023 - Engine Check\\n2. 01/06/2023 - Tire Replacement\\n3. 01/12/2023 - Oil Change',
      'ru':
          '1. 01/01/2023 - Проверка двигателя\\n2. 01/06/2023 - Замена шин\\n3. 01/12/2023 - Замена масла',
      'uk':
          '1. 01.01.2023 - Перевірка двигуна\\n2. 06.01.2023 - Заміна шин\\n3. 12.01.2023 - Заміна масла',
    },
    'jn2517ak': {
      'en': 'Other Details:',
      'ru': 'Другие детали:',
      'uk': 'Інші деталі:',
    },
    'bwwouhic': {
      'en': 'This aircraft is primarily used for domestic flights.',
      'ru': 'Этот самолет в основном используется для внутренних рейсов.',
      'uk': 'Цей літак в основному використовується для внутрішніх рейсів.',
    },
    'mgnnh5h7': {
      'en': 'Edit',
      'ru': 'Редактировать',
      'uk': 'Редагувати',
    },
    'veeh70z6': {
      'en': 'Delete',
      'ru': 'Удалить',
      'uk': 'Видалити',
    },
  },
  // AirportDetailsScreen
  {
    'rg044orq': {
      'en': 'Airport Details',
      'ru': 'Подробности аэропорта',
      'uk': 'Деталі аеропорту',
    },
    'wc8q7qde': {
      'en': 'Airport Name',
      'ru': 'Название аэропорта',
      'uk': 'Назва аеропорту',
    },
    'iqe1h0o0': {
      'en': 'IATA Code: XYZ',
      'ru': 'Код ИАТА: XYZ',
      'uk': 'Код IATA: XYZ',
    },
    'wgutefhn': {
      'en': 'Location: City, Country',
      'ru': 'Местоположение: Город, Страна',
      'uk': 'Розташування: місто, країна',
    },
    'sacfo3ya': {
      'en': 'Contact Information',
      'ru': 'Контактная информация',
      'uk': 'Контактна інформація',
    },
    '0gftxd4r': {
      'en': 'Phone: +123456789',
      'ru': 'Телефон: +123456789',
      'uk': 'Телефон: +123456789',
    },
    '5or3gt79': {
      'en': 'Email: contact@airport.com',
      'ru': 'Электронная почта: contact@airport.com',
      'uk': 'Електронна адреса: contact@airport.com',
    },
    '5asefsf2': {
      'en': 'Runway Information',
      'ru': 'Информация о взлетно-посадочной полосе',
      'uk': 'Інформація про злітно-посадкову смугу',
    },
    'gd7ekydl': {
      'en': 'Runway 1: 3000m',
      'ru': 'Взлетно-посадочная полоса 1: 3000 м',
      'uk': 'ЗПС 1: 3000 м',
    },
    'ltokdb26': {
      'en': 'Runway 2: 2500m',
      'ru': 'Взлетно-посадочная полоса 2: 2500 м',
      'uk': 'ЗПС 2: 2500 м',
    },
    'j00tf342': {
      'en': 'Other Details',
      'ru': 'Другие детали',
      'uk': 'Інші деталі',
    },
    '06a4ubdx': {
      'en': 'Additional information about the airport.',
      'ru': 'Дополнительная информация об аэропорте.',
      'uk': 'Додаткова інформація про аеропорт.',
    },
    'pwyro2jg': {
      'en': 'Edit',
      'ru': 'Редактировать',
      'uk': 'Редагувати',
    },
    'bs2gvlre': {
      'en': 'Delete',
      'ru': 'Удалить',
      'uk': 'Видалити',
    },
  },
  // UserDetailsScreen
  {
    'cecwvoxf': {
      'en': 'User Details',
      'ru': 'Данные пользователя',
      'uk': 'Відомості про користувача',
    },
    'gomy8p0w': {
      'en': 'Name:',
      'ru': 'Имя:',
      'uk': 'Ім\'я:',
    },
    'sxc4079c': {
      'en': 'John Doe',
      'ru': 'Джон Доу',
      'uk': 'Джон Доу',
    },
    'ul9oj2hz': {
      'en': 'Email:',
      'ru': 'Электронная почта:',
      'uk': 'Електронна пошта:',
    },
    'qke0k8e5': {
      'en': 'john.doe@example.com',
      'ru': 'john.doe@example.com',
      'uk': 'john.doe@example.com',
    },
    'tomkonml': {
      'en': 'Role:',
      'ru': 'Роль:',
      'uk': 'роль:',
    },
    'n1em3d2v': {
      'en': 'Pilot',
      'ru': 'Пилот',
      'uk': 'Пілот',
    },
    'iymzpsxy': {
      'en': 'Contact Information',
      'ru': 'Контактная информация',
      'uk': 'Контактна інформація',
    },
    'r941zxg9': {
      'en': 'Phone:',
      'ru': 'Телефон:',
      'uk': 'телефон:',
    },
    '25bqazdp': {
      'en': '+1234567890',
      'ru': '+1234567890',
      'uk': '+1234567890',
    },
    'uoj5yejl': {
      'en': 'Address:',
      'ru': 'Адрес:',
      'uk': 'Адреса:',
    },
    'wla4ea65': {
      'en': '123 Main St, City, Country',
      'ru': '123 Мейн Стрит, Город, Страна',
      'uk': 'Головна 123, місто, країна',
    },
    'jqksr8qj': {
      'en': 'Flight History',
      'ru': 'История полетов',
      'uk': 'Історія польотів',
    },
    '22vrll8t': {
      'en': 'As Pilot:',
      'ru': 'В качестве пилота:',
      'uk': 'Як пілот:',
    },
    'ysrdnzhq': {
      'en': 'Flight 1, Flight 2, Flight 3',
      'ru': 'Рейс 1, Рейс 2, Рейс 3',
      'uk': 'Рейс 1, Рейс 2, Рейс 3',
    },
    '1ypwpfy0': {
      'en': 'As Passenger:',
      'ru': 'В качестве пассажира:',
      'uk': 'Як пасажир:',
    },
    'siaokdlx': {
      'en': 'Flight A, Flight B, Flight C',
      'ru': 'Рейс A, Рейс B, Рейс C',
      'uk': 'Рейс A, рейс B, рейс C',
    },
    'hih4l5tz': {
      'en': 'Other Details',
      'ru': 'Другие детали',
      'uk': 'Інші деталі',
    },
    'cw5hpjgn': {
      'en': 'Additional relevant information about the user goes here.',
      'ru': 'Дополнительная важная информация о пользователе находится здесь.',
      'uk': 'Додаткова актуальна інформація про користувача міститься тут.',
    },
    '7t1b921i': {
      'en': 'Edit User',
      'ru': 'Редактировать пользователя',
      'uk': 'Редагувати користувача',
    },
    'ja65y8g1': {
      'en': 'Delete User',
      'ru': 'Удалить пользователя',
      'uk': 'Видалити користувача',
    },
    '1p09tbbm': {
      'en': 'Page Title',
      'ru': 'Заголовок страницы',
      'uk': 'Назва сторінки',
    },
  },
  // CreateEditFlightScreen
  {
    '4t2opw4t': {
      'en': 'Create/Edit Flight',
      'ru': '',
      'uk': '',
    },
    'jav6tp1n': {
      'en': 'Flight Number',
      'ru': '',
      'uk': '',
    },
    '850eqp90': {
      'en': 'Enter flight number',
      'ru': '',
      'uk': '',
    },
    'n8v9qxxy': {
      'en': 'Departure Airport',
      'ru': '',
      'uk': '',
    },
    'ev2x1fzj': {
      'en': 'Enter departure airport',
      'ru': '',
      'uk': '',
    },
    'jzaj84tf': {
      'en': 'Arrival Airport',
      'ru': '',
      'uk': '',
    },
    'te4uhcr3': {
      'en': 'Enter arrival airport',
      'ru': '',
      'uk': '',
    },
    'gidjotru': {
      'en': 'Departure Date',
      'ru': '',
      'uk': '',
    },
    'pvbiae4z': {
      'en': 'Arrival Date',
      'ru': '',
      'uk': '',
    },
    'x9lay9sq': {
      'en': 'Departure Time',
      'ru': '',
      'uk': '',
    },
    '92yd6w68': {
      'en': 'Arrival Time',
      'ru': '',
      'uk': '',
    },
    '6eogxmzm': {
      'en': 'Aircraft',
      'ru': '',
      'uk': '',
    },
    'xp5a9z3s': {
      'en': 'Select Aircraft',
      'ru': '',
      'uk': '',
    },
    'altugulg': {
      'en': 'Pilot',
      'ru': '',
      'uk': '',
    },
    '33wl8ziu': {
      'en': 'Select Pilot',
      'ru': '',
      'uk': '',
    },
    'umcfyqvj': {
      'en': 'Save',
      'ru': '',
      'uk': '',
    },
  },
  // GenerateReportsScreen
  {
    'tb3qyxox': {
      'en': 'Generate Reports',
      'ru': '',
      'uk': '',
    },
    'q26myq67': {
      'en': 'Select Report Type',
      'ru': '',
      'uk': '',
    },
    'rs382sd9': {
      'en': 'Flights',
      'ru': '',
      'uk': '',
    },
    'jj8mz3dt': {
      'en': 'Finances',
      'ru': '',
      'uk': '',
    },
    '3ss5iu6g': {
      'en': 'Users',
      'ru': '',
      'uk': '',
    },
    'cpj0wkwv': {
      'en': 'Generate Report',
      'ru': '',
      'uk': '',
    },
    '0drgkcq1': {
      'en': 'Generated Reports',
      'ru': '',
      'uk': '',
    },
    'zgnb98ni': {
      'en': 'Report 1',
      'ru': '',
      'uk': '',
    },
    'l3k6qtwe': {
      'en': 'Report Description',
      'ru': '',
      'uk': '',
    },
    'agr5mmby': {
      'en': 'Export PDF',
      'ru': '',
      'uk': '',
    },
    '32gm2lr6': {
      'en': 'Export CSV',
      'ru': '',
      'uk': '',
    },
    '445h486i': {
      'en': 'Report 2',
      'ru': '',
      'uk': '',
    },
    'x3vxt2xm': {
      'en': 'Report Description',
      'ru': '',
      'uk': '',
    },
    'w1gcq9hv': {
      'en': 'Export PDF',
      'ru': '',
      'uk': '',
    },
    '3j5wihiw': {
      'en': 'Export CSV',
      'ru': '',
      'uk': '',
    },
  },
  // ForgotPassword02
  {
    'x0kp13s4': {
      'en': 'Back',
      'ru': '',
      'uk': '',
    },
    'v5vvuiwh': {
      'en': 'Forgot Password',
      'ru': '',
      'uk': '',
    },
    '7i5h6k9l': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'ru': '',
      'uk': '',
    },
    'nttfd6zo': {
      'en': 'Your email address...',
      'ru': '',
      'uk': '',
    },
    'jj1k74vd': {
      'en': 'Enter your email...',
      'ru': '',
      'uk': '',
    },
    'yoz07jj2': {
      'en': 'Send Link',
      'ru': '',
      'uk': '',
    },
    'p7rdz3k0': {
      'en': 'Home',
      'ru': '',
      'uk': '',
    },
  },
  // maptracking
  {
    'o2icnip5': {
      'en': 'Google Maps is not supported in FlutterFlow.',
      'ru': '',
      'uk': '',
    },
  },
  // Miscellaneous
  {
    'x0ox6guy': {
      'en': 'Label here...',
      'ru': 'Метка здесь...',
      'uk': 'Позначте тут...',
    },
    '9cnqmp7u': {
      'en': 'Button',
      'ru': 'Кнопка',
      'uk': 'Кнопка',
    },
    'qrxew4zx': {
      'en': 'Button',
      'ru': 'Кнопка',
      'uk': 'Кнопка',
    },
    '2n99rxjp': {
      'en':
          'Stay updated with the latest from FMA Management by allowing notifications.',
      'ru': '',
      'uk': '',
    },
    'bjbm4tke': {
      'en':
          'FMA Management needs access to your photos/media library to let you upload images, videos, or other files.',
      'ru': '',
      'uk': '',
    },
    'occhge27': {
      'en':
          'Allow FMA Management to access your location to provide personalized features and recommendations.',
      'ru': '',
      'uk': '',
    },
    'q9fonmn5': {
      'en':
          'Enable camera access to share moments, create content, or participate in calls within FMA Management.',
      'ru': '',
      'uk': '',
    },
    'jje08xar': {
      'en':
          'o create events, reminders, or integrate with your schedule, FMA Management needs access to your calendar.',
      'ru': '',
      'uk': '',
    },
    'vygf8zw6': {
      'en':
          'For enhanced security and convenience, FMA Management would like to use your biometrics (fingerprint/face ID) to verify your identity.',
      'ru': '',
      'uk': '',
    },
    'sw99grb2': {
      'en':
          'Enable microphone access to share moments, create content, or participate in calls within FMA Management.',
      'ru': '',
      'uk': '',
    },
    'g7m14swx': {
      'en':
          'Grant FMA Management access to your contacts to easily connect with colleagues who are also using the app.',
      'ru': '',
      'uk': '',
    },
    'pslo1uvx': {
      'en':
          '\"FMA Management would like to access Bluetooth to connect with devices, share files, or enable wireless features.',
      'ru': '',
      'uk': '',
    },
    'oa76fd3w': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    'o46qxar6': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    'egn29dsm': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    '0y1aqkm4': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    'hy1328of': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    '4hp1l9ej': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    'lhtw8h7h': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    'c78k05w4': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    '2z2duaoq': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    'kyrbumaa': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    'mhbilxhi': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    '7qlx29t5': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    'r871lt70': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    '90nncnom': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    'ellrevvt': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    'gdotnkgg': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    's8y2l6tt': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    'jl33f83y': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    '554ebzro': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    'hg6mbncg': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    '2g1fbgj1': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    'kuyrlkn8': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    'nuqpqlv9': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    'zno06i2h': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    'mpgca08v': {
      'en': '',
      'ru': '',
      'uk': '',
    },
  },
].reduce((a, b) => a..addAll(b));
