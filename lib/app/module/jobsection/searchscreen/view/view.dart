import 'package:flutter/material.dart';

import 'package:jobizy/app/module/jobsection/searchscreen/controller/searchcontroll.dart';
import 'package:jobizy/app/module/jobsection/widgets/searchcard.dart';
import 'package:jobizy/app/util/constraisns.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchController>(context, listen: false);
    return SafeArea(
      child: Scaffold(
          body: Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top, right: 25, left: 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Material(
                      child: TextField(
                        onChanged: (value) {
                          provider.searchButton(context);
                        },
                        // key: provider.searchKey,
                        textInputAction: TextInputAction.search,
                        controller: provider.searchController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          suffixIcon: Container(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: GestureDetector(
                              onTap: () {
                                provider.searchButton(context);
                              },
                              child: const Icon(
                                Icons.search,
                                color: Color(0xff008080),
                                size: 30.0,
                              ),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: 'Search Job',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              kheight20,
              provider.searchController.text.isEmpty
                  ? Center(
                      child: Column(
                      children: [
                        Image.asset(
                          'assets/searching.png',
                          height: 200,
                          width: 200,
                        ),
                        const Text(
                          'Search for a job',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ))
                  : provider.isloading
                      ? const Center(child: CircularProgressIndicator())
                      : searchCard(provider),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      )),
    );
  }
}
