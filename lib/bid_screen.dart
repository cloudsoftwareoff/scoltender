import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BidScreen extends StatelessWidget {
  final String opportunityId;
  final TextEditingController bidAmountController = TextEditingController();

  BidScreen({required this.opportunityId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Place a Bid')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: bidAmountController,
              decoration: InputDecoration(labelText: 'Bid Amount'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _placeBid(context);
              },
              child: Text('Submit Bid'),
            ),
          ],
        ),
      ),
    );
  }

  void _placeBid(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance.collection('bids').add({
        'opportunityId': opportunityId,
        'contractorId': user.uid,
        'amount': double.parse(bidAmountController.text),
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Bid placed")));
      Navigator.of(context).pop();
    }
  }
}
