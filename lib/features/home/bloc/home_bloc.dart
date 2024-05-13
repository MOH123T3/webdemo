import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myecommercewebapp/data/material_data.dart';

import '../models/home_product_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeProductWishListButtonNavigateEvent>(
        homeProductWishListButtonNavigateEvent);

    on<HomeProductCartButtonNavigateEvent>(homeProductCartButtonNavigateEvent);

    on<HomeInitialEvent>(homeInitialEvent);

    on<HomeProductWishListButtonClickedEvent>(
        homeProductWishListButtonClickedEvent);

    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
  }

  FutureOr<void> homeProductWishListButtonNavigateEvent(
      HomeProductWishListButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToWishListPageActionState());
    print('Fav');
  }

  FutureOr<void> homeProductCartButtonNavigateEvent(
      HomeProductCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToCartPageActionState());

    print('Cart');
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: MaterialData.materialProductsType
            .map((e) => ProductDataModel(
                id: e["id"].toString(),
                name: e["name"],
                imageUrl: e["imageUrl"],
                description: e["description"],
                price: e["price"]))
            .toList()));
  }

  FutureOr<void> homeProductWishListButtonClickedEvent(
      HomeProductWishListButtonClickedEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {}
}
