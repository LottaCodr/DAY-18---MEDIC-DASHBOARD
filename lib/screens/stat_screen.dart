import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:dashboard/config/palette.dart';
import 'package:dashboard/config/styles.dart';
import 'package:dashboard/data/data.dart';
import 'package:dashboard/widgets/widgets.dart';
import 'package:flutter/material.dart';

class StatScreen extends StatefulWidget {
  const StatScreen({Key? key}) : super(key: key);

  @override
  State<StatScreen> createState() => _StatScreenState();
}

class _StatScreenState extends State<StatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          _buildHeader(),
          _buildRegionTabBar(),
          _buildStatsTabBar(),
          SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal:  10,),
                sliver: SliverToBoxAdapter(
                child: StatsGrid(),
              ),
          ),
          SliverPadding(
              padding: const EdgeInsets.only(
                top:  20,),
                sliver: SliverToBoxAdapter(
                child: CasesBarChart(theCases: casesDailyNewCases),
              ),
          ),
        ],
      ),
    );
  }

  SliverPadding _buildHeader() {
    return SliverPadding(
      padding: const EdgeInsets.all(20),
      sliver: SliverToBoxAdapter(
        child: Text(
          'Statistics',
          style: const TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildRegionTabBar() {
    return SliverToBoxAdapter(
      child: DefaultTabController(
          length: 2,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white24, borderRadius: BorderRadius.circular(25)
            ),
            child: TabBar(
              indicator: BubbleTabIndicator(
                tabBarIndicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Colors.white,
                indicatorHeight: 40
              ),
              labelStyle: Styles.tabTextStyle,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              tabs: [
              const Text('My Country'),
              const Text('Global')
            ],
            onTap: (index){},),
          ),
      ),
    );
  }

  SliverPadding _buildStatsTabBar() {
    return SliverPadding(
        padding: const EdgeInsets.all(20),
    sliver: SliverToBoxAdapter(
      child: DefaultTabController(
          length: 3,
          child: TabBar(
              indicatorColor: Colors.transparent,
              labelColor: Colors.white,
              labelStyle: Styles.tabTextStyle,
              unselectedLabelColor: Colors.white60,
              tabs: const [
                Text('Total'),
                Text('Today'),
                Text('Yesterday'),
              ],
            onTap: (index){},
          )
      ),
    ),
    );
  }
}
