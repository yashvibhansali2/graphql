import 'package:yashvi_graphql/presentation/screens/home/ui/card_swipe/card_swipe.dart';
import 'package:yashvi_graphql/presentation/screens/home/ui/hero_destination/recipe_destination.dart';
import 'package:yashvi_graphql/presentation/screens/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/screens/home/ui/button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<LoginBloc>(create: ((context) => LoginBloc()))],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const RecipesPage()),
    );
  }
}
