import 'package:flutter/material.dart';
import 'package:franch_hub/config/theme/theme.dart';

class FranchiseDetailPage extends StatelessWidget {
  const FranchiseDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 10),
        child: Column(children: [
          Expanded(
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: CircleAvatar(
                            minRadius: 20,
                            maxRadius: 25,
                            child: Icon(
                              Icons.arrow_back,
                              size: 40,
                            ))),
                    Center(
                        child: Text(
                      'Details',
                      style: FlutterTextTheme.headlineMedium(context),
                    )),
                    IconButton(
                        onPressed: () {},
                        icon: CircleAvatar(
                          minRadius: 20,
                          maxRadius: 25,
                          child: Icon(
                            Icons.more_horiz,
                            size: 40,
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width - 100,
                  decoration: BoxDecoration(

                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(30)),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.adb),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Name...',
                          style: FlutterTextTheme.titleLarge(context),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            width: 2,
                          )),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                          ),
                          Text('4.9')
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Franchise Overview',
                        style: FlutterTextTheme.headlineMedium(context),
                      ),
                      Text(
                        'This HorseHub UI design brings a seamless experience for horse lovers! Whether youre buying, selling, or learning to ride, everything is organized, sleek, and easy to navigate.'+
                            'This HorseHub UI design brings a seamless experience for horse lovers! '
                                'Whether youre buying, selling, or learning to ride, everything is organized, sleek, and easy to navigate.'+
                            'This HorseHub UI design brings a seamless experience for horse lovers!'
                                ' Whether youre buying, selling, or learning to ride, everything is organized, sleek, and easy to navigate.'
                                'This HorseHub UI design brings a seamless experience for horse lovers! '
                                'Whether youre buying, selling, or learning to ride, everything is organized, sleek, and easy to navigate.'
                        ,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Icon(
                    Icons.message,
                    size: 40,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(fixedSize: WidgetStatePropertyAll(Size(double.infinity,60) )),
                      onPressed: () {},
                      child: Text(
                        'Respond Now',
                        style: FlutterTextTheme.titleLarge(context),
                      )),
                )
              ],
            ),
          )
        ]),
      )),
    );
  }
}
