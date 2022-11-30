import 'package:flutter/material.dart';
import 'package:jobizy/app/module/jobsection/getsavedjobs/controller/getsaved.dart';
import 'package:jobizy/app/util/colors.dart';
import 'package:jobizy/app/util/constraisns.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SavedJobPage extends StatelessWidget {
  const SavedJobPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SavedJobsController>(context);
    return provider.isLoading
        ? Lottie.asset('assets/images/98096-washer-waiting.json',
            height: 200, width: 200)
        : LimitedBox(
            maxHeight: 200,
            maxWidth: 310,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      // RouteNavigator.pushRoute(
                      //     context,
                      //     SavedDetailsPage(
                      //         saveModel: provider.alljobs[index]));
                    },
                    child: SizedBox(
                        height: 200,
                        width: 310,
                        child: Card(
                          //  margin: const EdgeInsets.all(13),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 5,
                          color: const Color(0xff008080),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //kheight20,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    kWidth10,
                                    Expanded(
                                      child: Text(
                                        provider.alljobs[index].designation
                                            .toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: kWhite),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.bookmark_border,
                                          color: Colors.transparent,
                                        ))
                                  ],
                                ),
                                kheight20,
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        height: 55,
                                        width: 55,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: const Color.fromARGB(
                                                255, 224, 223, 223),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                  provider.alljobs[index].image
                                                      .toString(),
                                                ))),
                                      ),
                                      kWidth,
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 5),
                                            child: Text(
                                              provider.alljobs[index].company
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400,
                                                  color: kWhite),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 5),
                                            child: Text(
                                              provider.alljobs[index].place
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: kWhite),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Container(
                                        height: 25,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.black38),
                                        child: Center(
                                            child: Text(
                                          provider.alljobs[index].jobType
                                              .toString(),
                                          style: const TextStyle(color: kWhite),
                                        )),
                                      )
                                    ],
                                  ),
                                ),
                                kheight20,
                                Row(
                                  children: [
                                    kWidth10,
                                    Text(
                                      'Posted Date:     ${provider.alljobs[index].createdAt!.day} : ${provider.alljobs[index].createdAt!.month} : ${provider.alljobs[index].createdAt!.year}',
                                      style: const TextStyle(
                                        color: kWhite,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 2,
                  );
                },
                itemCount: provider.alljobs.length),
          );
  }
}
