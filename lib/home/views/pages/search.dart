import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:moniepoint_test/app/theme/colors.dart';
import 'package:moniepoint_test/app/theme/theme.dart';
import 'package:moniepoint_test/home/cubit/home_cubit.dart';
import 'package:moniepoint_test/home/data/sources/local.dart';
import 'package:moniepoint_test/home/views/widgets/marker.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

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

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  bool loading = true;
  String? _mapStyleString;
  // markers to show on map
  List<Marker> allMarkers = [];

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static final CameraPosition _kInitialPosition = CameraPosition(
    target: LatLng(kListings.first.latitude, kListings.first.longitude),
    zoom: 13.5,
  );

  // load map style
  Future<void> loadStyle() async {
    setState(() {
      loading = true;
    });
    final style = await rootBundle.loadString('assets/data/map_style.json');
    setState(() {
      _mapStyleString = style;
    });
    await updateMarkers();
    setState(() {
      loading = false;
    });
  }

  // update markers on Google Map
  Future<void> updateMarkers() async {
    final markers = <Marker>[];
    for (var i = 0; i < kListings.length; i++) {
      final listing = kListings[i];

      final marker = Marker(
        icon: await const CustomMarker(
          icon: Icon(
            Icons.apartment_rounded,
            color: kDefaultWhite,
            size: 80,
          ),
        ).toBitmapDescriptor(
          logicalSize: const Size(150, 150),
          imageSize: const Size(150, 150),
        ),
        markerId: MarkerId('${listing.name}-$i'),
        position: LatLng(listing.latitude, listing.longitude),
        infoWindow: InfoWindow(
          title: listing.name,
          snippet: listing.city,
        ),
      );
      markers.add(marker);
    }

    setState(() {
      allMarkers.addAll(markers);
    });
  }

  @override
  void initState() {
    super.initState();
    loadStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDefaultBlack,
      body: Stack(
        children: [
          GoogleMap(
            markers: allMarkers.toSet(),
            style: _mapStyleString,
            initialCameraPosition: _kInitialPosition,
            onMapCreated: _controller.complete,
          ),
          Visibility(
            visible: loading,
            child: Center(
              child: Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.all(8),
                child: const Center(
                  child: CupertinoActivityIndicator(),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: searchBar,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
    );
  }
}

// search app bar
final Widget searchBar = Padding(
  padding: const EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 8,
  ),
  child: Row(
    children: [
      Expanded(
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
            IconlyBold.search,
            // size: 30,
            color: kDefaultGrey,
          ),
          backgroundColor: kDefaultWhite,
        ),
      ),
      InkWell(
        onTap: () => log('settings'),
        splashColor: kDefaultOrange,
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: kDefaultWhite,
            borderRadius: BorderRadius.circular(100),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: const Icon(
            Icons.tune_rounded,
            color: kDefaultBlack,
            size: 20,
          ),
        ),
      ),
    ],
  ),
);
