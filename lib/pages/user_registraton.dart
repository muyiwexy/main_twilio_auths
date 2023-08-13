import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:main_twilio_auth/auth/appwrite_auth.dart';
import 'package:main_twilio_auth/pages/home.dart';
import 'package:main_twilio_auth/widgets/button.dart';
import 'package:main_twilio_auth/widgets/input_form_field.dart';

class UserLogIn extends StatefulWidget {
  const UserLogIn({Key? key}) : super(key: key);

  @override
  State<UserLogIn> createState() => _UserLogInState();
}

class _UserLogInState extends State<UserLogIn> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpTokenController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isVisible = false;
  bool _isButtonDisabled = true;

  void _createUserSession() async {
    // do something
  }

  void _sendOtp() async {
    // do something
  }

  void _updateUserSession() async {
    // do something
  }

  String? _validatePhoneNumber(String? value) {
    if (value!.isEmpty) {
      return 'Phone Number cannot be empty';
    } else if (value[0] != '+' || value.length < 9 || value.length > 15) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  String? _validateOtp(String? value) {
    if (value!.isEmpty || value.length < 4 || value.length > 8) {
      return 'OTP must be between 4 and 8 characters';
    }
    return null;
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _otpTokenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: ReusableTextFormField(
                      controller: _phoneController,
                      validator: _validatePhoneNumber,
                      textType: TextInputType.number,
                    ),
                  ),
                  if (_isVisible)
                    const SizedBox(width: 10.0)
                  else
                    const SizedBox(),
                  if (_isVisible)
                    ReusableElevatedButton(
                      onPressed: _isButtonDisabled ? null : _sendOtp,
                      child: const Text('Send OTP'),
                    )
                  else
                    const SizedBox(),
                ],
              ),
              if (_isVisible)
                const SizedBox(height: 20.0)
              else
                const SizedBox(),
              if (_isVisible)
                ReusableTextFormField(
                  controller: _otpTokenController,
                  validator: _validateOtp,
                  textType: TextInputType.number,
                )
              else
                const SizedBox(),
              const SizedBox(height: 10.0),
              ReusableElevatedButton(
                onPressed: _isVisible ? _updateUserSession : _createUserSession,
                child: const Text('LOGIN'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
