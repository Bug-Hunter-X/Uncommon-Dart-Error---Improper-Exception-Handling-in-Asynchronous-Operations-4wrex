# Uncommon Dart Error: Improper Exception Handling in Asynchronous Operations

This repository demonstrates a common issue in Dart where exception handling during asynchronous operations is not robust enough.  The example shows a `Future` that fetches data from a remote API and uses a basic `try-catch` block.  However, there's a lack of detailed exception handling (including custom error types and retry mechanisms).

The `bug.dart` file shows the initial code with limitations. `bugSolution.dart` presents a more improved approach with better error handling.

## Improvements in bugSolution.dart

- More specific exception handling using custom exception types to handle different error scenarios.
- Retry logic to automatically retry failed requests after a certain delay.
- More detailed error reporting including HTTP status code in case of network errors.