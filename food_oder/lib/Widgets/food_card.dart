import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {

 final String categoryName;
 final String imagePath;
 final int numberOfItems;

  FoodCard({this.categoryName, this.imagePath, this.numberOfItems});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        margin: EdgeInsets.only(right: 20.0),   
        child: Card(
          color: Colors.grey[200],
          elevation: 4.0,
          child : Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0 , vertical: 10.5),
              child: Row(
                children: <Widget>[
                 
                  Image(
                    image: AssetImage(imagePath),
                    height: 65.0,
                    width: 65.0,
                    
                  ),
                  SizedBox(width: 20.0,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(categoryName, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0),),
                      Text("$numberOfItems Kinds")

                    ],
                  )
                ],
                
              ),
          )
        ),
      ),
    );
  }
}