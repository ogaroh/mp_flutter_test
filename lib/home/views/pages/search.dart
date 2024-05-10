import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moniepoint_test/app/theme/colors.dart';
import 'package:moniepoint_test/app/theme/theme.dart';
import 'package:moniepoint_test/home/cubit/home_cubit.dart';
import 'package:moniepoint_test/home/data/sources/local.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const SearchView(),
    );
  }
}

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      // appBar: searchAppBar,
      backgroundColor: kDefaultBlack,
      body: const Text('Search Here'),
      floatingActionButton: searchAppBar,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
    );
  }
}

// search app bar
final AppBar searchAppBar = AppBar(
  centerTitle: false,
  toolbarHeight: 80,
  title: SizedBox(
    height: 50,
    child: CupertinoSearchTextField(
      placeholder: kListings.first.city,
      borderRadius: BorderRadius.circular(100),
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
        Icons.search,
        size: 30,
        color: kDefaultGrey,
      ),
      backgroundColor: kDefaultWhite,
    ),
  ),
  actions: [
    Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () => log('Settings'),
        child: const CircleAvatar(
          radius: 30,
          backgroundColor: kDefaultWhite,
          child: Icon(
            Icons.settings_suggest_outlined,
            color: kDefaultGrey,
            size: 35,
          ),
        ),
      ),
    ),
  ],
  backgroundColor: Colors.transparent,
);
