import 'package:flutter/material.dart';
import 'package:news/api/api_services.dart';
import 'package:news/screens/catigories/models/news_model.dart';

import '../news_card.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key, required this.sourceId});
  final String sourceId;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
      FutureBuilder<NewsModel>(
      future: ApiServices.getNews(sourceId),
      builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
      child: CircularProgressIndicator(),
      );
      } else if (snapshot.hasError) {
      return Center(
      child: Text('Error: ${snapshot.error.toString()}'),
      );
      }
      
      NewsModel? newsModel = snapshot.data;
      var newsList = newsModel?.articles ?? [];
      
      return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => NewsCard(article: newsList[index]),
      itemCount: newsList.length,
      );
      },
      ),
        ],
      ),
    );
  }
}
