import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_oder/Widgets/foodcategory.dart';
import 'package:food_oder/Widgets/home_top_info.dart';
import 'package:food_oder/Widgets/search_field.dart';
import 'package:food_oder/Widgets/bought_foods.dart';
import 'package:food_oder/src/scoped-model/food_model.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped-model/main_model.dart';



//Data
import '../data/food_data.dart';

//Model
import '../models/food_model.dart';

class HomePage extends StatefulWidget {

 // final FoodModel foodModel;

//  HomePage(this.foodModel);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 // List<Food> _foods = foods;

   @override
  void initState() {
 //  widget.foodModel.fetchFoods();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
         children: <Widget>[

           HomeTopInfo(),

           FoodCategory(),

           SizedBox(height: 30.0),
      
           SearchField(),

           SizedBox(height: 25.0),

           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
               Text(
                 "Frequently Bought Foods",
                 style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                 ),
                GestureDetector(
                  onTap: (){},
                  child: Text(
                  "View all",
                  style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.orangeAccent),
                  ),
               )
             ],
           ),

           SizedBox(height: 20.0),

           ScopedModelDescendant<MainModel>(
            builder: (BuildContext context, Widget child, MainModel model){
              return 
              Column(
                children: model.foods.map(_buildFoodItems).toList(),
              );
            },
          ),


        ],
      ),  
      ),    
    );
  }
}

Widget _buildFoodItems(Food food){

  return Container(
    margin: EdgeInsets.only(bottom: 30.0),
    child: BoughtFoods(
      id: food.id,
      name: food.name,
      imagePath: food.imagePath ,
      category: food.category,
      price: food.price,
      discount: food.discount,
      ratings: food.ratings,
    ),
  );
}