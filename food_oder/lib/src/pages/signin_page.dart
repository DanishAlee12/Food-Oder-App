import 'package:flutter/material.dart';
import 'package:food_oder/src/pages/signup_page.dart';

class signInPage extends StatefulWidget {
  @override
  _signInPageState createState() => _signInPageState();
}

class _signInPageState extends State<signInPage> {

  bool _passwordVisibility = true;
  
  Widget _buildEmailTextField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Your email or username",
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
        hintText: "Your Password",
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Sign In", style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold)),
            SizedBox(height: 100.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text("Forgotton Password?", style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.blueAccent)),
              ],
            ),
            SizedBox(height: 10.0,),
            Card(
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    _buildEmailTextField(),
                    SizedBox(height: 20.0,),
                    _buildPasswordTextField()
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
                child: Text("Sign in",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,color: Colors.white),),
              ),
            ),
            Divider(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Don't have an account?",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFBDC2CB))),
                SizedBox(width: 20.0), 
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => signUpPage()));
                  },
                  child: Text(
                    "Sign Up",
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