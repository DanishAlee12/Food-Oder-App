
import 'dart:convert';

import 'package:food_oder/src/models/food_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class FoodModel extends Model{

  List<Food> _foods = [];

  bool _isLoading = false;

  bool get isloading{
    return _isLoading;
  }

  List<Food> get foods {
    return List.from(_foods);
  }

  Future<bool> addFood(Food food) async{

    _isLoading = true;
    notifyListeners();

    try{

        final Map<String,dynamic> foodData ={
        "title" : food.name,
        "description" : food.description,
        "category" : food.category,
        "price" : food.price,
        "discount" : food.discount,
      };
      final http.Response response = await http.post("https://foodie-d7647.firebaseio.com/foods.json", body: json.encode(foodData));

      final Map<String, dynamic> responseData = json.decode(response.body);

      Food foodWithId = Food(
        id: responseData["name"],
        name: food.name,
        description: food.description,
        category: food.category,
        price: food.price,
        discount: food.discount,
      );

      _foods.add(foodWithId);
      _isLoading = false;
       notifyListeners();
     //   fetchFoods();
       return Future.value(true);

    }catch(e){
      _isLoading = false;
    notifyListeners();
    return Future.value(false);
      print("Connection Error $e");
    }
  }

  Future<bool>fetchFoods()async{

    _isLoading = true;
    notifyListeners();
    try{

       final http.Response response = await http.get("https://foodie-d7647.firebaseio.com/foods.json");

    
          final Map<String,dynamic> fetchedData = json.decode(response.body);
          print(fetchedData);

          final List<Food> foodItems =[];

          fetchedData.forEach((String id, dynamic foodData){
            Food foodItem = Food(
              id: id,
              name: foodData["title"],
              description: foodData["description"],
              category: foodData["category"],
              price: foodData["price"],
              discount: foodData["discount"],
            );

            foodItems.add(foodItem);
          });

          _foods = foodItems;
          _isLoading = false;
          notifyListeners();
          return Future.value(true);
   

    } catch(error){
        _isLoading = false;
        notifyListeners();
        return Future.value(false);
    }
  }
}