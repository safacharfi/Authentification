import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/Authentification/screens/UserLinking.dart';
import '/Authentification/screens/User.dart';
import 'package:provider/provider.dart';
import '/Authentification/profile/editprofile.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyProfilePage> {
  bool _status = true;
  late UserController contactController;
  late List<User> users;
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    contactController = Provider.of<UserController>(context, listen: true);
    users = contactController.users;
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    // Récupérer le dernier utilisateur
    User? lastUser = users.isNotEmpty ? users.last : null;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(3, 100, 176, 65),
                ],
                begin: Alignment.topCenter,
                end: Alignment.center,
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: _height / 15),
                  SizedBox(
                    child: Image.asset(
                      'images/illustration1.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: _height / 30),
                  Text(
                    'Welcome ${lastUser?.name ?? ""}',
                    style: GoogleFonts.courgette(
                      fontSize: 24.0, // Adjust the font size as needed
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: _height / 15), // Vertical spacing
                  infoChild(
                    _width,
                    Icons.person,
                    'Name: ${lastUser?.name ?? ""}',
                  ),
                  SizedBox(height: _height / 30), // Vertical spacing
                  infoChild(
                    _width,
                    Icons.phone,
                    'Phone Number: ${lastUser?.phone ?? ""}',
                  ),
                  SizedBox(height: _height / 30), // Vertical spacing
                  infoChild(
                    _width,
                    Icons.directions_car,
                    'Show all Vehicles',
                  ),
                  SizedBox(height: _height / 30), // Vertical spacing
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserEditScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: _width / 3,
                      height: _height / 20,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(3, 100, 176, 65),
                        borderRadius: BorderRadius.all(
                          Radius.circular(_height / 40),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black87,
                            blurRadius: 2.0,
                            offset: Offset(0.0, 1.0),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget infoChild(double width, IconData icon, data) => Padding(
        padding: EdgeInsets.only(bottom: 8.0),
        child: InkWell(
          child: Row(
            children: <Widget>[
              SizedBox(
                width: width / 10,
              ),
              Icon(
                icon,
                color: const Color.fromRGBO(3, 100, 176, 65),
                size: 36.0,
              ),
              SizedBox(
                width: width / 20,
              ),
              Text(data)
            ],
          ),
          onTap: () {
            print('Info Object selected');
          },
        ),
      );
}
