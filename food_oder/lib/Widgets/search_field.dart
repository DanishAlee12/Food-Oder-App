import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8.0,
      borderRadius: BorderRadius.circular(30.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search any food",
            contentPadding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 14.0),
            border: InputBorder.none,
            suffixIcon: Material(
              elevation: 8.0,
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.grey[200],
              child: Icon(
              Icons.search,
              color: Colors.black,  
              ),
            ),
          ),
        
        ),
     );
    
  }
}