import 'package:flutter/material.dart';
import 'package:plant_app/components/authentication_button.dart';
import 'package:plant_app/components/custom_text_field.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/login_screen.dart';
import '/screens/User.dart';
import '/screens/UserLinking.dart';
import 'package:provider/provider.dart';


class SignupScreen extends StatefulWidget {
  final User? user;
  
  SignupScreen({this.user, Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;
    late UserController contactsController; // Ajoutez cette ligne


  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user?.name ?? '');
    _phoneController = TextEditingController(text: widget.user?.phone ?? '');
    _passwordController = TextEditingController(text: widget.user?.password ?? '');
        contactsController = UserController(); // Remplacez par l'initialisation réelle

  }

  handleSignUp()  async {
    User user = User(
      '0',
      name: _nameController.text,
      password: _passwordController.text,
      phone: _phoneController.text,
    );
    await contactsController.addUser(user);
    // Une fois l'inscription terminée, naviguez vers la page de connexion
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
  UserController contactsController = Provider.of<UserController>(context);

  return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        backgroundColor: kDarkGreenColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Register',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Full Name',
                  icon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  hintText: 'Phone',
                  icon: Icon(Icons.phone),
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  icon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20.0),
              AuthenticationButton(
                label: 'Sign Up',
                onPressed: handleSignUp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
