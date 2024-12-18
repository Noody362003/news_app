import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

import 'catigories/models/news_model.dart';


class ArticleDetails extends StatelessWidget {
  const ArticleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var article=ModalRoute.of(context)!.settings.arguments as Articles;
    return Scaffold(
      appBar: AppBar(
        title: Text('Article Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
            ),
            SizedBox(height: 20,),
            Text(article.content??"",style: const TextStyle(fontSize: 14,)),
            Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                  onPressed: () async {
                    await _launchUrl(article.url??"");
                  },
                  icon: Icon(Icons.arrow_forward_ios_sharp,),
                  label: Text('View full article',style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400))),
            )
          ],
        ),
      ),
    );
  }
  Future<void> _launchUrl(String url) async {
    Uri url0=Uri.parse(url);
    if (!await launchUrl(url0)) {
      throw Exception('Could not launch $url0');
    }
  }
}
