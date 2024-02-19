import 'package:flutter/material.dart';
import 'package:watter_bucket/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _xController = TextEditingController();
  final _yController = TextEditingController();
  final _zController = TextEditingController();
  late HomeController _homeController;

  @override
  void initState() {
    super.initState();

    _homeController = HomeController();
  }

  @override
  void dispose() {
    _homeController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _homeController.getInstruction(int.parse(_xController.text),
          int.parse(_yController.text), int.parse(_zController.text));
      _xController.clear();
      _yController.clear();
      _zController.clear();
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Water Jug Challenge",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _xController,
                      decoration: const InputDecoration(labelText: 'Jug X'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please insert X value';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _yController,
                      decoration: const InputDecoration(labelText: 'Jug Y'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please insert Y value';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _zController,
                      decoration: const InputDecoration(labelText: 'Target'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please insert Target value';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _submitForm,
                          child: const Text('Submit'),
                        ),
                      ),
                    ),
                    const Divider(),
                    const SizedBox(height: 16,),
                    ValueListenableBuilder(
                      valueListenable: _homeController.result,
                      builder: (context, value, _) => Column(
                        children: [
                          Visibility(
                            visible: _homeController.target.value > 0,
                            child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Text(
                                  "Target: ${_homeController.target.value}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                )),
                          ),
                          const SizedBox(height: 16,),
                          Visibility(
                            visible: _homeController.result.value.isEmpty &&
                                _homeController.target.value > 0,
                            child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(30)),
                                child: const Text(
                                  "No Solution",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                )),
                          ),
                          Visibility(
                            visible: _homeController.result.value.isNotEmpty,
                            child: SizedBox(
                              width: double.infinity,
                              child: DataTable(
                                showBottomBorder: true,
                                columns: const <DataColumn>[
                                  DataColumn(label: Text('X')),
                                  DataColumn(label: Text('Y')),
                                  DataColumn(label: Text('Explanation')),
                                ],
                                rows: _homeController.result.value
                                    .map((item) => DataRow(cells: <DataCell>[
                                          DataCell(
                                              Text(item.bucketx.toString())),
                                          DataCell(
                                              Text(item.buckety.toString())),
                                          DataCell(Text(item.instruction)),
                                        ]))
                                    .toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
