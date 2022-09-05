import 'package:flutter/material.dart';
import 'package:test_psi/theme/app_theme.dart';
import 'package:test_psi/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'user': '',
      'pw': '',
    };

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  const Text(
                    "¡Bienvenido de vuelta!",
                    style: TextStyle(
                        color: AppTheme.text,
                        fontSize: 40,
                        fontFamily: "Medium"),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Inicia sesión para continuar",
                    style: TextStyle(
                        color: AppTheme.text,
                        fontSize: 25,
                        fontFamily: "Regular"),
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: myFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          isPassword: false,
                          formProperty: 'user',
                          formValues: formValues,
                          hintText: "Usuario",
                          validador: (value) {
                            if (value == null) {
                              return "Por favor ingresa tu usuario";
                            }
                            return value == ""
                                ? "Por favor ingresa tu usuario"
                                : null;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          isPassword: true,
                          formProperty: 'user',
                          formValues: formValues,
                          hintText: "Contraseña",
                          validador: (value) {
                            if (value == null) {
                              return "Por favor ingresa tu contraseña";
                            }
                            return value == ""
                                ? "Por favor ingresa tu contraseña"
                                : null;
                          },
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: (() {
                      FocusScope.of(context).requestFocus(FocusNode());
                      if (myFormKey.currentState!.validate()) {
                        //User Admin, pw: 123456 //Evaluador
                        //User Arturo, pw: 123456 // Evaluado

                        if (formValues['user'] == "Admin") {
                        } else {
                          Navigator.pushReplacementNamed(
                              context, "/selectTest");
                        }
                      }
                    }),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        height: 55,
                        width: double.infinity,
                        color: AppTheme.primaryColor,
                        child: const Center(
                          child: Text(
                            "Iniciar sesión",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Regular"),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
