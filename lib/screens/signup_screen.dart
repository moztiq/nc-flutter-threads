import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nc_flutter_threads/constants/gaps.dart';
import 'package:nc_flutter_threads/constants/sizes.dart';
import 'package:nc_flutter_threads/screens/login_screen.dart';
import 'package:nc_flutter_threads/screens/view_models/signup_view_model.dart';
import 'package:nc_flutter_threads/screens/widgets/form_button.dart';
import 'package:nc_flutter_threads/utils.dart';

class SignupScreen extends ConsumerStatefulWidget {
  static const String routeName = 'signup';
  static const String routeURL = '/signup';

  const SignupScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<SignupScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, String> formData = {};

  void _onSubmit() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        ref.read(signupProvider.notifier).signup(
              formData['email']!,
              formData['password']!,
              context,
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode(context) ? Colors.black : Colors.white,
      ),
      backgroundColor: isDarkMode(context) ? Colors.black : Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size20,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('English (US)'),
              Gaps.v80,
              Center(
                child: Container(
                  padding: EdgeInsets.only(
                    top: Sizes.size5,
                    bottom: Sizes.size5,
                  ),
                  width: Sizes.size72,
                  height: Sizes.size72,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Sizes.size14,
                    ),
                    color: isDarkMode(context) ? Colors.white : Colors.black,
                  ),
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    "assets/images/threads.svg",
                    semanticsLabel: 'threads logo',
                    width: Sizes.size56,
                    color: isDarkMode(context) ? Colors.black : Colors.white,
                  ),
                ),
              ),
              Gaps.v80,
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      Sizes.size2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      Sizes.size2,
                    ),
                  ),
                ),
                validator: (value) {
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) {
                    formData['email'] = newValue;
                  }
                },
              ),
              Gaps.v10,
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      Sizes.size2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      Sizes.size2,
                    ),
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) {
                    formData['password'] = newValue;
                  }
                },
              ),
              Gaps.v16,
              FormButton(
                disabled: ref.watch(signupProvider).isLoading,
                text: 'Sign Up',
                onTap: _onSubmit,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: Sizes.size96 + Sizes.size20,
        color: isDarkMode(context) ? Colors.black : Colors.white,
        elevation: 0,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                context.goNamed(LoginScreen.routeName);
              },
              child: FractionallySizedBox(
                widthFactor: 1,
                child: Container(
                  height: Sizes.size40,
                  padding: EdgeInsets.symmetric(
                    vertical: Sizes.size10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Sizes.size4,
                    ),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: Sizes.size1,
                    ),
                  ),
                  child: Text(
                    'Already has account ?',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Gaps.v16,
            SvgPicture.asset(
              "assets/images/meta-platform.svg",
              semanticsLabel: 'meta logo',
              width: Sizes.size24,
              height: Sizes.size24,
              color: isDarkMode(context) ? Colors.white : Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
