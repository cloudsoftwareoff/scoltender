import 'package:flutter/material.dart';
import 'package:scoltender/create_opportunity.dart';
import 'package:scoltender/op_list.dart';
import 'package:scoltender/services/auth_service.dart';

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
            ElevatedButton(
              onPressed: () {
                UserAuth().signOut(context);
              },
              child: const Text('Log out'),
            ),
            const SizedBox(
              height: 10,
            ),
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
