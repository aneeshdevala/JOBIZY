import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class UserProfile extends StatelessWidget {
  UserProfile({super.key});
  int? _value = 1;
  List index = ['Saved Jobs', 'Applied Jobs', 'Your Jobs'];
  @override
  Widget build(BuildContext context) {
    //  final provider = Provider.of<HomeController>(context, listen: false);
    final getStorage = GetStorage();
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Profile'),
        ),
        body: Column(
          children: [
            (
            ChoiceChip(
                label: Text(index[1]),
                selected: _value == index,
              )
            )
          ],
        ));
  }
}
