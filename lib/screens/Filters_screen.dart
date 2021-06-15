import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String,bool> currentFilters;

  FiltersScreen({this.saveFilters,this.currentFilters});

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
var _glutenFree = false;
var _vegan = false;
var _vegetarian = false;
var _lactoseFree = false;

@override
initState(){
  _glutenFree=widget.currentFilters['gluten'];
  _lactoseFree=widget.currentFilters['lactose'];
  _vegan=widget.currentFilters['vegan'];
  _vegetarian=widget.currentFilters['vegetarian'];
  super.initState();
}

Widget _buildSwitchListTile (
  String title,
  String description,
  bool currentValue,
  Function updateValue,

){
  return SwitchListTile(
                    title: Text(title),
                    subtitle: Text(description),
                    value: currentValue, 
                    onChanged:  updateValue,
                  
                  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Filters'),
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.save),
            onPressed: (){

              final selectedFilters = {
    'gluten': _glutenFree,
    'vegan': _vegan,
    'vegetarian': _vegetarian,
    'lactose': _lactoseFree,
  };
              widget.saveFilters(selectedFilters);
              },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Set Your Food Filtering Options Below:'),
            ),
            Expanded(
              child:ListView(
                children: <Widget>[
                  _buildSwitchListTile('GLUTEN-FREE',
                   'Show only Gluten-Free options',
                    _glutenFree,
                     (newValue){
                       setState((){
                       _glutenFree = newValue;
                     });
                     },),
                     _buildSwitchListTile('LACTOSE-FREE',
                   'Show only Lactose-Free options',
                    _lactoseFree,
                     (newValue){
                       setState((){
                       _lactoseFree = newValue;
                     });
                     },),
                     _buildSwitchListTile('VEGAN',
                   'Show only Vegan options',
                    _vegan,
                     (newValue){
                       setState((){
                       _vegan = newValue;
                     });
                     },),
                     _buildSwitchListTile('VEGETARIAN',
                   'Show only Vegetarian options',
                    _vegetarian,
                     (newValue){
                       setState((){
                       _vegetarian = newValue;
                     });
                     },)
                ],
              )
              ),
        ],
      ),
    );
  }
}