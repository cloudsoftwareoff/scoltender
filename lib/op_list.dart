import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'bid_screen.dart';

class OpportunityListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Opportunities')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('opportunities').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          final opportunities = snapshot.data!.docs;
          return ListView.builder(
            itemCount: opportunities.length,
            itemBuilder: (context, index) {
              final opportunity = opportunities[index];
              return ListTile(
                title: Text(opportunity['title']),
                subtitle: Text(opportunity['description']),
                trailing: Text('Ends on: ${opportunity['endDate'].toDate()}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BidScreen(opportunityId: opportunity.id)),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
