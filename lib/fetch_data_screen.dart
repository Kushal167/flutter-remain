// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

// class FetchDataScreen extends StatefulWidget {
//   const new({super.key});

//   @override
//   State<FetchDataScreen> createState() => _FetchDataScreenState();
// }

// class _FetchDataScreenState extends State<FetchDataScreen> {
//   String _result = "No data yet";
//   bool _isLoading = false;

//   Future<void> fetchData() async {
//     setState(() {
//       _isLoading = true;
//       _result = '';
//     });

//     try {
//       final dio = Dio();
//       final response = await dio.get(
//         "https://jsonplaceholder.typicode.com/todos/1",
//       );
//       final data = response.data;

//       setState(() {
//         _result =
//             "userId: ${data['userId']}\n"
//             "id: ${data['id']}\n"
//             "title: ${data['title']}\n"
//             "completed: ${data['completed']}";
//       });
//     } catch (e) {
//       setState(() {
//         _result = "Error: $e";
//       });
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Dio-Get')),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               if (_isLoading) const CircularProgressIndicator(),
//               const SizedBox(height: 20),
//               Text(
//                 _result,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(fontSize: 16),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _isLoading ? null : fetchData,
//                 child: const Text("Fetch Data"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
