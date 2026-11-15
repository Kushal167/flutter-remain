import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<int> items = [0, 1, 2, 3];
  File? _file; // nullable :no valid file until the user picks one

  Future<void> pickFile() async {
    final PlatformFile? result = await FilePicker.pickFile(
      type: FileType.image,
    );

    if (result != null && result.path != null) {
      setState(() {
        _file = File(result.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Column(
              children: [
                // if (_file != null)
                //   Image.file(_file!)
                // else
                //   const Text('No image selected'),
                // TextButton(onPressed: pickFile, child: const Text('Pick File')),

                Column(
                  children: [
                    Container(
                      height: 280,
                      width: 380,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                          colors: [Colors.red, Colors.orangeAccent],
                          begin: AlignmentGeometry.topLeft,
                          end: AlignmentGeometry.bottomRight,
                        ),
                      ),
                      child: Center(
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 80,

                              child: _file != null
                                  ? ClipOval(
                                      child: Image.file(
                                        _file!,
                                        width: 160,
                                        // height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : const Text('No Image'),
                            ),

                            Positioned(
                              bottom: 6,
                              right: 8,
                              child: Container(
                                width: 40,

                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: pickFile,
                                  icon: Icon(Icons.edit, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // CircleAvatar(
                //   radius: 100,

                //   child: _file != null
                //       ? ClipOval(
                //           child: Image.file(
                //             _file!,
                //             width: 200,
                //             // height: 200,
                //             fit: BoxFit.cover,
                //           ),
                //         )
                //       : const Text('No Image'),
                // ),
                // IconButton(onPressed: pickFile, icon: Icon(Icons.add)),
                // TextButton(onPressed: pickFile, child: const Text('Pick File')),
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListTile(
                            leading: Icon(Icons.home),

                            title: Text('Home'),
                            trailing: Icon(Icons.arrow_forward_ios_outlined),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
