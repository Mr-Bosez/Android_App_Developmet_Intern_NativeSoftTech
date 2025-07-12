import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/core/provider/cart_provider.dart';
import 'package:e_commerce/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class CartOrderCount extends ConsumerWidget {
   const CartOrderCount({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final state=ref.watch(cartProvider);
    return  Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: (){
            context.router.navigate(CartRoute());
          },
            child: Icon(Iconsax.shopping_bag, size: 26)),
        state.carts.isNotEmpty?
        Positioned(
          top: -3,
          right: -7,
          child: CircleAvatar(
            radius: 10,
            backgroundColor: Colors.redAccent,
            child: Center(
              child: Text(
                state.carts.length.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
            ),
          ),
        ):SizedBox(),
      ],
    );
  }
}
