```dart
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class CustomApiException implements Exception {
  final String message;
  CustomApiException(this.message);
  @override
  String toString() => message;
}

Future<void> fetchData() async {
  int retryCount = 0;
  const maxRetries = 3;
  const retryDelay = Duration(seconds: 2);
  while (retryCount < maxRetries) {
    try {
      final response = await http.get(Uri.parse('https://api.example.com/data'));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        print(jsonData['key']);
        return;
      } else {
        if (response.statusCode == 404) {
          throw CustomApiException('Data not found');
        } else if (response.statusCode == 500) {
          throw CustomApiException('Server error');
        } else {
          throw CustomApiException('HTTP error ${response.statusCode}');
        }
      }
    } on SocketException catch (e) {
      print('Network error: $e');
    } on FormatException catch (e) {
      print('JSON parsing error: $e');
    } on CustomApiException catch (e) {
      print('Custom API Error: $e');
      rethrow; // To stop retries for specific custom errors
    } on Exception catch (e) {
      print('Error: $e');
    } catch (e) {
      print('Unknown Error: $e');
    }
    await Future.delayed(retryDelay);
    retryCount++;
  }
  throw Exception('Failed to load data after multiple retries');
}
```