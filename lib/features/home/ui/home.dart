// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myecommercewebapp/features/cart/ui/cart.dart';
import 'package:myecommercewebapp/features/home/bloc/home_bloc.dart';
import 'package:myecommercewebapp/features/home/ui/product_details.dart';
import 'package:myecommercewebapp/screens/explore_drawer.dart';
import 'package:myecommercewebapp/widgets/responsive.dart';

import '../../../screens/top_bar_contents.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc homeBloc = HomeBloc();
  double opacity = 0;
  double scrollPosition = 0;

  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    opacity = scrollPosition < screenSize.height * 0.40
        ? scrollPosition / (screenSize.height * 0.40)
        : 1;

    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return CartPage();
            },
          ));
        } else if (state is HomeNavigateToWishListPageActionState) {}
      },
      builder: (context, state) {
        if (state.runtimeType == HomeLoadingState) {
          return Scaffold(
              body: Center(
            child: CircularProgressIndicator(),
          ));
        } else if (state.runtimeType == HomeLoadedSuccessState) {
          final successState = state as HomeLoadedSuccessState;

          return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size(screenSize.width, 1000),
                child: ResponsiveWidget.isSmallScreen(context)
                    ? TopBarContents(opacity, false)
                    : TopBarContents(opacity, true),
              ),
              drawer: ExploreDrawer(),
              backgroundColor: ResponsiveWidget.isSmallScreen(context)
                  ? Colors.black
                  : Colors.white,
              body: ProductDetails(productDataList: successState.products));
        } else {
          return Scaffold(
            body: Center(
              child: Text('Error'),
            ),
          );
        }
      },
    );
  }
}
