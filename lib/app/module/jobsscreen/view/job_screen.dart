import 'package:flutter/material.dart';
import 'package:jobizy/app/module/jobsscreen/view/addjob.dart/view/addjob.dart';
import 'package:jobizy/app/util/route.dart';

class JobScreen extends StatelessWidget {
  const JobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job'),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
          colors: [Colors.orange[300]!, Colors.orange[100]!],
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Job',
                style: TextStyle(fontSize: 30),
              ),
              FloatingActionButton(
                onPressed: () {
                  RouteNavigator.pushReplacement(context, const AddjobScreen());
                },
                child: Icon(Icons.add),
              )
            ],
          ),
        ),
      ),
    );
  }
}
