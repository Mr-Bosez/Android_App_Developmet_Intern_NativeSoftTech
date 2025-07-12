import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../screens/role_based_login/admin/screen/add_items.dart';
import '../screens/role_based_login/admin/screen/admin_screen.dart';
import '../screens/login_screen.dart';
import '../screens/role_based_login/admin/screen/order_screen.dart';
import '../screens/role_based_login/user/category_items.dart';
import '../screens/role_based_login/user/item_detail_screen.dart';
import '../screens/role_based_login/user/user Profile/order/my_order_screen.dart';
import '../screens/role_based_login/user/user Profile/order/order_detail_screen.dart';
import '../screens/role_based_login/user/user Profile/payment/payment_add_method.dart';
import '../screens/role_based_login/user/user Profile/payment/payment_screen.dart';
import '../screens/role_based_login/user/user_activity/add_to_cart/screens/cart_screen.dart';
import '../screens/role_based_login/user/user_activity/user_favourites.dart';
import '../screens/signup_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/role_based_login/user/app_main_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter{
  @override
  List<AutoRoute> get routes =>[
    AutoRoute(page: SplashRoute.page,initial: true,path: '/splash'),
    AutoRoute(page: LoginRoute.page,path: '/login'),
    AutoRoute(page: SignupRoute.page,path: '/signup'),
    AutoRoute(page: AppMainRoute.page,path:'/user'),
    AutoRoute(page: AdminRoute.page,path:'/admin'),
    AutoRoute(page: AddItemsRoute.page,path:'/addItems'),
    AutoRoute(page: ItemDetailRoute.page,path:'/itemDetail'),
    AutoRoute(page: CategoryItemsRoute.page,path:'/filterCategory'),
    AutoRoute(page: UserFavouriteRoute.page,path:'/userFavourite'),
    AutoRoute(page: CartRoute.page,path:'/cartScreen'),
    AutoRoute(page: PaymentRoute.page,path:'/paymentScreen'),
    AutoRoute(page: PaymentAddMethodRoute.page,path:'/paymentMethod'),
    AutoRoute(page: MyOrderRoute.page,path:'/myOrder'),
    AutoRoute(page: OrderDetailRoute.page,path:'/orderDetail'),
    AutoRoute(page: OrderDetailsRoute.page,path:'/orderDetails'),
    AutoRoute(page: OrderRoute.page,path: '/adminOrder')
  ];



}