import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/common/routes_Manager.dart';
import 'package:news/screens/catigories/models/news_model.dart';
import 'package:news/screens/news_details.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';
class NewsCard extends StatelessWidget {
  NewsCard({super.key,required this.article});
  final Articles article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, RoutesManager.articleDetails,arguments: article);
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(tag: article.urlToImage??"",
              child: Image(image: NetworkImage(article.urlToImage??""),height: 232.h,width: double.infinity,fit: BoxFit.contain,)),
              SizedBox(height: 10.h,),
              Text(article.author??"",style: const TextStyle(color: Color(0xFF757575),fontSize: 13),),
              Text(article.title??"",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
              Align(
                alignment: Alignment.centerRight,
                child: Text(timeago.format(DateTime.parse(article.publishedAt??"")),style: const TextStyle(color: Color(0xFF757575),fontSize: 13,),textAlign: TextAlign.end,),
              )
            ],
          ),
        ),
      ),
    );
  }

}
