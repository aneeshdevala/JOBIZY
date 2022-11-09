import 'package:flutter/material.dart';
import 'package:jobizy/app/module/alljobs/yourjobs/controller/jobcontroller.dart';
import 'package:jobizy/app/module/alljobs/yourjobs/model/jobmodel.dart';
import 'package:jobizy/app/util/colors.dart';
import 'package:provider/provider.dart';

class JobFullDetails extends StatelessWidget {
  final Postedjobsmodel jobs;
  const JobFullDetails({Key? key, required this.jobs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<JobController>(context, listen: false);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(18.0),
            child: GestureDetector(
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
              size: 25,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              provider.isLoading == true
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Center(
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                          elevation: 10.0,
                          child: Container(
                            margin: const EdgeInsets.all(20.0),
                            child: Image.asset(
                              "assets/images/3d-fluency-google-logo.png",
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),
                      ),
                    ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    jobs.company.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Text(
                          jobs.designation.toString(),
                          style: TextStyle(
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      Text(
                        '\u2022',
                        style: TextStyle(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          jobs.jobType.toString(),
                          style: TextStyle(
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
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
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Job Description',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  jobs.description.toString(),
                  textScaleFactor: 1.1,
                  textAlign: TextAlign.justify,
                  maxLines: 8,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Company Address',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      '\u2022',
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xff008080),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        "${jobs.place}, ${jobs.country}",
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
