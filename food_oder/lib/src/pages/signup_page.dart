import 'package:flutter/material.dart';
import 'package:food_oder/src/pages/signin_page.dart';

class signUpPage extends StatefulWidget {
  @override
  _signUpPageState createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {

  bool _passwordVisibility = true;
    bool _cnfrmPasswordVisibility = true;
  
  Widget _buildEmailTextField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Enter Email",
        hintStyle: TextStyle(
          fontSize: 16.0,
          color: Color(0xFFBDC2CB)
        )
      ),
    );
  }

  Widget _buildUsernameTextField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Enter Username",
        hintStyle: TextStyle(
          fontSize: 16.0,
          color: Color(0xFFBDC2CB)
        )
      ),
    );
  }

  Widget _buildPasswordTextField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Enter Password",
        hintStyle: TextStyle(
          fontSize: 16.0,
          color: Color(0xFFBDC2CB),
        ),
        suffixIcon: IconButton(

          icon: _passwordVisibility ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
          onPressed: (){
            setState(() {
              _passwordVisibility = ! _passwordVisibility;
            });
          },
        ),
      ),
      obscureText: _passwordVisibility,
    );
  }

  Widget _buildCnfrmPasswordTextField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Conform Password",
        hintStyle: TextStyle(
          fontSize: 16.0,
          color: Color(0xFFBDC2CB),
        ),
        suffixIcon: IconButton(

          icon: _cnfrmPasswordVisibility ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
          onPressed: (){
            setState(() {
              _cnfrmPasswordVisibility = ! _cnfrmPasswordVisibility;
            });
          },
        ),
      ),
      obscureText: _cnfrmPasswordVisibility,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Sign Up", style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold)),
            SizedBox(height: 50.0,),
            Card(
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    _buildUsernameTextField(),
                     SizedBox(height: 20.0,),
                    _buildEmailTextField(),
                    SizedBox(height: 20.0,),
                    _buildPasswordTextField(),
                     SizedBox(height: 20.0,),
                    _buildCnfrmPasswordTextField(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.blueAccent
              ),
              child: Center(
                child: Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,color: Colors.white),),
              ),
            ),
             Divider(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Already have an account?",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFBDC2CB))),
                SizedBox(width: 20.0), 
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => signInPage()));
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent
                      ),
                    ),
                ),
              ],
            )
          ],
        )
        
      ),

    );
  }
}