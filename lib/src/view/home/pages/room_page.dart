import 'package:flutter/material.dart';
import 'package:season/src/app/localization/localizations.dart';
import 'package:season/src/app/utils/color.dart';
import 'package:season/src/app/utils/utils_copy.dart';
import 'package:season/src/view/widgets/main_textfield.dart';
import 'package:season/src/view/widgets/text.dart';

class RoomPage extends StatefulWidget {
  RoomPage({super.key, this.data});
  final List<int?>? data;
  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  String? roomtype;
  String? ChildReservation;
  int? ChildCountInRoom;

  int adultsNum = 0;
  int childrenNum = 0;
  int infantsNum = 0;

  @override
  void initState() {
    adultsNum = widget.data?[0] ?? 0;
    childrenNum = widget.data?[1] ?? 0;
    infantsNum = widget.data?[2] ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: Appheight / 14,
            color: defultblue,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Room'.trans,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(
                        context, [adultsNum, childrenNum, infantsNum]);
                  },
                  child: Icon(
                    Icons.done,
                    size: 30,
                    color: white,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    await showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        )),
                        builder: (context) {
                          return StatefulBuilder(
                            builder:
                                (BuildContext context, StateSetter setState) {
                              return Padding(
                                padding: const EdgeInsets.all(25),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: 'Room_Type'.trans,
                                      size: 22,
                                      weight: FontWeight.w600,
                                      color: Colors.grey[700],
                                    ),
                                    RadioListTile(
                                      title: CustomText(
                                        text: "Single_Room".trans,
                                        size: 22,
                                      ),
                                      value: "Single_Room".trans,
                                      groupValue: roomtype,
                                      onChanged: (value) {
                                        roomtype = value.toString();
                                        Navigator.pop(context);
                                      },
                                    ),
                                    RadioListTile(
                                      title: CustomText(
                                        text: "Double_Room".trans,
                                        size: 22,
                                      ),
                                      value: "Double_Room".trans,
                                      groupValue: roomtype,
                                      onChanged: (value) {
                                        roomtype = value.toString();
                                        Navigator.pop(context);
                                      },
                                    ),
                                    RadioListTile(
                                      title: CustomText(
                                        text: "Triple_Room".trans,
                                        size: 22,
                                      ),
                                      value: "Triple_Room".trans,
                                      groupValue: roomtype,
                                      onChanged: (value) {
                                        roomtype = value.toString();
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        });
                    setState(() {});
                  },
                  child: MainTextField(
                    enable: false,
                    controller: TextEditingController(text: roomtype ?? ""),
                    prefixIcon: Icon(
                      Icons.hotel_outlined,
                      color: grey,
                    ),
                    hint: 'Room'.trans,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    await showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        )),
                        builder: (context) {
                          return StatefulBuilder(
                            builder:
                                (BuildContext context, StateSetter setState) {
                              return Padding(
                                padding: const EdgeInsets.all(25),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: 'Child_Reservation'.trans,
                                      size: 22,
                                      weight: FontWeight.w600,
                                      color: Colors.grey[700],
                                    ),
                                    RadioListTile(
                                      title: CustomText(
                                        text: "Child_without_Bed".trans,
                                        size: 22,
                                      ),
                                      value: "Child_without_Bed".trans,
                                      groupValue: ChildReservation,
                                      onChanged: (value) {
                                        ChildReservation = value.toString();
                                        Navigator.pop(context);
                                      },
                                    ),
                                    RadioListTile(
                                      title: CustomText(
                                        text: "Child_with_Bed".trans,
                                        size: 22,
                                      ),
                                      value: "Child_with_Bed".trans,
                                      groupValue: ChildReservation,
                                      onChanged: (value) {
                                        ChildReservation = value.toString();
                                        Navigator.pop(context);
                                      },
                                    ),
                                    RadioListTile(
                                      title: CustomText(
                                        text: "None".trans,
                                        size: 22,
                                      ),
                                      value: "None".trans,
                                      groupValue: ChildReservation,
                                      onChanged: (value) {
                                        ChildReservation = value.toString();
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        });
                    setState(() {});
                  },
                  child: MainTextField(
                    enable: false,
                    controller:
                        TextEditingController(text: ChildReservation ?? ""),
                    prefixIcon: Icon(
                      Icons.hotel_outlined,
                      color: grey,
                    ),
                    hint: 'Child_Reservation'.trans,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MainTextField(
                  enable: false,
                  keyboardType: TextInputType.number,
                  controller:
                      TextEditingController(text: ChildReservation ?? ""),
                  prefixIcon: Icon(
                    Icons.hotel_outlined,
                    color: grey,
                  ),
                  hint: 'Child_Count_In_Room'.trans,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
