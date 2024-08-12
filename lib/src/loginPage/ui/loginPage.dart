import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordHidden = true;
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  List<dynamic> _userData = [];

  @override
  void initState() {
    super.initState();
    _loginController.addListener(_updateButtonState);
    _passwordController.addListener(_updateButtonState);
    _loadUserData();
  }

  @override
  void dispose() {
    _loginController.removeListener(_updateButtonState);
    _passwordController.removeListener(_updateButtonState);
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {});
  }

  Future<void> _loadUserData() async {
    final String response = await rootBundle.loadString('lib/src/loginPage/data/test_auth.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      _userData = data;
    });
  }

  void _login() {
    final String login = _loginController.text;
    final String password = _passwordController.text;

    for (var user in _userData) {
      if (user['login'] == login && user['password'] == password) {
        Navigator.popAndPushNamed(context, 'main', arguments: user['name']);
        return;
      }
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Невірний логін або пароль')),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isButtonEnabled = _loginController.text.isNotEmpty && _passwordController.text.isNotEmpty;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ), 
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Image.asset(
                  'assets/images/mainlogo.png',
                  width: MediaQuery.sizeOf(context).width / 1.3,
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: TextField(
                    controller: _loginController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person_outline,
                        color: Colors.black,
                      ),
                      hintText: 'Логін',
                      filled: true,
                      fillColor: Colors.orange,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide.none,
                      ),
                      hintStyle: TextStyle(color: Colors.grey[600]),
                    ),
                    style: const TextStyle(
                      color: Colors.black, fontFamily: 'Futura', fontSize: 18),
                    cursorColor: Colors.white,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: _isPasswordHidden,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: Colors.black,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordHidden
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordHidden = !_isPasswordHidden;
                          });
                        },
                      ),
                      hintText: 'Пароль',
                      filled: true,
                      fillColor: Colors.orange,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide.none,
                      ),
                      hintStyle: TextStyle(color: Colors.grey[600]),
                    ),
                    style: const TextStyle(
                      color: Colors.black, fontFamily: 'Futura', fontSize: 18),
                      cursorColor: Colors.white,
                  ),
                ),
                const Spacer(flex: 2),
              ]
            ),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [ 
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: 'Погоджуюсь з\n',
                    style: TextStyle(color: Colors.black, fontFamily: 'Futura'),
                    children: [
                      TextSpan(
                        text: 'Правилами збору та обробки персональних даних',
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isButtonEnabled ? _login : null,
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: isButtonEnabled ? Colors.orange : Colors.transparent,
                      disabledBackgroundColor: Colors.grey.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                    ),
                    child: Text(
                      'Авторизуватись',
                      style: TextStyle(
                        fontSize: 18,
                        color: isButtonEnabled ? Colors.black : Colors.grey[600],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
