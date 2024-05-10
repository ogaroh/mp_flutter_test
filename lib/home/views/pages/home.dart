import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moniepoint_test/app/theme/colors.dart';
import 'package:moniepoint_test/app/theme/theme.dart';

import 'package:moniepoint_test/home/cubit/home_cubit.dart';
import 'package:moniepoint_test/home/data/sources/local.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.5, 0.7],
          colors: [
            kDefaultWhite,
            kLightOrange,
            kLightOrange,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: false,
          toolbarHeight: 100,
          title: SizedBox(
            height: 50,
            child: CupertinoSearchTextField(
              placeholder: kListings.first.city,
              placeholderStyle: TextStyle(
                color: kDefaultGrey,
                fontFamily: kDefaultFontFamily,
                fontWeight: FontWeight.bold,
              ),
              style: TextStyle(
                color: kDefaultGrey,
                fontFamily: kDefaultFontFamily,
                fontWeight: FontWeight.bold,
              ),
              prefixIcon: const Icon(
                Icons.location_on,
                size: 30,
                color: kDefaultGrey,
              ),
              backgroundColor: kDefaultWhite,
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: kDefaultOrange,
                backgroundImage: AssetImage('assets/images/portrait.png'),
              ),
            ),
          ],
          backgroundColor: Colors.transparent,
        ),
        body: const HomeBody(),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column();
  }
}
