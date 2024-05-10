import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moniepoint_test/app/theme/colors.dart';
import 'package:moniepoint_test/home/cubit/home_cubit.dart';

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
      backgroundColor: kDefaultBlack,
      body: const Text('Search Here'),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => log('Erick'), label: const Text('Custom Search'),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
    );
  }
}

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
