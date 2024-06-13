import 'package:flutter/material.dart';
import 'package:scoltender/create_opportunity.dart';
import 'package:scoltender/op_list.dart';

class DashboardScreen extends StatelessWidget {
  final String userRole;

  DashboardScreen({required this.userRole});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (userRole == 'establishment')
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateOpportunityScreen()));
                },
                child: Text('Create Opportunity'),
              ),
            if (userRole == 'contractor')
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OpportunityListScreen()));
                },
                child: Text('View Opportunities'),
              ),
          ],
        ),
      ),
    );
  }
}
