 import 'package:flutter/material.dart';
import 'package:jobizy/app/module/publicjobs/controller/searchcontroll.dart';
import 'package:jobizy/app/module/publicjobs/view/jobfullview/fullview.dart';

ListView searchCard(SearchController provider) {
    return ListView.separated(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => JobFullView(
                      jobs: provider.allsearchjobs[index],
                    ),
                  ),
                );
              },
              child: Card(
                color: const Color(0xff008080),
                elevation: 5,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  provider.allsearchjobs[index].image == null
                                      ? Container(
                                          width: 50,
                                          height: 50,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/image-removebg-preview.png'),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        )
                                      : Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: NetworkImage(provider
                                                  .allsearchjobs[index].image
                                                  .toString()),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        )),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                provider.allsearchjobs[index].company
                                    .toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                '${provider.allsearchjobs[index].state} , ${provider.allsearchjobs[index].country}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Center(
                            child: IconButton(
                              icon: const Icon(Icons.bookmark),
                              color: Colors.grey,
                              iconSize: 30,
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          provider.allsearchjobs[index].designation
                              .toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          provider.allsearchjobs[index].description
                              .toString(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: const Icon(
                              Icons.timer_outlined,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 3.0),
                            child: Text(
                              '${provider.allsearchjobs[index].createdAt!.day} : ${provider.allsearchjobs[index].createdAt!.month} : ${provider.allsearchjobs[index].createdAt!.year}',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "₹ ${provider.allsearchjobs[index].salaryMin} - ${provider.allsearchjobs[index].salaryMax} LPA",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: provider.allsearchjobs.length,
        );
  }

  