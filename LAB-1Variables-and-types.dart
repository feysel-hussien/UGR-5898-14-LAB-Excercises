a = 10
b = 20
c = 30


sum_of_variables = a + b + c

print("The sum of a, b, and c is:", sum_of_variables)

  #2
  my_string = "Hello, World!"

print("The length of the string is:", len(my_string))
   #3
  void main() {
  int dayNumber = 3; 

  switch (dayNumber) {
    case 1:
      print("Monday");
      break;
    case 2:
      print("Tuesday");
      break;
    case 3:
      print("Wednesday");
      break;
    case 4:
      print("Thursday");
      break;
    case 5:
      print("Friday");
      break;
    case 6:
      print("Saturday");
      break;
    case 7:
      print("Sunday");
      break;
    default:
      print("Invalid day number");
  }
}
#4
  void main() {
  int n = 10; 
  int a = 0, b = 1;

  print("First $n Fibonacci numbers:");
  for (int i = 0; i < n; i++) {
    print(a);
    int next = a + b;
    a = b;
    b = next;
  }
}
#5
  def calculate_average(numbers):
    total_sum = sum(numbers)
    num_elements = len(numbers)
    average = total_sum / num_elements
    return average

my_numbers = [10, 20, 30, 40, 50]
result = calculate_average(my_numbers)
print(f"The average of the given numbers is: {result:.2f}")
      #6
      def fibonacci_sequence(n):
    fib_numbers = [0, 1]
    for i in range(2, n):
        next_fib = fib_numbers[-1] + fib_numbers[-2]
        fib_numbers.append(next_fib)
    return fib_numbers

n_terms = 10
fib_sequence = fibonacci_sequence(n_terms)
print(f"The first {n_terms} Fibonacci numbers are: {fib_sequence}")
          #7
          def find_highest_number(numbers):
    return max(numbers)

my_numbers = [10, 25, 8, 42, 15]
highest = find_highest_number(my_numbers)
print(f"The highest number in the list is: {highest}")
      #8
      def print_map_keys_and_values(my_map):
    for key, value in my_map.items():
        print(f"Key: {key}, Value: {value}")

my_map = {"name": "Alice", "age": 30, "city": "Wonderland"}
print_map_keys_and_values(my_map)
#9
  def remove_duplicates(numbers):
    return list(set(numbers))


my_numbers = [10, 20, 10, 30, 20, 40, 30]
unique_numbers = remove_duplicates(my_numbers)
print(f"List with duplicates removed: {unique_numbers}")
      #10
      def divide_numbers(a, b):
    try:
        result = a / b
        return result
    except ZeroDivisionError:
        print("Error: Cannot divide by zero")
        return None


numerator = 10
denominator = 0
result = divide_numbers(numerator, denominator)
if result is not None:
    print(f"Result of division: {result}")
      #11
      def read_file(filename):
    try:
        with open(filename, 'r') as file:
            content = file.read()
            return content
    except FileNotFoundError:
        print(f"Error: File '{filename}' not found")
        return None

file_name = "nonexistent_file.txt"
file_content = read_file(file_name)
if file_content is not None:
    print(f"File content:\n{file_content}")
      #13
      def perform_cleanup():
    try:
        # Perform some operation (e.g., opening a database connection)
        print("Performing cleanup operation...")
        # Simulating an exception
        raise Exception("Something went wrong")
    except Exception as e:
        print(f"Caught exception: {e}")
    finally:
        # Ensure cleanup code runs even after an exception
        print("Cleanup complete")
)
#14
          Future<void> fetchData() async {
  
  await Future.delayed(Duration(seconds: 2));
  print("Data fetched successfully!");
}

void main() {
  print("Start fetching data...");
  fetchData();
  print("Continuing with other tasks...");
}
#15
  Future<String> fetchUserData() {
  // Simulating an asynchronous operation (e.g., fetching user data)
  return Future.delayed(Duration(seconds: 1), () => "User123");
}

void main() {
  fetchUserData().then((userData) {
    print("User data received: $userData");
  }).catchError((error) {
    print("Error fetching user data: $error");
  });
}





