import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/screens/catigories/models/news_model.dart';

import 'news_card.dart';

class CategoryDetailsView extends StatefulWidget {
  CategoryDetailsView({super.key, required this.id});
  final String id;
  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  int selectedCatId=0;
  List<NewsModel> newsList=List.generate(10, (index) => NewsModel(id: index.toString(), title: "Why are football's biggest clubs starting a new tournament?", company: 'BBC', imgPath: 'assets/NewsTest.png', publishDate: DateTime.now()));
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60.h,
          child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                    child: ChoiceChip(
                      onSelected: (value){
                        selectedCatId=index;
                        setState(() {
                        });
                      },
                        label: Text('xx$index'),
                        selected: index == selectedCatId,
                      showCheckmark: false,
                      labelStyle: TextStyle(color: index==selectedCatId? Colors.white:Colors.green),
                      selectedColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.r),
                        side: const BorderSide(color: Colors.green)
                      ),
                    ),
                  ),
          ),
        ),
        Expanded(child: ListView.builder(itemBuilder: (context,index)=>NewsCard(newsModel: newsList[index]),itemCount: newsList.length,))
      ],
    );
  }
}
