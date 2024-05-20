import 'package:buildbind/View/Search/search_contractor.dart';
import 'package:buildbind/View/Settings/profile_settings.dart';
import 'package:buildbind/View/home/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sizer/sizer.dart';

import '../Utills/AppColors.dart';
import 'Favourite/favourite_screen.dart';
import 'Listing/listing_project.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}


class _BottomNavigationState extends State<BottomNavigation> {

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
      bottomNavigationBar: WillPopScope(
        onWillPop: () async {
          // Show the quit confirmation dialog
          bool? quitConfirmed = await showDialog<bool>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Quit Confirmation'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text('Are you sure you want to quit?',),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('Yes',
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pop(true); // Close the dialog with 'true'
                    },
                  ),
                  TextButton(
                    child: Text('No',),
                    onPressed: () {
                      Navigator.of(context)
                          .pop(false); // Close the dialog with 'false'
                    },
                  ),
                ],
              );
            },
          );

          // Return true if the user confirmed quitting, otherwise false
          return quitConfirmed ?? false;
        },
        child: BottomAppBar(
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

