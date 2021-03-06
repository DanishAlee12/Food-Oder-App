import 'package:flutter/material.dart';
import 'package:food_oder/src/admin/pages/add_food_item.dart';
import 'package:food_oder/src/scoped-model/food_model.dart';
import 'package:http/http.dart';
import '../scoped-model/main_model.dart';
import '../scoped-model/food_model.dart';

//pages 
import '../pages/home_page.dart';
import '../pages/oder_page.dart';
import '../pages/profile_page.dart';
import '../pages/explore_page.dart';

class MainScreen extends StatefulWidget {

   final MainModel model;

  MainScreen({this.model});
  
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int currentTabIndex = 0;

  List<Widget> pages;
  Widget currentPage;

  HomePage homePage;
  OderPage oderPage;
  FavoritePage favoritePage;
  ProfilePage profilePage; 

  @override
  void initState() {
      // call the fetch method on food
   //  widget.foodModel.fetchFoods();
    //  widget.model.fetchFoods();

    // TODO: implement initState
  
    homePage = HomePage();
    oderPage = OderPage();
    favoritePage = FavoritePage();
    profilePage = ProfilePage();

    pages = [homePage,favoritePage,oderPage,profilePage];
  
    currentPage = homePage;
  super.initState();
    
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              ListTile(
                onTap: (){
                  Navigator.of(context).pop(); 
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) => AddFoodItem())
                  );
                },
                leading: Icon(Icons.list),
                title: Text("Add Food Items",style: TextStyle(fontSize: 16.0),),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index){
            setState(() {
              currentTabIndex = index;
              currentPage = pages[index];
            });
          },
          currentIndex: currentTabIndex,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home")
              ),

              BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              title: Text("Explore")
              ),

              BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text("Oders")
              ),

              BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile")
              ),
          ],
        ),
        body: currentPage,

      ),
    );
  }
}