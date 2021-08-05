import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/models/news/news_data_model/news_api_model.dart';

class NewsItem extends StatelessWidget {
  final Article? article;
  late var width;
  late var height;

   NewsItem({this.article});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(width*0.02),
      height: height*0.57,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: height*0.25,
            width: double.infinity,
            child: Image.network(article!.urlToImage??'https://t3.ftcdn.net/jpg/00/36/94/26/360_F_36942622_9SUXpSuE5JlfxLFKB1jHu5Z07eVIWQ2W.jpg',fit: BoxFit.cover,)),
          Text(article!.title?? 'no title available',maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(
            
            fontSize: 24,fontWeight: FontWeight.bold),),
           Text(article!.description??'no description available',maxLines: 3,overflow: TextOverflow.ellipsis,),

          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Text(article!.publishedAt!)),

        ],
      ),
    );
  }
}