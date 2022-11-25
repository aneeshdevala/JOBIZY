import 'package:flutter/material.dart';
import 'package:jobizy/app/module/bottomscreen/controller/bottomnavcon.dart';
import 'package:jobizy/app/module/jobsection/yourjobs/controller/jobcontroller.dart';
import 'package:jobizy/app/module/jobsection/mainscreen/viewscreen.dart';
import 'package:jobizy/app/util/colors.dart';
import 'package:jobizy/app/module/chatscreen/chatscreen.dart';
import 'package:jobizy/app/module/homescreen/view/homescreen.dart';
import 'package:jobizy/app/module/userprofile/userprofile.dart';
import 'package:provider/provider.dart';

class BottomScreen extends StatelessWidget {
  BottomScreen({Key? key}) : super(key: key);

  final pages = [
    const HomePage(),
    const AllJobs(),
    // const AddPost(),
    UserProfile(),
    const ChatScreen(),
    // const JobsPage(),
    // const CreatePage(),
    // const AccountPage(),
    // const MessagePage()
  ];

  @override
  Widget build(BuildContext context) {
    final postedjobspro = Provider.of<JobController>(context);
    final provider = Provider.of<BottomNavBarController>(context);
    return Scaffold(
        extendBody: true,
        body: pages[provider.currentIndex],
        bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
              backgroundBlendMode: BlendMode.clear,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.085,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18.0),
                topRight: Radius.circular(18.0),
              ),
              child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  elevation: 5,
                  backgroundColor: kWhite,
                  selectedItemColor: mainColor,
                  unselectedItemColor: kWhite,
                  selectedFontSize: 25,
                  selectedIconTheme:
                      const IconThemeData(size: 32, color: mainColor),
                  selectedLabelStyle: const TextStyle(fontSize: 10),
                  unselectedLabelStyle: const TextStyle(color: kBlack),
                  unselectedIconTheme:
                      const IconThemeData(size: 28, color: kGrey),
                  currentIndex: provider.currentIndex,
                  onTap: (value) {
                    postedjobspro.getAllJobs(context);
                    provider.currentIndex = value;
                    provider;
                  },
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.home_rounded,
                        ),
                        label: 'Home'),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.supervised_user_circle_rounded,
                        ),
                        label: 'Jobs'),
                    // BottomNavigationBarItem(
                    //     icon: Icon(
                    //       Icons.add,
                    //     ),
                    //     label: 'Create'),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.account_circle_outlined,
                        ),
                        label: 'Account'),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.messenger_outline_rounded,
                        ),
                        label: 'Message'),
                  ]),
            )));
  }
}
