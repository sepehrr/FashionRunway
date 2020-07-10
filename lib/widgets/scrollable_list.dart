import 'package:fashion_runway/constants.dart';
import 'package:fashion_runway/models/look_details.dart';
import 'package:fashion_runway/utilities/page_change_notifier.dart';
import 'package:fashion_runway/widgets/scrollable_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScrollableList extends StatelessWidget {
  ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    _scrollController = ScrollController();
    Size size = MediaQuery.of(context).size;
    return Consumer<PageNumberNotifier>(
      builder: (context, notifier, child) {
        if (_scrollController.hasClients)
          _scrollController.animateTo(
            notifier.page * size.height,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
          );
        return Container(
          color: Colors.white,
          height: size.height,
          width: size.width * 2 / 9,
          child: ListView(
            controller: _scrollController,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: lookDetails.map((LookDetail item) {
              return ScrollableListTile(
                lookDetail: item,
                color: kLightBlue,
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
