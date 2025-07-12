import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/router/app_router.dart';
import 'package:e_commerce/services/firebase_auth.dart';
import 'package:flutter/material.dart';
@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState>_formKey=GlobalKey();
  final String errorMsg="Enter the valid details";
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  bool isLoading=false;
  bool passwordInVisiblity=true;
  final _authService=AuthService();

  // function to handle Login
  void signIn()async {
    setState(() {
      isLoading=true;
    });
    String ? result=await _authService.signIn(email: _emailController.text, password: _passwordController.text);
    setState(() {
      isLoading=false;
    });
    if(!mounted)return;
    if(result=='Admin'){
      context.router.replace(AdminRoute());
    }
    else if(result=='User'){
      context.router.replace(AppMainRoute());
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("SignIn failed $result")));
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
                  Image.asset("assets/images/login-img.png"),
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
                     validator: (String?input){
                       if(input!=null && input.isNotEmpty){
                         return null;
                       }
                       else{
                         return errorMsg;
                       }
                     },
                     controller: _passwordController,
                     obscureText: passwordInVisiblity,
                    decoration:InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              passwordInVisiblity=!passwordInVisiblity;
                            });
                          },
                          icon: passwordInVisiblity?Icon(Icons.visibility_off_rounded):Icon(Icons.visibility_rounded)
                      ),
                      labelText: "Password",
                      border: OutlineInputBorder()
                    ) ,
                  ),
                  SizedBox(height: 10,),
                  isLoading?Center(child: CircularProgressIndicator(),):
                  SizedBox(
                      width:double.infinity,
                      child: ElevatedButton(onPressed: (){signIn();}, child: Text("Sign in",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),))),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text("Don't have a account ?",style: TextStyle(fontSize: 17)),
                      InkWell(
                        onTap: (){
                          context.router.navigate(SignupRoute());
                        },
                          child: Text(" Signup here",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.blueAccent,letterSpacing: -1))),
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
