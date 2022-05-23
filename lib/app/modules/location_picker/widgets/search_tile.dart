import 'package:envo_safe/app/data/models/map_models/places_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchTile extends StatelessWidget {
  const SearchTile({Key? key, required this.placesModel, required this.onTap})
      : super(key: key);
  final PlacesModel placesModel;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6.sp),
      child: InkWell(
        onTap: onTap,
        child: PhysicalModel(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.sp),
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.all(6.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  placesModel.name,
                  style: TextStyle(fontSize: 15.sp),
                ),
                Padding(
                  padding: EdgeInsets.only(top: .5.h),
                  child: Text(
                    placesModel.formattedAddress,
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
