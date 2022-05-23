import 'vertical_dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


enum trackingStatus { loaded, departure, arrived }
class TrackingStatusWidget extends StatelessWidget {
  const TrackingStatusWidget({Key? key, required this.status})
      : super(key: key);
  final trackingStatus status;
  @override
  Widget build(BuildContext context) {
    List<String> message = [];
    int stops = 1;
    if (status == trackingStatus.loaded) {
      stops = 1;
      message.add('Deliverables Loaded');
    } else if (status == trackingStatus.departure) {
      message.add('Deliverables Loaded');
      message.add('Delivery Vehicle Departure');
      stops = 2;
    } else {
      stops = 3;
      message.add('Deliverables Loaded');
      message.add('Delivery Vehicle Departure');
      message.add('Delivery Vehicle Arrived');
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                ),
              ),
            ),
            for (int i = 0; i < stops; i++)
              Column(
                children: [
                  VerticalDottedLine(height: 40),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red.shade400,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 6,
                        width: 6,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                      ),
                    ),
                  ),
                ],
              ),
            VerticalDottedLine(height: 40),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 5.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 5.h,
              width: 75.w,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4)),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: const Text(
                      'Present Address',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            for (int i = 0; i < stops; i++)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message[i],
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  SizedBox(
                    height: i == stops - 1 ? 14 : 37,
                  ),
                ],
              ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 5.h,
              width: 75.w,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4)),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Reciever's Address",
                      style: TextStyle(color: Colors.grey),
                    ),
                  )),
            ),
          ],
        )
      ],
    );
  }
}
