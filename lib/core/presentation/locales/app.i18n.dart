// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;

String get _languageCode => 'en';
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

class App {
  const App();
  String get locale => "en";
  String get languageCode => "en";
  String get myTasks => """My Tasks""";
  String tasksCompleted(int count) => """Сompleted — $count""";
  String get newTask => """New""";
  String get saveTask => """Save""";
  String get taskEditHint => """What need to do...""";
  String get taskImportance => """Importance""";
  String get taskDeadline => """Deadline""";
  String get taskDelete => """Delete""";
  String get taskImportanceBasic => """None""";
  String get taskImportanceLow => """Low""";
  String get taskImportanceHigh => """High""";
}

Map<String, String> get appMap => {
      """myTasks""": """My Tasks""",
      """newTask""": """New""",
      """saveTask""": """Save""",
      """taskEditHint""": """What need to do...""",
      """taskImportance""": """Importance""",
      """taskDeadline""": """Deadline""",
      """taskDelete""": """Delete""",
      """taskImportanceBasic""": """None""",
      """taskImportanceLow""": """Low""",
      """taskImportanceHigh""": """High""",
    };
