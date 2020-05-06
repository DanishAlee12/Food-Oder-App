import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  bool trunOnNotification = false;
  bool trunOnTracking = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text("Profile",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32.0),),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow:[
                              BoxShadow(
                                blurRadius: 3.0,
                                offset: Offset(0, 4.0),
                                color: Colors.black38
                              ),
                            ],
                            image: DecorationImage(
                              image: AssetImage("assets/images/chicken_bbq.jpg"),
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                        SizedBox(width: 30,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Danish Ali",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
                            SizedBox(height: 6.0,),
                            Text("+923432649080",style: TextStyle(color: Colors.grey)),
                            SizedBox(height: 15.0,),
                            Container(
                                height: 25.0,
                                width: 50.0,
                                child: Center(
                                  child: Text("Edit",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                                ),
                                decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0),
                                  border: Border.all(color: Colors.blue),
                                  color: Colors.white
                                ),
                            )
                          ]
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 25.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text("Account",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
                  ),
                  SizedBox(height: 8.0,),
                  Card(
                    elevation: 4.0,
                    child: Padding(padding: EdgeInsets.all(15.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
                              Icon(Icons.location_on,color: Colors.blue,),
                              SizedBox(width: 15.0,),
                              GestureDetector(
                                onTap: (){},
                                child: Text("location",style: TextStyle(fontSize: 16.0),)
                              ),
                            ],
                          ),
                          Divider(height: 18.0,color: Colors.grey[400],indent: 10.0,),
                         Row(
                            children: <Widget>[
                              Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
                              Icon(Icons.visibility,color: Colors.blue,),
                              SizedBox(width: 15.0,),
                              GestureDetector(
                                onTap: (){},
                                child: Text("Change Password",style: TextStyle(fontSize: 16.0),)
                                ),
                            ],
                          ),
                          Divider(height: 18.0,color: Colors.grey[400],indent: 10.0,),
                          Row(
                            children: <Widget>[
                              Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
                              Icon(Icons.local_shipping,color: Colors.blue,),
                              SizedBox(width: 15.0,),
                              GestureDetector(
                                onTap: (){},
                                child: Text("Shipping",style: TextStyle(fontSize: 16.0),),
                               ),
                            ],
                          ),
                          Divider(height: 18.0,color: Colors.grey[400],indent: 10.0,),
                          Row(
                            children: <Widget>[
                              Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
                              Icon(Icons.payment,color: Colors.blue,),
                              SizedBox(width: 15.0,),
                              GestureDetector(
                                onTap: (){},
                                child: Text("Payment",style: TextStyle(fontSize: 16.0),),
                              ),
                            ],
                          ),
                          Divider(height: 18.0,color: Colors.grey[400],indent: 10.0,),
                        ],
                      ),
                      
                    ),
                    
                  ),

                  SizedBox(height: 25.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text("Notifications",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
                  ),
                  SizedBox(height: 8.0,),
                  Card(
                    elevation: 4.0,
                    child: Padding(padding: EdgeInsets.all(12.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                          
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text("App Notifications",style: TextStyle(fontSize: 16.0),),
                              ),
                              SizedBox(width: 15.0,),
                              Switch(
                                value: trunOnTracking, 
                                onChanged: (bool value){
                                  setState(() {
                                    trunOnTracking = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          Divider(height: 5.0,color: Colors.grey[400],indent: 10.0,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                      
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text("Location Tracking",style: TextStyle(fontSize: 16.0),),
                              ),
                              Switch(

                                value: trunOnNotification, 
                                onChanged: (bool value){
                                  setState(() {
                                    trunOnNotification = value;
                                  });
                                },
                              ),
                            ],
                          ),
                         Divider(height: 5.0,color: Colors.grey[400],indent: 10.0,),

                        ],
                      ),
                      
                    ),
                    
                  ),

                  SizedBox(height: 25.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text("Others",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
                  ),
                  SizedBox(height: 8.0,),
                  Card(
                    elevation: 4.0,
                    child: Padding(padding: EdgeInsets.all(12.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                            
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                                  child: Text("Language",style: TextStyle(fontSize: 16.0),),
                                ),
                                SizedBox(width: 15.0,),
                              ],
                            ),
                          ),
                          Divider(height: 15.0,color: Colors.grey[400],indent: 10.0,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                      
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 6.0),
                                child: Text("Currency",style: TextStyle(fontSize: 16.0),),
                              ),
                            ],
                          ),
                         Divider(height: 15.0,color: Colors.grey[400],indent: 10.0,),
                        ],
                      ),
                      
                    ),
                    
                  ),
                ],
              ),
          ),
            ),
        ),
      ),
    );
  }
}