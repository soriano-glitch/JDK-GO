# Tool image tests wait for the real first frame

Refs: the `ImageViewerPage` not-found failure left over from the 629 whole-chat test; no new public issue. Does not change runtimeVersion. Only tests and verification fixtures are changed, not UI production code or assets.

An `Image` widget can exist before its first frame is decoded. The production `ToolImages`'s `frameBuilder` shows a placeholder before the first frame, and only after it creates the gesture that opens the viewer on tap. The test originally waited a real 50 ms and then tapped directly; that time limit can't guarantee decoding has completed. It now follows the existing `message_menu_test.dart` approach: `precacheImage` waits on the stream of the same ResizeImage, ending on success or error, then pumps to draw; bad bytes are still asserted by the original test to produce no viewer and no unhandled exception.

The explicit reproducer `app/test/chat/support/tool_images_decode_probe.dart` uses the public Flutter test binding to suspend the first real codec. The ImageCache's re-resolve of the same ResizeImage is the test coordination point for the explicit stream wait; if the original test taps directly, the fixture releases only after the tap is dispatched, so the real codec continues to complete. Actual decoding still calls super, with no faked Image, frame or application result. The gate runs outside the test's fake clock and adds no real sleep. It proves one reproducible sufficient mechanism; it doesn't represent real device latency, nor can it alone determine the sole root cause of the historical 629 failure.

In the app directory, once the original locked dependencies and test fonts are ready:

```bash
flutter test --no-pub test/chat/support/tool_images_decode_probe.dart --plain-name 'one image loads only on expansion and opens the existing viewer'
flutter test --no-pub test/chat/tool_images_test.dart
flutter analyze --no-pub
```

The reproducer lives in support without a `_test.dart` suffix, so automatic discovery in the ordinary chat directory won't register the whole test twice. The formal test file keeps all 9 cases and the 4 existing goldens; goldens are not updated. Not compiled for Android; the full Flutter suite, app JVM and real devices were not run. This item doesn't claim to eliminate all historical chat gate problems.
