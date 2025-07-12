// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AddItemsScreen]
class AddItemsRoute extends PageRouteInfo<AddItemsRouteArgs> {
  AddItemsRoute({Key? key, List<PageRouteInfo>? children})
    : super(
        AddItemsRoute.name,
        args: AddItemsRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'AddItemsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddItemsRouteArgs>(
        orElse: () => const AddItemsRouteArgs(),
      );
      return AddItemsScreen(key: args.key);
    },
  );
}

class AddItemsRouteArgs {
  const AddItemsRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'AddItemsRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AddItemsRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [AdminScreen]
class AdminRoute extends PageRouteInfo<void> {
  const AdminRoute({List<PageRouteInfo>? children})
    : super(AdminRoute.name, initialChildren: children);

  static const String name = 'AdminRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AdminScreen();
    },
  );
}

/// generated route for
/// [AppMainScreen]
class AppMainRoute extends PageRouteInfo<void> {
  const AppMainRoute({List<PageRouteInfo>? children})
    : super(AppMainRoute.name, initialChildren: children);

  static const String name = 'AppMainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AppMainScreen();
    },
  );
}

/// generated route for
/// [CartScreen]
class CartRoute extends PageRouteInfo<void> {
  const CartRoute({List<PageRouteInfo>? children})
    : super(CartRoute.name, initialChildren: children);

  static const String name = 'CartRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CartScreen();
    },
  );
}

/// generated route for
/// [CategoryItemsScreen]
class CategoryItemsRoute extends PageRouteInfo<CategoryItemsRouteArgs> {
  CategoryItemsRoute({
    Key? key,
    required String selectedCategory,
    List<PageRouteInfo>? children,
  }) : super(
         CategoryItemsRoute.name,
         args: CategoryItemsRouteArgs(
           key: key,
           selectedCategory: selectedCategory,
         ),
         initialChildren: children,
       );

  static const String name = 'CategoryItemsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CategoryItemsRouteArgs>();
      return CategoryItemsScreen(
        key: args.key,
        selectedCategory: args.selectedCategory,
      );
    },
  );
}

class CategoryItemsRouteArgs {
  const CategoryItemsRouteArgs({this.key, required this.selectedCategory});

  final Key? key;

  final String selectedCategory;

  @override
  String toString() {
    return 'CategoryItemsRouteArgs{key: $key, selectedCategory: $selectedCategory}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CategoryItemsRouteArgs) return false;
    return key == other.key && selectedCategory == other.selectedCategory;
  }

  @override
  int get hashCode => key.hashCode ^ selectedCategory.hashCode;
}

/// generated route for
/// [ItemDetailScreen]
class ItemDetailRoute extends PageRouteInfo<ItemDetailRouteArgs> {
  ItemDetailRoute({
    Key? key,
    required DocumentSnapshot<Object?> productItem,
    List<PageRouteInfo>? children,
  }) : super(
         ItemDetailRoute.name,
         args: ItemDetailRouteArgs(key: key, productItem: productItem),
         initialChildren: children,
       );

  static const String name = 'ItemDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ItemDetailRouteArgs>();
      return ItemDetailScreen(key: args.key, productItem: args.productItem);
    },
  );
}

class ItemDetailRouteArgs {
  const ItemDetailRouteArgs({this.key, required this.productItem});

  final Key? key;

  final DocumentSnapshot<Object?> productItem;

  @override
  String toString() {
    return 'ItemDetailRouteArgs{key: $key, productItem: $productItem}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ItemDetailRouteArgs) return false;
    return key == other.key && productItem == other.productItem;
  }

  @override
  int get hashCode => key.hashCode ^ productItem.hashCode;
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginScreen();
    },
  );
}

/// generated route for
/// [MyOrderScreen]
class MyOrderRoute extends PageRouteInfo<void> {
  const MyOrderRoute({List<PageRouteInfo>? children})
    : super(MyOrderRoute.name, initialChildren: children);

  static const String name = 'MyOrderRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MyOrderScreen();
    },
  );
}

/// generated route for
/// [OrderDetailScreen]
class OrderDetailRoute extends PageRouteInfo<OrderDetailRouteArgs> {
  OrderDetailRoute({
    Key? key,
    required String orderId,
    List<PageRouteInfo>? children,
  }) : super(
         OrderDetailRoute.name,
         args: OrderDetailRouteArgs(key: key, orderId: orderId),
         initialChildren: children,
       );

  static const String name = 'OrderDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OrderDetailRouteArgs>();
      return OrderDetailScreen(key: args.key, orderId: args.orderId);
    },
  );
}

class OrderDetailRouteArgs {
  const OrderDetailRouteArgs({this.key, required this.orderId});

  final Key? key;

  final String orderId;

  @override
  String toString() {
    return 'OrderDetailRouteArgs{key: $key, orderId: $orderId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OrderDetailRouteArgs) return false;
    return key == other.key && orderId == other.orderId;
  }

  @override
  int get hashCode => key.hashCode ^ orderId.hashCode;
}

/// generated route for
/// [OrderDetailsScreen]
class OrderDetailsRoute extends PageRouteInfo<OrderDetailsRouteArgs> {
  OrderDetailsRoute({
    Key? key,
    required String orderId,
    List<PageRouteInfo>? children,
  }) : super(
         OrderDetailsRoute.name,
         args: OrderDetailsRouteArgs(key: key, orderId: orderId),
         initialChildren: children,
       );

  static const String name = 'OrderDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OrderDetailsRouteArgs>();
      return OrderDetailsScreen(key: args.key, orderId: args.orderId);
    },
  );
}

class OrderDetailsRouteArgs {
  const OrderDetailsRouteArgs({this.key, required this.orderId});

  final Key? key;

  final String orderId;

  @override
  String toString() {
    return 'OrderDetailsRouteArgs{key: $key, orderId: $orderId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OrderDetailsRouteArgs) return false;
    return key == other.key && orderId == other.orderId;
  }

  @override
  int get hashCode => key.hashCode ^ orderId.hashCode;
}

/// generated route for
/// [OrderScreen]
class OrderRoute extends PageRouteInfo<void> {
  const OrderRoute({List<PageRouteInfo>? children})
    : super(OrderRoute.name, initialChildren: children);

  static const String name = 'OrderRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OrderScreen();
    },
  );
}

/// generated route for
/// [PaymentAddMethodScreen]
class PaymentAddMethodRoute extends PageRouteInfo<void> {
  const PaymentAddMethodRoute({List<PageRouteInfo>? children})
    : super(PaymentAddMethodRoute.name, initialChildren: children);

  static const String name = 'PaymentAddMethodRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PaymentAddMethodScreen();
    },
  );
}

/// generated route for
/// [PaymentScreen]
class PaymentRoute extends PageRouteInfo<void> {
  const PaymentRoute({List<PageRouteInfo>? children})
    : super(PaymentRoute.name, initialChildren: children);

  static const String name = 'PaymentRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PaymentScreen();
    },
  );
}

/// generated route for
/// [SignupScreen]
class SignupRoute extends PageRouteInfo<void> {
  const SignupRoute({List<PageRouteInfo>? children})
    : super(SignupRoute.name, initialChildren: children);

  static const String name = 'SignupRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SignupScreen();
    },
  );
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}

/// generated route for
/// [UserFavouriteScreen]
class UserFavouriteRoute extends PageRouteInfo<void> {
  const UserFavouriteRoute({List<PageRouteInfo>? children})
    : super(UserFavouriteRoute.name, initialChildren: children);

  static const String name = 'UserFavouriteRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UserFavouriteScreen();
    },
  );
}
