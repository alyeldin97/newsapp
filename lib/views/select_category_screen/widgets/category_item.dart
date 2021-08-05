import 'package:flutter/material.dart';
import 'package:news_app/models/category_item/category_item_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryItemModel? categoryItemModel;

  late var width;
  late var height;

  var onTap;
  

  CategoryItem({this.categoryItemModel,this.onTap});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width * 0.25,
        height: height * 0.3,
        decoration: BoxDecoration(
          color: categoryItemModel!.color,
          borderRadius: BorderRadius.only(
            bottomLeft: !categoryItemModel!.isLeft!
                ? Radius.circular(width * 0.05)
                : Radius.circular(0),
            bottomRight: categoryItemModel!.isLeft!
                ? Radius.circular(width * 0.05)
                : Radius.circular(0),
            topLeft: Radius.circular(width * 0.05),
            topRight: Radius.circular(width * 0.05),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: width * 0.36,
        height: height * 0.2,
              child: Image.asset(categoryItemModel!.image)),
            Text(categoryItemModel!.categoryName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
          ],
        ),
      ),
    );
  }
}
