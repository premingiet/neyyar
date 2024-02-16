import 'package:flutter/material.dart';
import 'package:neyyar/app/common/widgets/button_custom_shrink.dart';

import 'item_custom_category.dart';

class WrapLimited extends StatelessWidget {
  final List<ItemCustomCategory> children;
  final int maxRows;
  final Function(String title) onTap;

  const WrapLimited({
    Key? key,
    required this.children,
    this.maxRows = 1, required this.onTap,
  }) : assert(maxRows > 0, 'maxRows must be greater than 0'), super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate the number of items per row
        int totalItemsCount = children.length;
        // Placeholder for rows of widgets
        List<Widget> rowWidgets = [];
        // Container for the final layout
        List<Widget> layout = [];

        // Determine the number of items that can fit in a single row
        // This is a simplified approach and might need adjustments based on actual child widths
        int itemsPerRow = (totalItemsCount / maxRows).ceil();
        int currentItemCount = 0;

        // Loop to organize children into rows and overflow
        for (var i = 0; i < maxRows && currentItemCount < totalItemsCount; i++) {
          int start = currentItemCount;
          int end = (start + itemsPerRow > totalItemsCount) ? totalItemsCount : start + itemsPerRow;
          rowWidgets.add(
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: children.getRange(start, end).map((e) => ButtonCustomShrink(child: e, onPressed: (){ onTap(e.title); })).toList(),
              ),
            ),
          );
          currentItemCount += itemsPerRow;
        }

        // If there are more items than can fit, add them to a horizontally scrollable area
        if (currentItemCount < totalItemsCount) {
          rowWidgets.add(
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: totalItemsCount - currentItemCount,
                itemBuilder: (context, index) => ButtonCustomShrink(child: children[currentItemCount + index], onPressed: (){ onTap(children[currentItemCount + index].title); },),
              ),
            ),
          );
        }

        // Convert row widgets into a Column for the final layout
        layout = rowWidgets.map((row) => row).toList();

        return Column(
          children: layout,
        );
      },
    );
  }
}
