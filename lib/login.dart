import 'package:dabali_deliver/constants.dart';
import 'package:dabali_deliver/home.dart';
import 'package:flutter/material.dart';
export 'package:dabali_deliver/constants.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: mainColor,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                color: Colors.white,
                child: Container(
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(65)),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Card(
                          child: Container(
                            width: 180,
                            height: 180,
                            child: Image.asset("images/logo.png"),
                          ),
                        ),
                        Text(
                          "Commander autrement",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(65)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    form("Email", false),
                    form("Mot de passe", true),
                    TextButton(
                      onPressed: () {
                        print("Création de compte");
                      },
                      child: Text("Pas de compte ?"),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 45,
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                          color: mainColor,
                          child: Text(
                            "Connexion",
                            style: TextStyle(fontSize: 18),
                          ),
                          textColor: Colors.white,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onPressed: () {
                            print("Connexion en cour");
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget form(String titrelabel, bool voir) {
    return Column(
      children: [
        Text(
          titrelabel,
          style: TextStyle(
            color: kTextLightColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          height: 60,
          decoration: BoxDecoration(
              border: Border.all(color: kTextLightColor),
              borderRadius: BorderRadius.circular(25)),
          child: TextFormField(
              obscureText: voir,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: InputBorder.none,
              )),
        ),
      ],
    );
  }
}
