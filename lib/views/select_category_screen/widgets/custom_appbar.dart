import 'package:flutter/material.dart';

import '../../../constants.dart';

Widget customAppBarBuilder(bool? withSearch, height, width,name,onPressed) {
  return AppBar(
  title:   Text(
            name,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
  shape: ContinuousRectangleBorder(
      borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(width * 0.12),
            bottomRight: Radius.circular(width * 0.12),
          ),
  ),
  actions: [
    withSearch!
              ? IconButton(
                  onPressed: onPressed,
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 34,
                  ))
              : SizedBox(),
  ],
);
}


