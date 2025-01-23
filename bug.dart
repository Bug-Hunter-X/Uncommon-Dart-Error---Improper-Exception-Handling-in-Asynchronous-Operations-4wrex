```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Process the JSON response
      final jsonData = jsonDecode(response.body);
      // Access data from jsonData
      print(jsonData['key']);
    } else {
      // Handle error appropriately
      throw Exception('Failed to load data');
    }
  } catch (e) {
    // Handle the exception
    print('Error: $e');
    // Optionally re-throw the exception
    // rethrow;
  }
}
```