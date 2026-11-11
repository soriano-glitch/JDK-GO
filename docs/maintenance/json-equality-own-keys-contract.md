# Own-field contract for JSON structural equality

Refs W17-B, public JSON function data consistency, no corresponding public issue number. Base 63e255fab5cb9d817af30b631c3643ccce8e9231.

The public deepEqualJson declares that it compares whether two JSON-compatible values contain the same JSON data. An ordinary own field `__proto__` created by JSON.parse is also legal document data, and isJsonValue accepts it; comparing object members must not substitute an inherited property for a missing own field. Objects with different own fields should be unequal in both directions, and objects with the same fields should be equal in both directions. Object key insertion order doesn't affect equality; array order matters.

The fix only replaces the record branch's `key in right` with `Object.hasOwn(right, key)`. It doesn't change ===, null/type checks, array length/order, recursive value comparison or the public interface; there is no object prototype assignment, permission/account logic or new dependency. All tests use legal JSON.parse data, first confirming the domain with the public isJsonValue, then comparing results and that inputs are unchanged.

The actual evidence is limited to the public function contract; it doesn't claim that the translator, historical PTC logs or model configuration downstream have actually been corrupted. Changes runtimeVersion; not compiled for Android. No app/UI/asset changes.
