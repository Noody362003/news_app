import 'package:flutter/material.dart';
import 'package:news/common/assets_manage.dart';
import 'package:news/common/colors.dart';
import '../../common/theme.dart';
import 'category_model.dart';
import 'category_wedgit.dart';

class Categories extends StatelessWidget {
  Categories({super.key, required this.selected});
  final Function(String) selected;
  List<CategoryModel> categories = [
    CategoryModel(
        id: '1',
        title: 'Sports',
        color: ColorsManager.sports,
        image: AssetsManager.sports,

    ),
    CategoryModel(
        id: '2',
        title: 'Politics',
        color: ColorsManager.politics,
        image: AssetsManager.politics),
    CategoryModel(
        id: '3',
        title: 'Health',
        color: ColorsManager.health,
        image: AssetsManager.health),
    CategoryModel(
        id: '4',
        title: 'Business',
        color: ColorsManager.bussines,
        image: AssetsManager.bussines),
    CategoryModel(
        id: '5',
        title: 'Environment',
        color: ColorsManager.environment,
        image: AssetsManager.environment),
    CategoryModel(
        id: '6',
        title: 'Science',
        color: ColorsManager.science,
        image: AssetsManager.science),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetsManager.pattern), fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pick your category\nof interest',
              style: Style.homeText,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: GridView.builder(
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisExtent: 171,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      maxCrossAxisExtent: 148),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: ()=>selected(categories[index].id),
                      child: CategoryWidget(
                        index: index,
                        categoryModel: categories[index],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
