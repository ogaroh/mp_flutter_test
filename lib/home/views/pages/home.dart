import 'dart:developer' as dev;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:moniepoint_test/app/theme/colors.dart';
import 'package:moniepoint_test/app/theme/theme.dart';

import 'package:moniepoint_test/home/cubit/home_cubit.dart';
import 'package:moniepoint_test/home/data/models/listing.dart';
import 'package:moniepoint_test/home/data/sources/local.dart';
import 'package:moniepoint_test/home/views/widgets/listing_card.dart';

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
      decoration: const BoxDecoration(gradient: kDefaultLinearGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: homeAppBar,
        body: const HomeBody(),
      ),
    );
  }
}

// home app bar
final AppBar homeAppBar = AppBar(
  centerTitle: false,
  toolbarHeight: 80,
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
        IconlyBold.location,
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
        backgroundImage: AssetImage('assets/images/png/portrait.png'),
      ),
    ),
  ],
  backgroundColor: Colors.transparent,
);

// header section
class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: RichText(
        text: TextSpan(
          text: 'Hi, Erick\n',
          children: [
            TextSpan(
              text: "let's select your perfect place",
              style: TextStyle(
                color: kDefaultBlack,
                fontSize: 30,
                fontFamily: kDefaultFontFamily,
              ),
            ),
          ],
          style: TextStyle(
            color: kDefaultGrey,
            fontSize: 25,
            fontFamily: kDefaultFontFamily,
          ),
        ),
      ),
    );
  }
}

// buttons
class BuyRentButtons extends StatelessWidget {
  const BuyRentButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BuyButton(
            listings: kListings
                .where((listing) => listing.type == ListingType.purchase)
                .toList()
                .length,
          ),
          RentButton(
            listings: kListings
                .where((listing) => listing.type == ListingType.rental)
                .toList()
                .length,
          ),
        ],
      ),
    );
  }
}

// buy button
class BuyButton extends StatelessWidget {
  const BuyButton({required this.listings, super.key});
  final int listings;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () => dev.log('Buy button pressed'),
      child: CircleAvatar(
        radius: width / 4.8,
        backgroundColor: kDefaultOrange,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'BUY\n',
            children: [
              TextSpan(
                text: '$listings\n',
                style: TextStyle(
                  color: kDefaultWhite,
                  fontSize: 40,
                  fontFamily: kDefaultFontFamily,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const TextSpan(
                text: 'offers',
              ),
            ],
            style: TextStyle(
              color: kDefaultWhite,
              fontSize: 20,
              fontFamily: kDefaultFontFamily,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

// rent button
class RentButton extends StatelessWidget {
  const RentButton({required this.listings, super.key});
  final int listings;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () => dev.log('Rent button pressed'),
        child: Container(
          width: width / 2.4,
          height: width / 2.4,
          decoration: BoxDecoration(
            color: kDefaultWhite,
            borderRadius: BorderRadius.circular(20),
          ),
          // backgroundColor: kDefaultWhite,
          child: Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'RENT\n',
                children: [
                  TextSpan(
                    text: '$listings\n',
                    style: TextStyle(
                      color: kDefaultGrey,
                      fontSize: 40,
                      fontFamily: kDefaultFontFamily,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const TextSpan(
                    text: 'offers',
                  ),
                ],
                style: TextStyle(
                  color: kDefaultGrey,
                  fontSize: 20,
                  fontFamily: kDefaultFontFamily,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// listings
class Listings extends StatelessWidget {
  const Listings({super.key});

  List<Widget> _buildListings() {
    final tiles = <Widget>[];
    for (var i = 0; i < kListings.length; i += 2) {
      if (i == 0 || i == kListings.length - 1) {
        tiles.add(
          ListingCard(
            listing: kListings[i],
            isWide: true,
          ),
        );
      } else {
        tiles.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListingCard(
                listing: kListings[i],
                isWide: false,
              ),
              ListingCard(
                listing: kListings[i + 1],
                isWide: false,
              ),
            ],
          ),
        );
      }
    }
    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: kDefaultWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildListings(),
      ),
    );
  }
}

// home body
class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Header(),
          BuyRentButtons(),
          Listings(),
        ],
      ),
    );
  }
}
