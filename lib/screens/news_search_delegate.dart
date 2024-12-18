import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/api/api_services.dart';
import 'package:news/screens/catigories/news_card.dart';

import '../common/colors.dart';
import 'catigories/models/news_model.dart';

class NewsSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
        appBarTheme: AppBarTheme(
            color: ColorsManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.r),
                    bottomRight: Radius.circular(50.r))),
            centerTitle: true,
            titleTextStyle: const TextStyle(
                fontWeight: FontWeight.w400, fontSize: 22, color: Colors.white),
            iconTheme: IconThemeData(color: Colors.white, size: 30)),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(
          color: Colors.green, // Hint text color
          fontSize: 16,
        ),
        filled: true,
        fillColor: Colors.white, // Background color of search box
        contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25), // Curved corners
          borderSide: BorderSide.none, // No border lines
        ),
        // Custom right icon
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {
      close(context, null);
    }, icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(future: ApiServices.searchNews(query), builder: (context,snapshot){
      if(snapshot.connectionState==ConnectionState.waiting){
        return const Center(child: CircularProgressIndicator(),);
      }else if(snapshot.hasError){
        return Center(child: Text('error: ${snapshot.error.toString()}'),);
      }
      NewsModel? sourcesModel=snapshot.data;
      List<Articles> articleList=sourcesModel?.articles??[];
      return ListView.builder(itemBuilder: (context,index)=>NewsCard(article: articleList[index]),itemCount: articleList.length,);
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(future: ApiServices.searchNews(query), builder: (context,snapshot){
      if(snapshot.connectionState==ConnectionState.waiting){
        return const Center(child: CircularProgressIndicator(),);
      }else if(snapshot.hasError){
        return Center(child: Text('error: ${snapshot.error.toString()}'),);
      }
      NewsModel? sourcesModel=snapshot.data;
      List<Articles> articleList=sourcesModel?.articles??[];
      return ListView.builder(itemBuilder: (context,index)=>NewsCard(article: articleList[index]),itemCount: articleList.length,);
    });
  }
}
