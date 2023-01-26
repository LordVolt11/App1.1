// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homepage/src/NavigationPages/homePage/Model/aqiModel.dart';
import 'package:homepage/src/NavigationPages/homePage/Model/weatherModel.dart';
import 'package:homepage/src/NavigationPages/homePage/Service/api_client.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiClient client = ApiClient();
  Weather? dataWeather;
  var dataAqi;
  String aqi = '';

  void getData() {
    Timer.periodic(Duration(seconds: 1), (timer){
      setState(() async {
        aqi = await client.getCurrentAqi('50', '50');
        dataWeather = await client.getCurrentWeather('50', '50');
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(top: 30, left: 20, right: 5),
                          child: TextField(
                            onChanged: (value) {},
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            textInputAction: TextInputAction.search,
                            onSubmitted: (value) {},
                            decoration: InputDecoration(
                              suffix: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                              hintStyle: TextStyle(color: Colors.black),
                              hintText: 'Search'.toUpperCase(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/emoji.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 120,
                  ),
                  SizedBox(
                    height: 10,
                    width: 10,
                    child: OverflowBox(
                      minWidth: 0.0,
                      maxWidth: MediaQuery.of(context).size.width,
                      minHeight: 0.0,
                      maxHeight: MediaQuery.of(context).size.height / 4,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            width: double.infinity,
                            height: double.infinity,
                            child: Card(
                              color: Colors.white,
                              borderOnForeground: true,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 10, left: 30, right: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Center(
                                          child: Text(
                                            'Delhi, India',
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                  color: Colors.black45,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'flutterfonts',
                                                ),
                                          ),
                                        ),
                                        Center(
                                          child: Text(
                                            DateFormat()
                                                .add_MMMMEEEEd()
                                                .format(DateTime.now()),
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                  color: Colors.black45,
                                                  fontSize: 14,
                                                  fontFamily: 'flutterfonts',
                                                ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(left: 30),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/gauge.png'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                        ),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              'Severe',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .copyWith(
                                                    color: Colors.black45,
                                                    fontSize: 22,
                                                    fontFamily: 'flutterfonts',
                                                  ),
                                            ),
                                            Text(
                                              aqi ??
                                                  'Null',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .copyWith(
                                                    color: Colors.black45,
                                                    fontSize: 35,
                                                    fontFamily: 'flutterfonts',
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(right: 40),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            Container(
                                              child: Text(
                                                'Primary',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .copyWith(
                                                      color: Colors.black45,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          'flutterfonts',
                                                    ),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                'P1: ',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .copyWith(
                                                      color: Colors.black45,
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'Flutterfonts',
                                                    ),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                'P2: ',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .copyWith(
                                                      color: Colors.black45,
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'Flutterfonts',
                                                    ),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                'P3: ',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .copyWith(
                                                      color: Colors.black45,
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'Flutterfonts',
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    padding: EdgeInsets.only(top: 120, bottom: 150),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              'Future Prediction'.toUpperCase(),
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        fontSize: 22,
                                        fontFamily: 'Flutterfonts',
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                          ),
                          Container(
                            height: 150,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) =>
                                  VerticalDivider(
                                color: Colors.transparent,
                                width: 5,
                              ),
                              itemCount: 5,
                              // itemCount: controller.dataList.length,
                              itemBuilder: (context, index) {
                                // CurrentAqiData data;
                                // (controller.dataList.length > 0)
                                //     ? data = controller.dataList[index]
                                //     : data = null;
                                return FuturePrediction(
                                  text1: 'data1',
                                  text2: 'data2',
                                  text3: 'data3',
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// class Content extends StatelessWidget {
//   Aqi? dataAqi;
//   Weather? dataWeather;
//   Content({
//     Key? key,
//     this.dataAqi,
//     this.dataWeather,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           Container(
//             child: Column(
//               children: <Widget>[
//                 Row(
//                   children: <Widget>[
//                     Expanded(
//                       child: Container(
//                         padding: EdgeInsets.only(top: 30, left: 20, right: 5),
//                         child: TextField(
//                           onChanged: (value) {},
//                           style: TextStyle(
//                             color: Colors.black,
//                           ),
//                           textInputAction: TextInputAction.search,
//                           onSubmitted: (value) {},
//                           decoration: InputDecoration(
//                             suffix: Icon(
//                               Icons.search,
//                               color: Colors.black,
//                             ),
//                             hintStyle: TextStyle(color: Colors.black),
//                             hintText: 'Search'.toUpperCase(),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                               borderSide: BorderSide(color: Colors.black),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                               borderSide: BorderSide(color: Colors.black),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                               borderSide: BorderSide(color: Colors.black),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Column(
//                       children: [
//                         SizedBox(
//                           height: 30,
//                         ),
//                         Container(
//                           width: 65,
//                           height: 65,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: AssetImage('assets/images/emoji.jpg'),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 120,
//                 ),
//                 SizedBox(
//                   height: 10,
//                   width: 10,
//                   child: OverflowBox(
//                     minWidth: 0.0,
//                     maxWidth: MediaQuery.of(context).size.width,
//                     minHeight: 0.0,
//                     maxHeight: MediaQuery.of(context).size.height / 4,
//                     child: Stack(
//                       children: <Widget>[
//                         Container(
//                           padding: EdgeInsets.symmetric(horizontal: 15),
//                           width: double.infinity,
//                           height: double.infinity,
//                           child: Card(
//                             color: Colors.white,
//                             borderOnForeground: true,
//                             elevation: 5,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(25),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(
//                                   padding: EdgeInsets.only(
//                                       top: 10, left: 30, right: 20),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: <Widget>[
//                                       Center(
//                                         child: Text(
//                                           'Delhi, India',
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .caption!
//                                               .copyWith(
//                                                 color: Colors.black45,
//                                                 fontSize: 24,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontFamily: 'flutterfonts',
//                                               ),
//                                         ),
//                                       ),
//                                       Center(
//                                         child: Text(
//                                           DateFormat()
//                                               .add_MMMMEEEEd()
//                                               .format(DateTime.now()),
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .caption!
//                                               .copyWith(
//                                                 color: Colors.black45,
//                                                 fontSize: 14,
//                                                 fontFamily: 'flutterfonts',
//                                               ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 Divider(),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: <Widget>[
//                                     Container(
//                                       padding: EdgeInsets.only(left: 30),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: <Widget>[
//                                           Container(
//                                             width: 100,
//                                             height: 100,
//                                             decoration: BoxDecoration(
//                                               image: DecorationImage(
//                                                 image: AssetImage(
//                                                     'assets/images/gauge.png'),
//                                                 fit: BoxFit.cover,
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Container(
//                                       padding: EdgeInsets.only(
//                                         left: 20,
//                                         right: 20,
//                                       ),
//                                       child: Column(
//                                         children: <Widget>[
//                                           Text(
//                                             'Severe',
//                                             style: Theme.of(context)
//                                                 .textTheme
//                                                 .caption!
//                                                 .copyWith(
//                                                   color: Colors.black45,
//                                                   fontSize: 22,
//                                                   fontFamily: 'flutterfonts',
//                                                 ),
//                                           ),
//                                           Text(
//                                             '370',
//                                             style: Theme.of(context)
//                                                 .textTheme
//                                                 .caption!
//                                                 .copyWith(
//                                                   color: Colors.black45,
//                                                   fontSize: 35,
//                                                   fontFamily: 'flutterfonts',
//                                                 ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Container(
//                                       padding: EdgeInsets.only(right: 40),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.end,
//                                         children: <Widget>[
//                                           Container(
//                                             child: Text(
//                                               'Primary',
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .caption!
//                                                   .copyWith(
//                                                     color: Colors.black45,
//                                                     fontSize: 14,
//                                                     fontWeight: FontWeight.bold,
//                                                     fontFamily: 'flutterfonts',
//                                                   ),
//                                             ),
//                                           ),
//                                           Container(
//                                             child: Text(
//                                               'P1: ',
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .caption!
//                                                   .copyWith(
//                                                     color: Colors.black45,
//                                                     fontSize: 14,
//                                                     fontFamily: 'Flutterfonts',
//                                                   ),
//                                             ),
//                                           ),
//                                           Container(
//                                             child: Text(
//                                               'P2: ',
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .caption!
//                                                   .copyWith(
//                                                     color: Colors.black45,
//                                                     fontSize: 14,
//                                                     fontFamily: 'Flutterfonts',
//                                                   ),
//                                             ),
//                                           ),
//                                           Container(
//                                             child: Text(
//                                               'P3: ',
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .caption!
//                                                   .copyWith(
//                                                     color: Colors.black45,
//                                                     fontSize: 14,
//                                                     fontFamily: 'Flutterfonts',
//                                                   ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     )
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Stack(
//             children: <Widget>[
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 15),
//                 child: Container(
//                   padding: EdgeInsets.only(top: 120, bottom: 150),
//                   child: Align(
//                     alignment: Alignment.topLeft,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Container(
//                           child: Text(
//                             'Future Prediction'.toUpperCase(),
//                             style:
//                                 Theme.of(context).textTheme.caption!.copyWith(
//                                       fontSize: 22,
//                                       fontFamily: 'Flutterfonts',
//                                       color: Colors.black45,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                           ),
//                         ),
//                         Container(
//                           height: 150,
//                           child: ListView.separated(
//                             scrollDirection: Axis.horizontal,
//                             separatorBuilder: (context, index) =>
//                                 VerticalDivider(
//                               color: Colors.transparent,
//                               width: 5,
//                             ),
//                             itemCount: 5,
//                             // itemCount: controller.dataList.length,
//                             itemBuilder: (context, index) {
//                               // CurrentAqiData data;
//                               // (controller.dataList.length > 0)
//                               //     ? data = controller.dataList[index]
//                               //     : data = null;
//                               return FuturePrediction(
//                                 text1: 'data1',
//                                 text2: 'data2',
//                                 text3: 'data3',
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

class FuturePrediction extends StatelessWidget {
  const FuturePrediction({
    Key? key,
    required this.text1,
    required this.text2,
    required this.text3,
  }) : super(key: key);

  final String text1, text2, text3;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 150,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${text1}',
                style: Theme.of(context).textTheme.caption!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                      fontFamily: 'flutterfonts',
                    ),
              ),
              Text(
                '${text2}',
                style: Theme.of(context).textTheme.caption!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                      fontFamily: 'flutterfonts',
                    ),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/gauge.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                '${text3}',
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.black45,
                      fontFamily: 'flutterfonts',
                      fontSize: 14,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
