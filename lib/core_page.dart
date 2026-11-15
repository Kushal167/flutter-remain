import 'package:flutter/material.dart';

class CorePage extends StatefulWidget {
  const new({super.key});

  @override
  State<CorePage> createState() => _CorePageState();
}

class _CorePageState extends State<CorePage> {
  late TextEditingController _idController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _idController = TextEditingController();
  }

  @override
  void dispose() {
    _idController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
