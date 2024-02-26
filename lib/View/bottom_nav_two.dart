import 'package:buildbind/View/Search/search_contractor.dart';
import 'package:buildbind/View/Settings/profile_settings.dart';
import 'package:buildbind/View/home/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sizer/sizer.dart';

import '../Utills/AppColors.dart';
import 'Favourite/favourite_screen.dart';
import 'Listing/listing_project.dart';

class BottomNavigation2 extends StatefulWidget {
  const BottomNavigation2({super.key});

  @override
  State<BottomNavigation2> createState() => _BottomNavigation2State();
}


class _BottomNavigation2State extends State<BottomNavigation2> {

  int _selectedTab = 0;

  List _pages = [
    Dashboard(),
    FavouriteScreen(),
    SearchContractor(),
    ListingProject(),
    ProfileSetings(),
  ];

  _changeTab(int index) async {
    setState(() {
      _selectedTab = index;
    });
  }

  int length = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 1,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: _pages[_selectedTab],
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5.w),
              topRight: Radius.circular(5.w),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home,
                    color: _selectedTab == 0 ? APPCOLORS.SECONDARY : Colors.black),
                onPressed: () {
                  _changeTab(0);
                },
              ),
              IconButton(
                icon: Icon(Icons.favorite,
                    color: _selectedTab == 1 ? APPCOLORS.SECONDARY : Colors.black),
                onPressed: () {
                  _changeTab(1);
                },
              ),
              SizedBox(width: 40.0),
              IconButton(
                icon: Icon(Icons.search,
                    color: _selectedTab == 2 ? APPCOLORS.SECONDARY : Colors.black),
                onPressed: () {
                  _changeTab(2);
                },
              ),
              IconButton(
                icon: Icon(Icons.menu,
                    color: _selectedTab == 4 ? APPCOLORS.SECONDARY : Colors.black),
                onPressed: () {
                  _changeTab(4);
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: APPCOLORS.PRIMARY,
        child: Icon(Icons.add,color: APPCOLORS.WHITE,),
        onPressed: () {
          _changeTab(3);
        },
      ),
    );
  }
}

