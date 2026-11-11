# Drawer grouping by local calendar

Refs: source regression investigation, no new public issue. Does not change runtimeVersion.

The contract of `sessionDayOf` is local calendar grouping: weeks start on Monday, yesterday takes precedence over this week, and future dates go to today per existing behavior. The production `now` comes from the local `DateTime.now` of `drawerClockProvider`; this item keeps the original semantics of the year/month/day fields of the passed-in `now`, without an extra UTC-now conversion.

In New York, the local midnights of 2026-03-08 and 03-09 are only 23 hours apart. Truncating the duration between two local midnights to whole days puts yesterday into today, and also puts the day before yesterday (47 hours) into yesterday. The fix puts the already-obtained local year/month/day onto a UTC date axis before comparing, so a civil-date day is always 24 hours. Actual session times still go through `toLocal` first; this doesn't change session timestamps, sorting, folders or persisted data.

Real call chain: `SessionSummary.fromJson` reads the millisecond times of `session/list` via `asEpochMs`; `drawerBlocks` chooses the grouping key from the activity or creation time and calls `sessionDayOf`. The new cases cover both grouping paths.

Run in the app directory once the original locked dependencies match and the test fonts are ready:

```bash
TZ=America/New_York flutter test --no-pub test/drawer/drawer_calendar_test.dart
TZ=America/New_York flutter test --no-pub test/drawer test/shell/shell_logic_test.dart
flutter analyze --no-pub
```

The explicit New York process must assert 23 hours for spring forward and 25 hours for fall back, and can't skip. The default time zone can run these calendar cases too, but passing in the default time zone is no substitute for real DST coverage. On the original, the 10 new cases had 5 passing, 5 failing, 0 skipped; the failures include wrong yesterday grouping in both the pure function and the deserialize-to-`drawerBlocks` sort orders.

Real-device verification: in a system time zone that uses DST, view sessions on the day after spring forward; yesterday should go to Yesterday, and the day before yesterday must not go to Yesterday; switching between activity/creation-time sorting should be consistent; then check the day after fall back, Monday, pinned items and folder members. Not compiled for Android, not verified on a real device; the full Flutter suite and the app JVM were not run.
