
import 'package:flutter/material.dart';

import '../../../../util/colors.dart';

class Aplywideget extends StatelessWidget {
  const Aplywideget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.all(15.0),
        height: 80.0,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 10.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Card(
                elevation: 5.0,
                shadowColor: const Color(0xff008080),
                child: Container(
                  margin: const EdgeInsets.all(5.0),
                  child: const Icon(
                    Icons.bookmark,
                    color: Color(0xff008080),
                    size: 30,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: const BoxDecoration(
                  color: Color(0xff008080),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                height: 50.0,
                child: const Center(
                  child: Text(
                    'Apply Now',
                    style: TextStyle(
                      color: kWhite,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
