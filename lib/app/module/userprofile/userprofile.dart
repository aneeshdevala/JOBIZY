import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jobizy/app/module/alljobs/controller/searchcontroll.dart';
import 'package:jobizy/app/module/homescreen/controller/homescreen.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeController>(context, listen: false);
    final getStorage = GetStorage();
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Profile'),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('User Name: ${getStorage.read('name')}'),
          ]),
        ));
  }
}
