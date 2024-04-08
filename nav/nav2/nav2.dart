import 'package:flutter/material.dart';
import 'course.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}

class CoursesListScreen extends StatelessWidget {
  final List<Course> courses;
  final ValueChanged<Course> onTapped;
  const CoursesListScreen({required this.courses, required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Courses List")),
      body: ListView(
        children: [
          for (var course in courses)
            ListTile(
              title: Text(course.title),
              subtitle: Text(course.code),
              onTap: () => onTapped(course),
            ),
        ],
      ),
    );
  }
}

class CourseDetailsScreen extends StatelessWidget {
 final Course course;
 const CourseDetailsScreen({required this.course});
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text(course.title)),
     body: Center(
       child: Column(
         children: [
           Text(course.title),
           Text(course.code),
           Text(course.description),
         ],
       ),),);
 }
}

class CourseApp extends StatefulWidget {
 @override
 State<CourseApp> createState() => _CourseAppState();
}
class _CourseAppState extends State<CourseApp> {
 Course? _selectedCourse;

 List<Course> courses = [
   Course(
       code: "SiTE-001",
       title: "Introduction To Programming",
       description: "Computer Organization, Architecture, Programming"),
   Course(// …)
   Course(// …)
 ];

 @override
 Widget build(BuildContext context) {
   return MaterialApp(// …);
 }
}



