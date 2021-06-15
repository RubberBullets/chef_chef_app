import '../screens/favourites_screen.dart';
import 'package:flutter/material.dart';

import './categories_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

//Tabs at the top can simply be used within a StateLess Widget, however,
//tabs at the bottom will be done in a statefull widget.

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  TabsScreen({this.favouriteMeals});

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavouritesScreen(widget.favouriteMeals),
        'title': 'Your Favourites'
      },
    ];
    super.initState();
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   length: 2,
    //   child:
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
        // bottom: TabBar(
        //   onTap: null,
        //   tabs: <Widget>[
        //     Tab(
        //       icon: Icon(Icons.category),
        //       text: 'CATEGORIES',
        //       iconMargin: EdgeInsets.all(10),
        //     ),
        //     Tab(
        //       icon: Icon(Icons.star),
        //       text: 'FAVOURITES',
        //       iconMargin: EdgeInsets.all(10),
        //     ),
        //   ],),
      ),
      body: _pages[_selectedPageIndex]['page'],
      //  TabBarView(
      //   children: <Widget>[
      //     CategoriesScreen(), FavouritesScreen()
      // ],),
      //  ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedPageIndex,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        onTap: _selectedPage,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text('Categories:'),
            icon: Icon(
              Icons.category,
              //color: Colors.grey[700],
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text('Favourites:'),
            icon: Icon(
              Icons.star,
              //color: Colors.grey[700],
            ),
          ),
        ],
        // BottomAppBar(child:Text('haha'))
      ),
    );
  }
}
