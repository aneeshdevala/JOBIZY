import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobizy/app/module/homescreen/controller/homescreen.dart';
import 'package:jobizy/app/util/colors.dart';
import 'package:jobizy/app/util/constraisns.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<HomeController>(context, listen: false).notifyListeners();
    final HomeController homeController = context.read<HomeController>();
    //  final storage = FlutterSecureStorage();
    final getStorage = GetStorage();

    // final signIn = Provider.of<SigninController>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: LimitedBox(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            homeController.logout(context);
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Icon(
                              Icons.person,
                              size: 50,
                            ),
                          ),
                        ),
                        kWidth20,
                        Text(
                          homeController.greeting(),
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: kBlack,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                wordSpacing: 2,
                                letterSpacing: 1),
                          ),
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              homeController.logout(context);
                            },
                            icon: const Icon(
                              Icons.settings,
                              color: kBlack,
                            )),
                      ]),
                ),
              ),
              Expanded(
                  flex: 8,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Card(
                          elevation: 0,
                          color: Theme.of(context).cardColor,
                          margin: const EdgeInsets.all(16),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  contentPadding: const EdgeInsets.all(0),
                                  leading: const CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(
                                        "assets/casual-life-3d-man-searching-music-with-phone.png"),
                                  ),
                                  title: Text('Samuel',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600)),
                                  subtitle: Text('4 Hours Ago',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.grey)),
                                  trailing: IconButton(
                                      onPressed: null,
                                      icon: Icon(
                                        Icons.more_horiz,
                                        color:
                                            Theme.of(context).iconTheme.color,
                                      )),
                                ),
                                const Text(
                                  'I am looking for a job as a driver',
                                  textAlign: TextAlign.center,
                                ),
                                kheight,
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/homeimage.jpg',
                                    height: 200,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                              onPressed: null,
                                              icon: Icon(Icons.favorite,
                                                  color: Theme.of(context)
                                                      .iconTheme
                                                      .color)),
                                          IconButton(
                                              onPressed: null,
                                              icon: Icon(Icons.comment,
                                                  color: Theme.of(context)
                                                      .iconTheme
                                                      .color))
                                        ],
                                      ),
                                      IconButton(
                                          onPressed: null,
                                          icon: Icon(
                                            Icons.share,
                                            color: Theme.of(context)
                                                .iconTheme
                                                .color,
                                          )),
                                    ]),
                              ],
                            ),
                          ));
                    },
                    itemCount: 10,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                    },
                  )
                  //  ListView.separated(
                  //     itemBuilder: ((context, index) => Card(
                  //           elevation: 0,
                  //           child: ListTile(
                  //             leading: const CircleAvatar(
                  //               backgroundColor: Colors.transparent,
                  //               child: Icon(
                  //                 Icons.person,
                  //                 size: 50,
                  //               ),
                  //             ),
                  //             title: Text(
                  //               homeController.greeting(),
                  //               style: GoogleFonts.poppins(
                  //                 textStyle: const TextStyle(
                  //                     color: kBlack,
                  //                     fontSize: 20,
                  //                     fontWeight: FontWeight.w500,
                  //                     wordSpacing: 2,
                  //                     letterSpacing: 1),
                  //               ),
                  //             ),
                  //             subtitle: const Text('Software Engineer'),
                  //             trailing: const Icon(Icons.more_vert),
                  //           ),
                  //         )),
                  //     separatorBuilder: (BuildContext context, int index) {
                  //       return const Divider();
                  //     },
                  //     itemCount: 20),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
