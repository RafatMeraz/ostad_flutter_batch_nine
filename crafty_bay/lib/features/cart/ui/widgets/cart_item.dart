import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/constants.dart';
import 'package:crafty_bay/features/cart/data/models/cart_item_model.dart';
import 'package:crafty_bay/features/cart/ui/controllers/cart_list_controller.dart';
import 'package:crafty_bay/features/product/ui/widgets/inc_dec_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemModel});

  final CartItemModel cartItemModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shadowColor: Colors.white,
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            padding: EdgeInsets.all(8),
            child: Image.network(
              cartItemModel.productModel.photoUrls.first,
              errorBuilder: (_, __, ___) {
                return Center(child: Icon(Icons.error_outline));
              },
              fit: BoxFit.scaleDown,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 4,
                right: 12,
                bottom: 16,
                top: 4,
              ),
              child: Column(
                spacing: 6,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartItemModel.productModel.title,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.6,
                                color: Colors.black54,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              'Color: ${cartItemModel.color}  Size: ${cartItemModel.size}',
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete_forever_outlined,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${Constants.takaSign}${cartItemModel.productModel.currentPrice}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.themeColor,
                        ),
                      ),
                      IncDecButton(
                        onChange: (int value) {
                          Get.find<CartListController>().updateQuantity(
                              cartItemModel.id, value);
                        },
                      ),
                    ],
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
