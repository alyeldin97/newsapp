import 'package:flutter/material.dart';

import 'package:news_app/constants.dart';

class TabItem extends StatelessWidget {
  bool? isSelected=false;
  String? sourceName;
   TabItem({
    this.isSelected=false,
    this.sourceName
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
        color: isSelected!? PRIMARY_COLOR: Colors.white,
        border: Border.all(
          color: PRIMARY_COLOR,
        ),
        
        borderRadius: BorderRadius.circular(130),
      ),
      child: Tab(
        child: Text(
          sourceName!,textAlign: TextAlign.center,
          style: TextStyle(color:isSelected!? Colors.white:PRIMARY_COLOR),
        ),
      ),
    );
  }
}
