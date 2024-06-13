import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateOpportunityScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();
  DateTime endDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Opportunity')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: budgetController,
              decoration: InputDecoration(labelText: 'Budget'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                endDate = await showDatePicker(
                  context: context,
                  initialDate: endDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                ) ?? endDate;
              },
              child: Text('Pick End Date'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _createOpportunity();
              },
              child: Text('Create Opportunity'),
            ),
          ],
        ),
      ),
    );
  }

  void _createOpportunity() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance.collection('opportunities').add({
        'title': titleController.text,
        'description': descriptionController.text,
        'budget': double.parse(budgetController.text),
        'endDate': endDate,
        'createdBy': user.uid,
      });
      // Show success message or navigate to another screen
    }
  }
}
