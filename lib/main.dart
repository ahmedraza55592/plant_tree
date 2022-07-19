import 'package:firebase_core/firebase_core.dart';
import 'package:plant_tree/modules/authentication/resourses/auth_methods.dart';
import 'package:plant_tree/modules/dashboard/add_plants.dart';
import 'package:plant_tree/modules/dashboard/faq.dart';
import 'package:plant_tree/modules/dashboard/my_plants.dart';
import 'package:plant_tree/styles/index.dart';
import 'package:provider/provider.dart';
import 'package:plant_tree/modules/index.dart';
import 'package:flutter/material.dart';
import 'package:plant_tree/routes.dart';
import 'modules/authentication/provider/user_provider.dart';
import 'modules/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => UserProvider(),
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(428, 926),
          builder: () => MaterialApp(
            // home: const Login(),
            routes: {
              MyRoutes.loginPage: (context) => const Login(),
              MyRoutes.signupPage: (context) => const SignUp(),
              MyRoutes.homePage: (context) => const HomePage(),
              MyRoutes.resetPasswordEmail: (context) =>
                  const ResetPasswordEmail(),
              MyRoutes.otpscreeen: (context) => const OTPScreen(),
              // MyRoutes.resetPassword: (context) => const ResetPassword(),
              MyRoutes.userProfile: (context) => const UserProfile(),
              MyRoutes.libraryDetail: (context) => const LibraryDetail(),
              MyRoutes.addPlants: (context) => const AddPlant(),
              MyRoutes.myPlants: (context) => const MyPlants(),
              MyRoutes.faq: (context) => const FAQ(),
              // MyRoutes.myplantdetails: (context) => const MyPlantDetails(),
              MyRoutes.feedback: (context) => const FeedBack(),
            },
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                centerTitle: true,
                elevation: 0.0,
                iconTheme: IconThemeData(color: AppColors.black, size: 30.0.r)
              )
            ),
            home: StreamBuilder(
              stream: AuthMethods().authChanges,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  // Checking if the snapshot has any data or not
                  if (snapshot.hasData) {
                    return const HomePage();
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('${snapshot.error}'),
                    );
                  }
                }

                // means connection to future hasnt been made yet
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.green,
                      ),
                    ),
                  );
                }

                return const Login();
              },
            ),
          ),
          //     home: FutureBuilder(
          //   future: AuthMethods()
          //       .getCurrentUser(FirebaseAuth.instance.currentUser != null
          //           ? FirebaseAuth.instance.currentUser!.uid
          //           : null)
          //       .then((value) {
          //     if (value != null) {
          //       Provider.of<UserProvider>(context, listen: false).setUser(
          //         model.User.fromMap(value),
          //       );
          //     }
          //     return value;
          //   }),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return const Center(child: CircularProgressIndicator(),);
          //     }

          //     if (snapshot.hasData) {
          //       return const HomePage();
          //     }
          //     return const Login();
          //   },
          // ),
          //   ),
          // ),
        ));
  }
}
