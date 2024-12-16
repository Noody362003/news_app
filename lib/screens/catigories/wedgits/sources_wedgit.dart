import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/screens/catigories/models/sources_model.dart';


class SourcesWidget extends StatefulWidget {
  SourcesWidget({super.key,required this.changeSelectedSource,required this.sources});
  final List<Sources> sources;
  final void Function(String) changeSelectedSource;
  @override
  State<SourcesWidget> createState() => _SourcesWidgetState();
}

class _SourcesWidgetState extends State<SourcesWidget> {
  String? selectedCatId;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: ListView.builder(
        itemCount: widget.sources.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
              child: ChoiceChip(
                onSelected: (value){
                  selectedCatId=widget.sources[index].id;
                  setState(() {
                  });
                },
                label: Text(widget.sources[index].name??''),
                selected: widget.sources[index].id == selectedCatId,
                showCheckmark: false,
                labelStyle: TextStyle(
                    color: widget.sources[index].id == selectedCatId? Colors.white:Colors.green),
                selectedColor: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.r),
                    side: const BorderSide(color: Colors.green)
                ),
              ),
            ),
      ),
    ) ;
  }

}
