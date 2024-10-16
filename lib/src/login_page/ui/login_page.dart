import 'package:check_point/database/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:check_point/src/login_page/data/login_model.dart';
import 'package:check_point/providers/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:check_point/common/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:check_point/providers/language_provider.dart';

class LoginPage extends StatefulWidget {
  /// use provider for state management
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordHidden = true;
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  List<LoginModel> _userData = [];

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
    _userData =
        await LoginModel.loadUserData('lib/src/login_page/data/test_auth.json');
    setState(() {});
  }

  void _login() async {
    final String login = _loginController.text;
    final String password = _passwordController.text;

    for (var user in _userData) {
      if (user.login == login && user.password == password) {
        //work with database
        await DatabaseHelper.instance.insertUser({
          'name': user.name,
          'password': user.password,
          'login': user.login,
        });
        //work with provider
        Provider.of<UserProvider>(context, listen: false).updateUser(user);

        context.goNamed(
          'main',
          pathParameters: {'name': user.name},
        );
        return;
      }
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context)!.authorize_error)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    bool isButtonEnabled =
        _loginController.text.isNotEmpty && _passwordController.text.isNotEmpty;
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: screenWidth < 300 ? 20 : 60),
                      Center(
                        child: Image.asset(
                          'assets/images/mainlogo.png',
                          width: screenWidth < 500
                              ? screenWidth / 1.3
                              : screenWidth / 1.7,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal:
                              theme.dimensions.visibleContentCount * 10.0,
                        ),
                        child: TextField(
                          controller: _loginController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.person_outline,
                              color: Colors.black,
                            ),
                            hintText: AppLocalizations.of(context)!.login,
                            filled: true,
                            fillColor: Colors.orange,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide.none,
                            ),
                            hintStyle: TextStyle(color: Colors.grey[600]),
                          ),
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Futura',
                            fontSize: 18,
                          ),
                          cursorColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal:
                              theme.dimensions.visibleContentCount * 10.0,
                        ),
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
                            hintText: AppLocalizations.of(context)!.password,
                            filled: true,
                            fillColor: Colors.orange,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide.none,
                            ),
                            hintStyle: TextStyle(color: Colors.grey[600]),
                          ),
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Futura',
                            fontSize: 18,
                          ),
                          cursorColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: theme.dimensions.visibleContentCount * 10.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: '${AppLocalizations.of(context)!.accept} \n',
                        style: const TextStyle(
                            color: Colors.black, fontFamily: 'Futura'),
                        children: [
                          TextSpan(
                            text: AppLocalizations.of(context)!.rules,
                            style: const TextStyle(
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
                          backgroundColor: isButtonEnabled
                              ? Colors.orange
                              : Colors.transparent,
                          disabledBackgroundColor: Colors.grey.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.authorize,
                          style: TextStyle(
                            fontSize: 18,
                            color: isButtonEnabled
                                ? Colors.black
                                : Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
          Positioned(
            top: 30,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextButton(
                onPressed: () {
                  Locale newLocale =
                      languageProvider.locale.languageCode == 'en'
                          ? const Locale('uk')
                          : const Locale('en');
                  languageProvider.setLocale(newLocale);
                },
                child: Text(
                  languageProvider.locale.languageCode,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
