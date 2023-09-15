// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';



void main() {
  runApp(DiaryApp());
}

class DiaryEntry {
  final int index;
  final String text;

  DiaryEntry({required this.index, required this.text});
}

class DiaryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diary App',
      home: DiaryScreen(),
    );
  }
}

class DiaryScreen extends StatefulWidget {
  @override
  _DiaryScreenState createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  List<DiaryEntry> entries = [];
  final TextEditingController entryController = TextEditingController();
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center( 
          child: Text(
            'Diary App',
            style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('${entries[index].index}: ${entries[index].text}'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: entryController,
              decoration: const InputDecoration(labelText: 'Enter your thought'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              addEntry();
            },
            child: const Text(
              'Save Entry',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  void addEntry() {
    String newEntry = entryController.text;
    if (newEntry.isNotEmpty) {
      setState(() {
        entries.add(DiaryEntry(index: currentIndex, text: newEntry));
        currentIndex++;
        entryController.clear();
      });
    }
    
  }
}
