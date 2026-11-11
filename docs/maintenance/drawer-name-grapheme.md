# The 20-character contract for local session folder names

Refs W17-B (ordinary state persistence, no corresponding public issue number). Does not change runtimeVersion. Not compiled for Android.

This is an existing ordinary local name contract problem in v1.0.11; there's no evidence it was introduced by the rc.1 upgrade. The value maxName=20 is unchanged.

The existing TextField for creating/editing folders uses maxLength=DrawerViewController.maxName=20, counting Unicode graphemes; _submit only trims/checks for empty/checks for duplicate names. Folders are stored only in this device's per-Host SharedPreferences JSON; there's no external 20 UTF-16 protocol or storage limit.

The state layer's _clean is changed from substring(0,20) to taking the first 20 complete graphemes after trim, aligning with the existing user input contract. Create and rename share this normalization. A 20th character made of 19 ASCII plus an emoji, a combining accent or a ZWJ sequence is kept whole; beyond 20, the first 20 characters are kept. The 21-character test is a direct length-limit control on the public state API; the page's maxLength=20 itself won't send a 21st character, and not all controls are called legal page input. It still trims first, and doesn't change the empty/duplicate-name policy, key ownership/owner guards, persistence timing or existing data migration.

It uses the StringCharacters extension exported publicly by Flutter's existing widgets, with the originally locked characters 1.4.1; no new dependency or lock change. Unlike terminal 695, which has a Host 120 UTF-16 limit, it can't just back off one unit and drop a legal 20th character.

Formal public ProviderContainer/DrawerViewController/SharedPreferences mock tests collect memory, saved JSON and an independent container reload uniformly before asserting; this is not actual Android storage or UI acceptance. On the original, the final 6 cases were actually 5 red, 1 green; the first 3 cases ran early because task messages interleaved, and that separate history isn't counted on top. Only normal legal strings; no attempt is made to repair already-corrupted historical names.
