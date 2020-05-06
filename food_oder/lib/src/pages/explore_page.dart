
import 'package:flutter/material.dart';
import 'package:food_oder/Widgets/food_item_card.dart';
import 'package:food_oder/Widgets/search_field.dart';
import 'package:food_oder/src/models/food_model.dart';
import 'package:food_oder/src/scoped-model/main_model.dart';
import 'package:scoped_model/scoped_model.dart';

class FavoritePage extends StatefulWidget {

  //final MainModel model;

 // FavoritePage({this.model});


  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {

  /*@override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.model.fetchFoods();

  }*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
     //   child: SingleChildScrollView(
            child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0,),
            child: ScopedModelDescendant<MainModel>(
              child: SearchField(),
              builder: (BuildContext context, Widget child , MainModel model){
                model.fetchFoods();
                List<Food> foods =model.foods;
                    return RefreshIndicator(
                      onRefresh: model.fetchFoods,
                        child: ListView(
                          padding: EdgeInsets.symmetric(horizontal: 4.0),
                        children: foods.map((Food food){
                          return FoodItemCard(
                            food.name,
                            food.description,
                            food.price.toString(),
                          );
                        }).toList(),
                ),
                    );
              }
            )
          ),
   //     ) 
      ),
    );
  }
}