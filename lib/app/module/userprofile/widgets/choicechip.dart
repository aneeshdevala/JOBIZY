import 'package:flutter/material.dart';

class ChoiceChipSearch extends StatefulWidget {
  const ChoiceChipSearch({Key? key}) : super(key: key);

  @override
  State<ChoiceChipSearch> createState() => _ChoiceChipSearchState();
}

class _ChoiceChipSearchState extends State<ChoiceChipSearch> {
  var selectedList = 0;

  final taglist = <String>['Saved Jobs', 'Applied Jobs', 'Your Jobs'];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedList = index;
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: selectedList == index
                      ? Theme.of(context).primaryColor.withOpacity(0.2)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: selectedList == index
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).primaryColor.withOpacity(0.2),
                  ),
                ),
                child: Text(
                  taglist[index],
                ),
              ),
            ),
        separatorBuilder: (_, index) => const SizedBox(
              width: 15,
            ),
        itemCount: taglist.length);
  }
}
