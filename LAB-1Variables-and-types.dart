Variables and Data Types
#ex1
String name = "Alice";
int age = 25;
String color = "blue";

print("My name is $name, I am $age years old, and my favorite color is $color.");
ex2
const int SPEED_OF_LIGHT = 299792458; // meters per second

double distance = double.parse(stdin.readLineSync()!);

double time = distance / SPEED_OF_LIGHT; // seconds

print("It takes $time seconds for light to travel $distance meters.");                                                                                           control flow                                                                                                       ex1 
int number = int.parse(stdin.readLineSync()!);
if (number % 2 == 0) {
  print("$number is even.");
} else {
  print("$number is odd.");
}
ex2  
for (int i = 1; i <= 10; i++) {
  print(i);
}
ex4
double x = double.parse(stdin.readLineSync()!);
double y = double.parse(stdin.readLineSync()!);
String op = stdin.readLineSync()!;

switch (op) {
  case "+":
    print("$x + $y = ${x + y}");
    break;
  case "-":
    print("$x - $y = ${x - y}");
    break;
  case "*":
    print("$x * $y = ${x * y}");
    break;
  case "/":
    print("$x / $y = ${x / y}");
    break;
  default:
    print("Invalid operator");
}
ex5
int grade = int.parse(stdin.readLineSync()!);


switch (grade) {
  case 90 ... 100:
    print("Your letter grade is A");
    break;
  case 80 ... 89:
    print("Your letter grade is B");
    break;
  case 70 ... 79:
    print("Your letter grade is C");
    break;
  case 60 ... 69:
    print("Your letter grade is D");
    break;
  case 0 ... 59:
    print("Your letter grade is F");
    break;
  default:
    print("Invalid grade");
}
Functions                                                                                                  
ex1                                                                                                              int add(int a, int b) {
  return a + b;
}

// Call the function from main and print the result
void main() {
  int x = 10;
  int y = 20;
  int z = add(x, y); // Call the function and store the result in a variable
  print(z); // Print the result
}                                                                                                                ex2
import 'dart:math';

bool isPrime(int n) {
  
  if (n <= 1) {
    return false;
  }

  for (int i = 2; i <= sqrt(n); i++) {
    
    if (n % i == 0) {
      return false;
    }
  }
  is prime
  return true;
}

/
void main() {
  int start = 1; // The lower bound of the range
  int end = 100; // The upper bound of the range

  for (int i = start; i <= end; i++) {
  
    if (isPrime(i)) {
      print(i);
    }
  }
}
ex3
String reverse(String s) {
 
  List<String> chars = s.split('');
 
  chars = chars.reversed.toList();
  
  String reversed = chars.join('');
 
  return reversed;
}


void main() {
  String s1 = "Hello, world!";
  String s2 = "Dart is fun";
  String s3 = "Ame\u{301}lie";
  print("$s1 -> ${reverse(s1)}");
  print("$s2 -> ${reverse(s2)}");
  print("$s3 -> ${reverse(s3)}");
}
Classes and Objects
EX1 class Person {
  String name;
  int age;
  String address;

  Person(this.name, this.age, this.address);

  void printDetails() {
    print('Name: $name, Age: $age, Address: $address');
  }
}

void main() {
  Person p1 = Person('Alice', 25, '123 Main Street');
  p1.printDetails();
  p1.name = 'Bob';
  p1.printDetails();
}
EX2                                                                                                          class Student extends Person {
  int rollNumber;
  List<int> marks;

  Student(String name, int age, String address, this.rollNumber, this.marks)
      : super(name, age, address);

  int getTotalMarks() {
    int total = marks.fold(0, (sum, mark) => sum + mark);
    return total;
  }

  double getAverageMarks() {
    double average = getTotalMarks() / marks.length;
    return average;
  }
}

