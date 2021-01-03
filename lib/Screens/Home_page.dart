import 'dart:html';

import 'package:ecommerce/Tabs/Saved_tab.dart';
import 'package:ecommerce/Tabs/Search_tab.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce/Widgets/bottom_tabs.dart';
import 'package:ecommerce/Widgets/Home_tab.dart';


class Home_page extends StatefulWidget {
  @override
  _Home_pageState createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  PageController _tabsPageController;
  int _selectedTab = 0;
  @override
  void initState() {
    _tabsPageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabsPageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: PageView(
              controller: _tabsPageController,
              onPageChanged: (num) {
                setState(() {
                  _selectedTab = num;
                });
              },
              children: [
                Home_page(),
                Search_tab(),
                Saved_tab(),


              ],
            )
          ),
          Container(
            bottom_tabs(selectedTab: _selectedTab,
               tabPressed: (num) {
             _tabsPageController.animateToPage(
                   num,
                duration: Duration(milliseconds: 300),
              curve: Curves.easeOutCubic);
               },
             ),),

          )
        ],
      )
    );
  }
}
