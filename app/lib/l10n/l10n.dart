// The one import for UI text: `import '../../l10n/l10n.dart';`
//
//  - In widgets: `context.l10n.chatComposerHint`.
//  - Without a BuildContext (state, services, error mapping): `appL10n.xxx`,
//    which always follows the language the app is showing.
//
// Strings live in lib/l10n/parts/<area>_{zh,en}.arb; tool/l10n_merge.py
// merges them and regenerates lib/l10n/gen/.

import 'package:flutter/widgets.dart';

import 'gen/app_localizations.dart';

export 'gen/app_localizations.dart';

/// The language the app shows: what [AppLocale.resolve] picked from the
/// user's choice and the system languages.
abstract final class AppLocale {
  static const zhCN = Locale('zh', 'CN');
  static const en = Locale('en');

  /// Locales MaterialApp offers. zh_CN (not bare zh) keeps CJK glyphs
  /// Chinese on non-Chinese systems (typography.dart「汉字字形」).
  static const fil = Locale('fil');

  /// Locales MaterialApp offers: English and Filipino (Tagalog). zh_CN stays in
  /// the list only so the test suite, which still runs in Chinese, can pin it.
  static const supported = [en, fil, zhCN];

  static Locale _locale = en;
  static L10n _l10n = lookupL10n(en);

  /// The locale in use (English or Filipino; tests may pin zh_CN).
  static Locale get current => _locale;

  /// True for every non-Chinese UI language: English and Filipino both use the
  /// English-language data (pet names, plugin copy and so on).
  static bool get isEnglish => _locale.languageCode != 'zh';

  static L10n get l10n => _l10n;

  /// Switches [appL10n] to [locale] (en, fil, or zh_CN in tests).
  static void use(Locale locale) {
    final next = switch (locale.languageCode) {
      'fil' || 'tl' => fil,
      'zh' => zhCN,
      _ => en,
    };
    if (next == _locale) return;
    _locale = next;
    _l10n = lookupL10n(next);
  }

  /// Filipino when chosen, or when the system's first matching language is
  /// Filipino or Tagalog; English for everything else (Chinese is not offered).
  static Locale resolve(Locale? chosen, List<Locale>? system) {
    if (chosen != null) return chosen.languageCode == 'fil' ? fil : en;
    for (final l in system ?? const <Locale>[]) {
      if (l.languageCode == 'fil' || l.languageCode == 'tl') return fil;
      if (l.languageCode == 'en') return en;
    }
    return en;
  }
}

/// UI text for code without a BuildContext. Follows the app language.
L10n get appL10n => AppLocale.l10n;

extension L10nContext on BuildContext {
  /// UI text in the app language. Falls back to [appL10n] where the tree has
  /// no L10n delegate (bare MaterialApps in tests).
  L10n get l10n => Localizations.of<L10n>(this, L10n) ?? AppLocale.l10n;
}

extension L10nFormat on L10n {
  /// 「3月5日」/「Mar 5」.
  String monthDay(DateTime d) => commonMonthDay('${d.month}', d.day);
}
