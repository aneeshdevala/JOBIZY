import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobizy/app/module/homescreen/controller/homescreen.dart';
import 'package:jobizy/app/module/homescreen/widgets/shimmer.dart';
import 'package:jobizy/app/util/colors.dart';
import 'package:jobizy/app/util/constraisns.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // final providers = Provider.of();
  @override
  Widget build(BuildContext context) {
    final HomeController provider = context.read<HomeController>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeController>(context, listen: false).greeting();
    });

    //  final storage = FlutterSecureStorage();

    // final signIn = Provider.of<SigninController>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<HomeController>(
            builder: (context, value, child) => Column(
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
                            provider.logout(context);
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
                          provider.greetings,
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: kBlack,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                wordSpacing: 2,
                                letterSpacing: 1),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            provider.logout(context);
                          },
                          icon: const Icon(
                            Icons.settings,
                            color: kBlack,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                kheight20,
                Expanded(
                  flex: 10,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Your Posts')),
                      provider.isLoading
                          ? ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: ((context, index) {
                                return buildPostShimmer();
                              }),
                              itemCount: 5,
                            )
                          : ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Card(
                                    elevation: 0,
                                    color: Theme.of(context).cardColor,
                                    margin: const EdgeInsets.all(16),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ListTile(
                                            contentPadding:
                                                const EdgeInsets.all(0),
                                            leading: const CircleAvatar(
                                              radius: 30,
                                              backgroundImage: AssetImage(
                                                  "assets/casual-life-3d-man-searching-music-with-phone.png"),
                                            ),
                                            title: Text(
                                                provider
                                                    .allpost[index].userId!.name
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .copyWith(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                            subtitle: Text('4 Hours Ago',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2!
                                                    .copyWith(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.grey)),
                                            trailing: IconButton(
                                                onPressed: null,
                                                icon: Icon(
                                                  Icons.more_horiz,
                                                  color: Theme.of(context)
                                                      .iconTheme
                                                      .color,
                                                )),
                                          ),
                                          provider.allpost[index].title == null
                                              ? const Text('')
                                              : Text(
                                                  provider.allpost[index].title
                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                ),
                                          kheight,
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: provider
                                                        .allpost[index].image ==
                                                    null
                                                ? Image.asset(
                                                    'assets/homeimage.jpg',
                                                    height: 200,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    fit: BoxFit.cover,
                                                  )
                                                : Image.network(provider
                                                    .allpost[index].image
                                                    .toString()),
                                          ),
                                          kheight,
                                          Text(
                                            provider.allpost[index].likes!
                                                    .isEmpty
                                                ? 'You are the first one to like this'
                                                : '${provider.allpost[index].likes!.length}  others Like this',
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2!
                                                .copyWith(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.grey[800]),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    IconButton(
                                                        onPressed: null,
                                                        icon: Icon(
                                                            Icons
                                                                .favorite_border,
                                                            color: Theme.of(
                                                                    context)
                                                                .iconTheme
                                                                .color)),
                                                    IconButton(
                                                        onPressed: null,
                                                        // onPressed: provider.allpost[index].likes!.isEmpty
                                                        //     ? () {
                                                        //         provider
                                                        //             .likePost(
                                                        //                 provider
                                                        //                     .allpost[
                                                        //                         index]
                                                        //                     .id
                                                        //                     .toString());
                                                        //       }
                                                        //     : () {
                                                        //         provider
                                                        //             .unlikePost(
                                                        //                 provider
                                                        //                     .allpost[
                                                        //                         index]
                                                        //                     .id
                                                        //                     .toString());
                                                        //       },
                                                        icon: Icon(
                                                            Icons.comment,
                                                            color: Theme.of(
                                                                    context)
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
                              itemCount: provider.allpost.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const Divider();
                              },
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPostShimmer() => ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Card(
            elevation: 0,
            color: kGrey,
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
                          title: Container(
                            height: 18,
                          ),
                          subtitle: Container(
                            height: 18,
                          )),
                      Container(
                        height: 10,
                        width: double.infinity,
                        color: kGrey,
                      ),
                      kheight,
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 200,
                          )),
                      kheight,
                      const SizedBox(height: 10, width: double.infinity),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    onPressed: null,
                                    icon: Icon(Icons.favorite_border,
                                        color:
                                            Theme.of(context).iconTheme.color)),
                                IconButton(
                                    onPressed: null,
                                    icon: Icon(Icons.comment,
                                        color:
                                            Theme.of(context).iconTheme.color))
                              ],
                            ),
                            IconButton(
                                onPressed: null,
                                icon: Icon(
                                  Icons.share,
                                  color: Theme.of(context).iconTheme.color,
                                )),
                          ]),
                    ])),
          );
        },
        itemCount: 2,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      );
}