void main() {
  Student s1 = Student('Charlie', 18, '456 College Avenue', 101, [80, 85, 90]);
  s1.printDetails();
  print('Roll number: ${s1.rollNumber}');
  print('Marks: ${s1.marks}');
  print('Total marks: ${s1.getTotalMarks()}');
  print('Average marks: ${s1.getAverageMarks()}');
}         class Rectangle {
  final double width;
  final double height;

  Rectangle(this.width, this.height);

  double get area => width * height;

  double get perimeter => 2 * (width + height);
}class Product {
  final String name;
  final double price;
  final int quantity;

  Product(this.name, this.price, this.quantity);

  double get totalCost => price * quantity;
}abstract class Shape {
  double calculateArea();
}

class Circle extends Shape {
  final double radius;

  Circle(this.radius);

  @override
  double calculateArea() => pi * radius * radius;
}

class Square extends Shape {
  final double side;

  Square(this.side);

  @override
  double calculateArea() => side * side;
}
Asynchronous Programming (async/await)                                     EX1 import 'dart:math';

List<String> quotes = [
  'Be yourself; everyone else is already taken.',
  'Two things are infinite: the universe and human stupidity; and I\'m not sure about the universe.',
  'So many books, so little time.',
  'Be the change that you wish to see in the world.',
  'If you tell the truth, you don\'t have to remember anything.'
];

Future<String> fetchQuote() async {
  Random random = Random();
  int index = random.nextInt(quotes.length);
  int delay = random.nextInt(5) + 1;
  await Future.delayed(Duration(seconds: delay));
  return quotes[index];
}

void main() async {
  String quote = await fetchQuote();
  print(quote);
}
EX2import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> downloadFile(String url, String filename) async {
  http.Response response = await http.get(Uri.parse(url));
  File file = File(filename);
  await file.writeAsBytes(response.bodyBytes);
  print('File downloaded: $filename');
}

void main() async {
  String url = 'https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png';
  String filename = 'flutter-logo.png';
  await downloadFile(url, filename);
}
EX3import 'dart:async';

List<String> data = [
  'Alice',
  'Bob',
  'Charlie',
  'David',
  'Eve',
  'Frank',
  'Grace',
  'Harry',
  'Ivy',
  'Jack'
];

Future<List<String>> loadData() async {
  Duration delay = Duration(seconds: 3);
  await Future.delayed(delay);
  return data;
}

void main() async {
  print('Loading data...');
  List<String> result = await loadData();
  print('Data loaded.');
  print(result);
}
EX4import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/weather.dart' as weather;

Future<weather.Weather> fetchWeather(String apiKey, String city) async {
  String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  Map<String, String> queryParams = {
    'q': city,
    'appid': apiKey,
    'units': 'metric'
  };
  Uri uri = Uri.https(baseUrl, '', queryParams);
  http.Response response = await http.get(uri);
  Map<String, dynamic> json = jsonDecode(response.body);
  weather.Weather w = weather.Weather.fromJson(json);
  return w;
}

void main() async {
  String apiKey = 'YOUR_API_KEY';
  String city = 'London';
  weather.Weather w = await fetchWeather(apiKey, city);
  print('The current temperature in $city is ${w.temperature.celsius} °C.');
  print('The weather condition is ${w.weatherDescription}.');
}
Error Handling (try/catch)                                                                           EX1import 'dart:io';

int inputNumber() {
  print('Enter a number:');
  String input = stdin.readLineSync();
  int number;
  try {
    number = int.parse(input);
  } catch (e) {
    print('Invalid input: $e');
    return null;
  }
  return number;
}

void main() {
  int number = inputNumber();
  if (number != null) {
    print('You entered: $number');
  }
}
EX2double divide(double a, double b) {
  double quotient;
  try {
    quotient = a / b;
  } catch (e) {
    print('Cannot divide by zero: $e');
    return null;
  }
  return quotient;
}

void main() {
  double x = 10;
  double y = 2;
  double z = 0;
  double result1 = divide(x, y);
  if (result1 != null) {
    print('$x / $y = $result1');
  }
  double result2 = divide(x, z);
  if (result2 != null) {
    print('$x / $z = $result2');
  }
}
EX3import 'dart:io';

String readFile(String filename) {
  String content;
  try {
    File file = File(filename);
    content = file.readAsStringSync();
  } catch (e) {
    print('Error reading file: $e');
    return null;
  }
  return content;
}
