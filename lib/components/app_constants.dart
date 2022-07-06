abstract class AppConstants {

  static RegExp idPattern = RegExp(r"^\d{5}$");

  static const List<String> allFields = [
    'Название',
    'Дата регистрации',
    'Тип видеозаписи',
    'Редакция',
    'Статус ОТК',
    'Статус титров',
    'Статус оцифровки',
    'Статус комерции',
    'Статус субтитров'
  ];

  static const Map<String, String> dbFields = {
    'Название': 'name',
    'Дата регистрации': 'registrationDate',
    'Тип видеозаписи': 'type',
    'Редакция': 'editingName',
    'Статус ОТК': 'otkStatus',
    'Статус титров': 'creditsStatus',
    'Статус оцифровки': 'digitizationStatus',
    'Статус комерции': 'commerceStatus',
    'Статус субтитров': 'subtitles'
  };

  //для статуса отк, коммерции, титров,
  static const List<String> statuses = [
    'все',
    'пригоден',
    'не осмотрен',
    'одноразовый показ',
    'не пригоден'
  ];

  static const List<String> editions = [
    'все',
    '08 CK',
    '02 ДОПП',
    '03 СДПВ',
    '01 ДИП'
  ];

  static const String editionStatus = 'пригоден';

  static const List<String> videoTypes = [
    'все',
    'Эфирный мастер',
    'Эфирная копия',
    'Интернет копия',
    'Прокси копия'
  ];

  static const List<String> digitizationStatuses = [
    'все',
    'оцифрован',
    'не оцифрован'
  ];

  static const List<String> subtitlesStatuses = ['все', 'готов', 'не готов'];

  static const List<String> readyStatuses = [
    'все',
    'готов',
    'принят',
    'не готов',
  ];

  static const List<String> productionTypes = [
    'все',
    'заказное',
    'собственное'
  ];

  static const List<String> channels = [
    'Европа',
    'Москва',
    'Урал',
    'Сибирь',
    'ДВ',
    'TVCI',
    'TVCI 2',
    'ТВЦ',
  ];

  static Map<String, String> createFiltersMap(
      String type,
      String editing,
      String otpState,
      String creditsState,
      String commerceState,
      String digitalizationState,
      String subtitlesState)
  {
    Map<String, String> filters = {};
    if (type.isNotEmpty && type != 'все') {
      filters['type'] = type;
    }
    if (editing.isNotEmpty && editing != 'все') {
      filters['editingName'] = editing;
    }
    if (otpState.isNotEmpty && otpState != 'все') {
      filters['otkStatus'] = otpState;
    }
    if (creditsState.isNotEmpty && creditsState != 'все') {
      filters['creditsStatus'] = creditsState;
    }
    if (commerceState.isNotEmpty && commerceState != 'все') {
      filters['commerceStatus'] = commerceState;
    }
    if (digitalizationState.isNotEmpty && digitalizationState != 'все') {
      filters['digitizationStatus'] = digitalizationState;
    }
    if (subtitlesState.isNotEmpty && subtitlesState != 'все') {
      filters['subtitles'] = subtitlesState;
    }
    return filters;
  }
}
