import 'package:flutter/material.dart';
import 'package:jobizy/app/module/alljobs/model/searchrespo.dart';
import 'package:jobizy/app/module/alljobs/view/jobapply/model/applymodel.dart';
import 'package:jobizy/app/module/register/loginscreen/model/loginrespo.dart';
import 'package:jobizy/app/util/colors.dart';
import 'package:jobizy/app/util/constraisns.dart';

import '../widgets/applywidget.dart';

class JobFullView extends StatelessWidget {
  final SearchResponse jobs;
  final Applymodel? user;
  const JobFullView({Key? key, required this.jobs, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: kWhite,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: const Icon(
                Icons.arrow_back_ios_outlined,
                color: kBlack,
                size: 15,
              ),
            ),
          ),
          title: const Text(
            'Job Details',
            style: TextStyle(
              color: kBlack,
            ),
          ),
          actions: const [
            Icon(
              Icons.share,
              size: 20,
              color: kBlack,
            ),
          ],
          centerTitle: true,
        ),
      ),
      backgroundColor: kWhite,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Card(
                      elevation: 10.0,
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        child: jobs.image == null
                            ? Image.asset(
                                'assets/image-removebg-preview.png',
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                jobs.image!,
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    kheight20,
                    Text(
                      jobs.company.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    kheight20,
                    Text(
                      jobs.designation.toString(),
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.bold),
                    ),
                    kheight20,
                    Text(
                      'JobType : ${jobs.jobType} ',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    kheight20,
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.5,
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        child: IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.group,
                                    color: Color(0xff008080),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      '${jobs.vacancy} Vacancies',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              VerticalDivider(
                                thickness: 2,
                                width: 10,
                                color: Colors.grey.shade300,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.favorite_border_outlined,
                                    color: Color(0xff008080),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: const Text(
                                      '40K Likes',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              VerticalDivider(
                                thickness: 2,
                                width: 10,
                                color: Colors.grey.shade300,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Color(0xff008080),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      jobs.country.toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            kheight20,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Job Description',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                kheight,
                Text(
                  jobs.description.toString(),
                  maxLines: 8,
                ),
                kheight,
                Text(
                  'Salary upto ${jobs.salaryMin} - ${jobs.salaryMax} LPA',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                kheight,
                Text(
                  'Experience Level: ${jobs.jobFor} ',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                kheight,
                const Text(
                  'Company Address',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                kWidth20,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      '\u2022',
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xff008080),
                      ),
                    ),
                    Text(
                      " ${jobs.place}, ${jobs.country}",
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
      bottomNavigationBar: Aplywideget(
       user: user,
        jobs: jobs,
      ),
    );
  }
}
