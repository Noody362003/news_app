import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/screens/catigories/models/news_model.dart';
import 'package:news/screens/catigories/wedgits/sources_wedgit.dart';

import '../../api/api_services.dart';
import 'models/sources_model.dart';
import 'news_card.dart';

class CategoryDetailsView extends StatefulWidget {
  CategoryDetailsView({super.key, required this.id});
  final String id;
  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FutureBuilder<SourcesModel>(future: ApiServices.getSources(widget.id), builder: (context,snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }else if(snapshot.hasError){
              return Center(child: Text('error: ${snapshot.error.toString()}'),);
            }
            SourcesModel? sourcesModel=snapshot.data;
            List<Sources> sources=sourcesModel?.sources??[];
            return SourcesWidget( sources: sources);
          }),
        ],
      ),
    );
  }
}
