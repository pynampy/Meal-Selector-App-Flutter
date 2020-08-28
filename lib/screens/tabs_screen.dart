import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorite_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  
  final List<Meal> favoriteMeal; 

  TabsScreen(this.favoriteMeal);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  // final List<Map<String, Object>> _pages = [    
  //   {'page': CategoriesScreen(), 'title': 'Categories'},
  //   {'page':FavoritesScreen(), 'title':'Favorites'}
  // ];

  List<Widget> _pages;





  int _selectedPageIndex = 0;

  void _selectPage(int index){

    setState(() {
      _selectedPageIndex = index;
    });

  }


  @override
  void initState() {

    _pages = [    
        CategoriesScreen(), 
        FavoritesScreen(widget.favoriteMeal),
  ];

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final title = _selectedPageIndex==0?'Meals':'Your Favorites';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex],

      bottomNavigationBar: BottomNavigationBar(

          onTap: _selectPage,


        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
            )
            
        ]
      ),
    );
  }
}