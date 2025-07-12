import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/router/app_router.dart';
import 'package:e_commerce/services/firebase_auth.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreen();
}

class _SignupScreen extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey=GlobalKey();
  final String errorMsg="Enter the details";
  final  _authService=AuthService();
  String selectedRole="User";
  bool passwordInVisiblity=true;
  bool isLoading=false;

  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _usernameController=TextEditingController();

  // signup fun to handle user registration
  void signUp() async{
    setState(() {

    });
    isLoading=true;
    String? result=await _authService.signUp(name: _usernameController.text, email: _emailController.text, password: _passwordController.text, role: selectedRole);
    if (!mounted) return; // <- SAFETY CHECK
    if(result==null){
      isLoading=false;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("SignUp was successfull")));
      context.router.replace(LoginRoute());
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sign up failed: $result")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child:Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/sign_up.png"),
                  SizedBox(height: 10,),
                  TextFormField(
                      validator: (String?input){
                        if(input!=null && input.isNotEmpty){
                          return null;
                        }
                        else{
                          return errorMsg;
                        }

                      },

                      controller: _emailController,
                      decoration:const InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder()
                      ) ,
                    ),
                  SizedBox(height: 10,),
                  TextFormField(
                    obscureText: passwordInVisiblity,
                    controller: _passwordController,

                    validator: (String?input){
                      if(input!=null && input.isNotEmpty){
                        return null;
                      }
                      else{
                        return errorMsg;
                      }
                    },
                    decoration:InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                passwordInVisiblity=!passwordInVisiblity;
                              });

                            },
                            icon: passwordInVisiblity?Icon(Icons.visibility_off_rounded):Icon(Icons.visibility_rounded)
                        )
                    ) ,
                  ),
                  SizedBox(height: 10,),
                  TextFormField(

                    controller: _usernameController,
                    validator: (String?input){
                      if(input!=null && input.isNotEmpty){
                        return null;
                      }
                      else{
                        return errorMsg;
                      }
                    },
                    decoration:InputDecoration(
                        labelText: "Username",
                        border: OutlineInputBorder()
                    ) ,
                  ),
                  SizedBox(height: 10,),

                  DropdownButtonFormField(
                    validator: (String?input){
                      if(input!=null && input.isNotEmpty){
                        return null;
                      }
                      else{
                        return errorMsg;
                      }
                    },
                    value: selectedRole,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Role"
                    ),
                      items: ["Admin","User"].map((role){
                        return DropdownMenuItem(
                          value: role,
                          child: Text(role),
                        );
                      }).toList(),
                      onChanged: (String ? newValue){
                       selectedRole=newValue!;
                      }
                  ),
                  SizedBox(height: 10,),
                  isLoading?Center(child: CircularProgressIndicator(),):
                  SizedBox(
                      width:double.infinity,
                      child: ElevatedButton(
                          onPressed: () async{
                            if(_formKey.currentState!=null && _formKey.currentState!.validate()){
                              signUp();
                              // String? result=await _authService.signUp(name: _usernameController.text, email: _emailController.text, password: _passwordController.text, role: selectedRole);
                            }

                          },
                          child: Text("Sign in",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),))),
                  SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text("Already have an account ?",style: TextStyle(fontSize: 17)),
                      InkWell(
                          onTap: (){
                            context.router.navigate(LoginRoute());
                          },
                          child: Text(" Signin here",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.blueAccent,letterSpacing: -1))),
                    ],
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
