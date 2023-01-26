import 'package:flutter/material.dart';
import 'infoPage.dart';
import 'newsPage.dart';

class resourcesPage extends StatelessWidget {
  const resourcesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: const [
            TabBar(
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                  text: 'News',
                ),
                Tab(
                  text: 'Info',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  newsPage(),
                  infoPage(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
