// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;
import 'app.i18n.dart';

String get _languageCode => 'ru';
String _plural(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i18n.plural(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _ordinal(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i18n.ordinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _cardinal(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i18n.cardinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);

class AppRu extends App {
  const AppRu();
  String get locale => "ru";
  String get languageCode => "ru";
  String get myTasks => """Мои дела""";
  String tasksCompleted(int count) => """Выполнено — $count""";
  String get newTask => """Новое""";
  String get saveTask => """Сохранить""";
  String get taskEditHint => """Что надо сделать...""";
  String get taskImportance => """Важность""";
  String get taskDeadline => """Сделать до""";
  String get taskDelete => """Удалить""";
  String get taskImportanceBasic => """Нет""";
  String get taskImportanceLow => """Низкий""";
  String get taskImportanceHigh => """Высокий""";
}

Map<String, String> get appRuMap => {
      """myTasks""": """Мои дела""",
      """newTask""": """Новое""",
      """saveTask""": """Сохранить""",
      """taskEditHint""": """Что надо сделать...""",
      """taskImportance""": """Важность""",
      """taskDeadline""": """Сделать до""",
      """taskDelete""": """Удалить""",
      """taskImportanceBasic""": """Нет""",
      """taskImportanceLow""": """Низкий""",
      """taskImportanceHigh""": """Высокий""",
    };
