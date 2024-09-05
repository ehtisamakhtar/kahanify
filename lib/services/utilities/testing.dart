import 'package:kahanify_app/custom_widgets/models/plan.dart';
import 'package:http/http.dart' as http;
Future<List<Plan>> fetchPlans() async {
  await Future.delayed(Duration(seconds: 2)); // Simulate network delay
  return [
    Plan(
      title: 'Reading',
      imageUrl: 'https://www.pexels.com/photo/yellow-and-black-wooden-cabinet-4835429/',
      description: 'Subscribe For Reading & Audio',
      price: '1,460',
    ),
    Plan(
      title: 'Reading & Audio',
      imageUrl: 'https://www.pexels.com/photo/a-cat-sitting-on-top-of-some-rocks-15587985/',
      description: 'Subscribe For Reading, Audio & Vedio',
      price: '2,460',
    ),
    // Add more mock plans if needed
  ];
}
