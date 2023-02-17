import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'place/ui/screens/home_trips.dart';
import 'place/ui/screens/search_trips.dart';
import 'user/ui/screens/profile_trips.dart';

class PlatziTripsCupertino extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.indigo),
                  label: ""
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search, color: Colors.indigo),
                  label: ""
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.indigo),
                  label: ""
              ),
            ]
        ),

        tabBuilder: (BuildContext context, int index) {
          Widget itemTabView = HomeTrips();
          switch (index) {
            case 0:
              itemTabView = HomeTrips();
              break;
            case 1:
              itemTabView = SearchTrips();
              break;
            case 2:
              itemTabView = ProfileTrips();
              break;
          }
          return CupertinoTabView(
            builder: (BuildContext context) => itemTabView,
          );
        },
      ),
    );
  }

}