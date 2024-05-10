import 'dart:math';

import 'package:flutter/material.dart';
import 'package:moniepoint_test/app/theme/colors.dart';
import 'package:moniepoint_test/home/data/models/listing.dart';
import 'package:moniepoint_test/home/data/sources/local.dart';

final random = Random();

class ListingCard extends StatelessWidget {
  const ListingCard({
    required this.listing,
    this.isWide,
    super.key,
  });

  final bool? isWide;
  final Listing listing;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: (isWide ?? true) ? width : width / 2.2,
      height: 180,
      margin: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 3,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(kImages[random.nextInt(kImages.length)]),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300.withOpacity(0.9),
                borderRadius: BorderRadius.circular(100),
              ),
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        top: 5,
                        bottom: 5,
                        right: 5,
                      ),
                      child: Text(
                        listing.name,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w900,
                          color: kDefaultBlack,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: kDefaultWhite,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: kDefaultGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
