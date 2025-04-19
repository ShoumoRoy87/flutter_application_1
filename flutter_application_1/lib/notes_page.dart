// File: pages/notes_page.dart
import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final List<String> notes = [];
  final TextEditingController controller = TextEditingController();

  void addNote() {
    final text = controller.text.trim();
    if (text.isNotEmpty) {
      notes.add(text);
      controller.clear();
      setState(() {});
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: "Enter Note"),
              onSubmitted: (_) => addNote(),
            ),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: addNote, child: const Text("Add Note")),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: notes.length,
                itemBuilder:
                    (context, index) =>
                        Card(child: ListTile(title: Text(notes[index]))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
