import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:food_oder/Widgets/button.dart';
import 'package:food_oder/src/models/food_model.dart';
import 'package:food_oder/src/scoped-model/main_model.dart';
import 'package:scoped_model/scoped_model.dart';

class AddFoodItem extends StatefulWidget {
  AddFoodItem({Key key}) : super(key: key);
  @override
  _AddFoodItemState createState() => _AddFoodItemState();
}

class _AddFoodItemState extends State<AddFoodItem> {

  String title;
  String category;
  String description;
  String price;
  String discount; 

  GlobalKey<FormState> _foodItemFormKey = GlobalKey();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
          body: SingleChildScrollView(
              child: Container(
              padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
            //  width: MediaQuery.of(context).size.width,
            //  height: MediaQuery.of(context).size.height,
              child: Form(
                key: _foodItemFormKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 15.0),
                      width: MediaQuery.of(context).size.width,
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage("assets/images/no_image.png"),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                    _buildTextFormField("Food Title"),
                    _buildTextFormField("Category"),
                    _buildTextFormField("Description",maxlines: 2),
                    _buildTextFormField("Price"),
                    _buildTextFormField("Discount"),
                    SizedBox(height: 40,),

                    ScopedModelDescendant(
                      builder:(BuildContext context, Widget child , MainModel model){
                        return GestureDetector(
                          onTap: (){
                          onSubmit(model.addFood);
                          if(model.isloading){
                            showLoadingIndicator();
                          }
                        },
                        child: CustomButton(btnTxt: "Add Food Item"),
                      );
                    }
                    )

                  ]
                )
              ),
            ),
          ),
        ),
      
    );
  }

  void onSubmit(Function addFood) async{
      if(_foodItemFormKey.currentState.validate()){
        _foodItemFormKey.currentState.save();

          final Food food = Food(
          name: title,
          category: category,
          description: description,
          price: double.parse(price),
          discount: double.parse(discount),
        );
       bool value = await addFood(food);
       if(value){
         Navigator.of(context).pop();
         SnackBar snackBar = SnackBar(
           content: Text("Food item successfully added")
          );
          _scaffoldKey.currentState.showSnackBar(snackBar);
       }
       else if(!value){
         Navigator.of(context).pop();
         SnackBar snackBar = SnackBar(
           content: Text("Failed to add food item")
          );
          _scaffoldKey.currentState.showSnackBar(snackBar);
       }
      }
  }

  Future<Void> showLoadingIndicator(){
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return AlertDialog(
          content: Row(
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(width: 10.0,),
              Text("Adding Food Item ...")
            ],
          ),
        );
      }
    );
  }

  Widget _buildTextFormField(String hintTxt,{int maxlines=1}){
   return TextFormField(
      decoration: InputDecoration(hintText: "$hintTxt",),
      maxLines: maxlines,
      keyboardType: hintTxt == "Price" || hintTxt == "Discount" ? TextInputType.number : TextInputType.text,
      validator: (String value){

        if(value.isEmpty && hintTxt =="Food Title"){
           return "The Food title is required";
        }
        if(value.isEmpty && hintTxt =="Category"){
           return "The Category is required";
        }
        if(value.isEmpty && hintTxt =="Description"){
           return "The Description is required";
        }
        if(value.isEmpty && hintTxt =="Price"){
           return "The Price is required";
        }
      },
      onChanged: (String value){
        if(hintTxt == "Food Title"){
          title = value;
        }
        if(hintTxt == "Category"){
          category = value;
        }
        if(hintTxt == "Description"){
          description = value;
        }
        if(hintTxt == "Price"){
          price = value;
        }
        if(hintTxt == "Discount"){
          discount = value;
        }
        
      },
    );
  }
}