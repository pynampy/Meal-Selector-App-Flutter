import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const route = '/filters-screen';

  final Function saveFilters;
  final Map<String,bool> currentFilters;

  FilterScreen(this.saveFilters,this.currentFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  
  initState(){

   _glutenFree = widget.currentFilters['gluten'];
   _vegetarian = widget.currentFilters['vegetarian'];
   _vegan = widget.currentFilters['vegan'];
   _lactoseFree = widget.currentFilters['lactose'];


    super.initState();

  }

  Widget _buildSwitchListTile(
    
  String title,
   String description,
    bool currentValue,
    Function updateValue,
    ){

        return SwitchListTile(
              title: Text(title),
              value: currentValue,
              subtitle: Text(description),
              onChanged: updateValue,
              );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filters"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.save ),
          onPressed: () {  
            
            final selectedFilters =  {
    
           'gluten': _glutenFree,
    'vegan': _vegan,
    'vegetarian': _vegetarian,
    'lactose': _lactoseFree,

  };
            
             widget.saveFilters(selectedFilters);},)
        ,

      ],
      ),
      
      drawer: MainDrawer(),
      body: Column(children: <Widget>[
        Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal Selection',
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            )),
        Expanded(
            child: ListView(children: <Widget>[
          
          _buildSwitchListTile('Gluten-free', 'Choose for gluten-free meals', _glutenFree, 
          (newValue){
            setState(() {
             _glutenFree =  newValue ;
            });
          }
          ),
          _buildSwitchListTile('Vegetarian', 'Choose for Vegetarian meals', _vegetarian, (newValue){
            setState(() {
             _vegetarian=  newValue ;
            });
          }),
          _buildSwitchListTile('Vegan', 'Choose for vegan meals', _vegan, (newValue){
            setState(() {
             _vegan =  newValue ;
            });
          }),
          _buildSwitchListTile('Lactose Free', 'Choose for Lactose-free meals', _lactoseFree, (newValue){
            setState(() {
             _lactoseFree =  newValue ;
            });
          }),

                
        ]))
      ]),
    );
  }
}
