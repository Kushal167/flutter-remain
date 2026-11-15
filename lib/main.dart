import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  uploadPdf();
                },
                child: Text('Upload PDF'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> uploadPdf() async {
  var dio = Dio();

  final PlatformFile? result = await FilePicker.pickFile(
    type: FileType.custom,
    allowedExtensions: ['pdf'],
  );

  if (result == null || result.path == null) return;
  final String filepath = result.path!;
  final String fileName = result.name;

  final data = FormData.fromMap({
    'file': await MultipartFile.fromFile(filepath, filename: fileName),
  });
  try {
    final response = await dio.post(
      'https://pdf.ai/api/v1/upload/url',
      data: data,
      options: Options(headers: {'x-api-key': 'apikey'}),
      onSendProgress: (sent, total) => print('$sent/$total'),
    );
    debugPrint('Status: ${response.statusCode}');
    debugPrint('Body: ${response.data}');
  } on DioException catch (e) {
    debugPrint('Upload failed: ${e.message}');
  }
}

// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   File? _file;
//   bool _isUploading = false;

//   // 8. UPLOADING FILE
//   Future<void> uploadFile() async {
//     final PlatformFile? result = await FilePicker.pickFile(
//       type: FileType.image,
//     );

//     if (result == null || result.path == null) return;

//     // Show the picked image immediately
//     setState(() {
//       _file = File(result.path!);
//       _isUploading = true;
//     });

//     try {
//       final data = FormData.fromMap({
//         'image': await MultipartFile.fromFile(
//           result.path!,
//           filename: result.name,
//         ),
//         'name': '',
//       });

//       final response = await Dio().post(
//         "https://api.imgbb.com/1/upload?key=d11819496fead660e9100ceb0720b5c2",
//         data: data,
//         onSendProgress: (int sent, int total) {
//           debugPrint("$sent / $total");
//         },
//       );

//       debugPrint('Status: ${response.statusCode}');
//       debugPrint('Body: ${response.data}');
//     } on DioException catch (e) {
//       debugPrint('Upload failed: ${e.message}');
//       debugPrint('Response: ${e.response?.data}');
//     } catch (e, st) {
//       debugPrint('Other error: $e\n$st');
//     } finally {
//       if (mounted) {
//         setState(() {
//           _isUploading = false;
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 if (_file != null)
//                   Image.file(_file!, width: 200, height: 200, fit: BoxFit.cover)
//                 else
//                   const Text('No image Selected'),
//                 const SizedBox(height: 20),
//                 if (_isUploading)
//                   const CircularProgressIndicator()
//                 else
//                   TextButton(
//                     onPressed: () async {
//                       await uploadFile();
//                     },
//                     child: const Text("Upload File"),
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// void fetchData() async {
// void updateData() async {
// void getData() async {
// void downloadFile() async {
//   var dio = Dio();

// 2. POST

// var response = await dio.post(
//   "https://jsonplaceholder.typicode.com/posts",
//   data: {'name': 'Apple', 'email': 'apple@apple.com'},
// );

// 1. GET

// var response = await dio.get("https://jsonplaceholder.typicode.com/todos/2");

// 3. GET + POST CONCURRENTLY

//   var response = await Future.wait([
//     dio.get("https://jsonplaceholder.typicode.com/todos/1"),
//     dio.post("https://jsonplaceholder.typicode.com/posts"),
//   ]);
//   print('Get: ');
//   print(response[0].statusCode);
//   print(response[0].data);

//   print('Post: ');
//   print(response[1].statusCode);
//   print(response[1].data);

// 4. PUT

// var response = await dio.put(
//   "https://jsonplaceholder.typicode.com/posts/1",
//   data: {'name': 'Banana', 'email': 'banana@banana.com'},
// );
// print(response.data);

// 5. PATCH

// var response = await dio.get("https://jsonplaceholder.typicode.com/todos/2");
// var response2 = await dio.patch(
//   "https://jsonplaceholder.typicode.com/todos/2",
//   data: {'title': 'This is the new title'},
// );
// print(response.data);
// print(response2.statusCode);
// print(response2.data);

// 6. DELETE

// var response = await dio.get("https://jsonplaceholder.typicode.com/todos/2");
// print(response.data);
// var res = await dio.delete("https://jsonplaceholder.typicode.com/todos/2");
// print(res.statusCode);
// print(res.data);

// 7. DOWNLOADING TEXT FILE

//   Directory directory = await getApplicationDocumentsDirectory();
//   var response = await dio.download(
//     "https://filesmaples.com/samples/document/txt/sample1.txt",
//     '${directory.path}/file.txt',
//   );
//   print(response.statusCode);
// }

// Future<void> downloadFile() async {
//   print('button pressed');
//   // try {
//   var dio = Dio();

//   Directory directory = await getApplicationDocumentsDirectory();

//   print('Directory: ${directory.path}');

//   var response = await dio.download(
//     "https://pnb-freetoolsforweb.s3.us-east-2.amazonaws.com/samples/documents/txt/sample-text-1kb.txt",
//     '${directory.path}/file.txt1',
//   );

//   print('Status Code: ${response.statusCode}');
//   print('Download completed!');
// } on DioException catch (e) {
//   print('Dio Error: ${e.message}');
//   print('Response: ${e.response?.data}');
// } catch (e, stackTrace) {
//   print('Other Error: $e');
//   print(stackTrace);
// }
// }

// 8. UPLOADING FILE
// Future<void> downloadFile() async {
//   var dio = Dio();

//   FilePickerResult? result = await FilePicker.platform.pickFiles();

//   if (result != null) {
//     String? path = result.files.single.path;

//     if (path != null) {
//       File file = File(path);

//       String filename = file.path.split('/').last;

//       print(filename);
//     }
//   }
// }

// USER SEARCHES THE ID (IN TEXT FIELD) TO GET DATA (SHOWN ON THE SCREEN ITSELF):

// import 'package:dio/dio.dart';
// // import 'package:dio_learning/fetch_data_screen.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late TextEditingController _idController;

//   Map<String, dynamic>? _result;
//   bool _isLoading = false;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _idController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _idController.dispose();
//     super.dispose();
//   }

//   Future<void> fetchData() async {
//     final id = _idController.text.trim();

//     if (id.isEmpty) {
//       setState(() => _result = {'msg': "'Please enter an id'"});
//       return;
//     }
//     setState(() {
//       _isLoading = true;
//       _result = {};
//     });

//     try {
//       final dio = Dio();
//       final response = await dio.get(
//         "https://jsonplaceholder.typicode.com/todos/$id",
//       );

//       final data = response.data;
//       setState(() {
//         _result = {
//           "userId": "${data['userId']}",
//           "id": "${data['id']}",
//           "title": "${data['title']}",
//           "completed": "${data['completed']}",
//         };
//       });
//     } on DioException catch (e) {
//       setState(
//         () => _result = {"Error": "${e.response?.statusCode ?? e.message}"},
//       );
//     } catch (e) {
//       setState(() => _result = {"Error": "$e"});
//     } finally {
//       setState(() => _isLoading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // home: FetchDataScreen(),
//       home: Scaffold(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFormField(
//               controller: _idController,
//               decoration: const InputDecoration(hintText: 'Id'),
//             ),
//             Center(
//               child: TextButton(
//                 onPressed: _isLoading ? null : fetchData,
//                 child: const Text("fetch data"),
//               ),
//             ),
//             if (_isLoading) const CircularProgressIndicator(),
//             SizedBox(height: 100),

//             Container(
//               height: 160,
//               width: 250,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Colors.amber, Colors.amberAccent],
//                   begin: AlignmentGeometry.topLeft,
//                   end: AlignmentGeometry.bottomRight,
//                 ),
//                 border: Border.all(),
//                 borderRadius: BorderRadius.circular(15),
//               ),

//               child: Text(
//                 _result as String,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
