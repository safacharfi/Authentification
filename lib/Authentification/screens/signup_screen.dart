import 'package:flutter/material.dart';
import '../components/authentication_button.dart';
import '../components/custom_text_field.dart';
import '../constants.dart';
import '../screens/login_screen.dart';
import '../screens/User.dart';
import '../screens/UserLinking.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

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
  late UserController contactsController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user?.name ?? '');
    _phoneController = TextEditingController(text: widget.user?.phone ?? '');
    _passwordController =
        TextEditingController(text: widget.user?.password ?? '');
    contactsController = UserController();
  }

  handleSignUp() async {
    User user = User(
      '0',
      name: _nameController.text,
      password: _passwordController.text,
      phone: _phoneController.text,
    );
    await contactsController.addUser(user);

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
              SizedBox(height: 20), // Added vertical space
              Image.asset(
                '../../../images/signup.png',
                height: 300, // Adjust the height as needed
                width: 300, // Adjust the width as needed
              ),
              SizedBox(height: 20), // Added vertical space
              Text(
                'Start your journey with Spotipark',
                textAlign: TextAlign.center,
                style: GoogleFonts.courgette(
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 20), // Added vertical space
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Full Name',
                  icon: Icon(Icons.person),
                ),
              ),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  hintText: 'Phone',
                  icon: Icon(Icons.phone),
                ),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  icon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              SizedBox(height: 40), // More vertical space added
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
