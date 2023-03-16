import 'package:dashboard/config/palette.dart';
import 'package:dashboard/config/styles.dart';
import 'package:dashboard/data/data.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _country = "CN";

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const CustomAppBar(),
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _builderHeader(screenHeight),
          _buildPreventionTips(screenHeight),
          _buildYourOwnTest(screenHeight),
        ],
      ),
    );
  }

  SliverToBoxAdapter _builderHeader(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            color: Palette.primaryColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'MEDLAB-365',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white),
                ),
                CountryDropDown(
                    countries: const [
                      'CN',
                      'USA',
                      'KNY',
                      'FRA',
                      'EGT',
                      'JMC',
                      'ANG',
                      'KOR'
                    ],
                    country: _country,
                    onChanged: (val) {
                      if (val != null) {
                        setState(() {
                          _country = val;
                        });
                      }
                    })
              ],
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Are you feeling sick?',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        color: Colors.white)),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                const Text(
                    'If you feel sick with COVID-19 symptoms, '
                    'please call or text us immediately',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.white70)),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                        onPressed: () {},
                        style: const ButtonStyle(
                            padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20)),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.red),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30),
                                        topLeft: Radius.circular(30),
                                        bottomRight: Radius.circular(30),
                                        bottomLeft: Radius.circular(30))))),
                        icon: const Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Call Now',
                          style: Styles.buttonTextStyle,
                        )),
                    ElevatedButton.icon(
                        onPressed: () {},
                        style: const ButtonStyle(
                            padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20)),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.blue),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30),
                                        topLeft: Radius.circular(30),
                                        bottomRight: Radius.circular(30),
                                        bottomLeft: Radius.circular(30))))),
                        icon: const Icon(
                          Icons.message,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Send SMS',
                          style: Styles.buttonTextStyle,
                        ))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildPreventionTips(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Prevention Tips',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: prevention
                  .map((e) => Expanded(
                        child: Column(
                          children: [
                            Image.asset(
                              e.keys.first,
                              height: screenHeight * 0.12,
                            ),
                            SizedBox(
                              height: screenHeight * 0.015,
                            ),
                            Text(
                              e.values.first,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildYourOwnTest(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        padding: const EdgeInsets.all(10),
        height: screenHeight * 0.15,
        decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xFFAD9FE4), Palette.primaryColor]),
        borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('lib/assets/images/test.jpg'),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const Text('Do your own test',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: screenHeight * 0.01,),
                const Text('Follow the instructions\nto do your own test',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  maxLines: 2,
                )
              ],
            )
          ],
        ),
      ),
    );

  }
}
