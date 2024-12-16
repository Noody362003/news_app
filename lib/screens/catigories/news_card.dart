import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/screens/catigories/models/news_model.dart';
import 'package:timeago/timeago.dart' as timeago;
class NewsCard extends StatelessWidget {
  NewsCard({super.key,required this.newsModel});
  NewsModel newsModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(newsModel.imgPath),height: 232.h,width: double.infinity,fit: BoxFit.contain,),
            SizedBox(height: 10.h,),
            Text(newsModel.company,style: const TextStyle(color: Color(0xFF757575),fontSize: 13),),
            Text(newsModel.title,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
            Align(
              alignment: Alignment.centerRight,
              child: Text(timeago.format(newsModel.publishDate),style: const TextStyle(color: Color(0xFF757575),fontSize: 13,),textAlign: TextAlign.end,),
            )
          ],
        ),
      ),
    );
  }
}
