import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/constants.dart';
import 'package:crafty_bay/core/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/features/cart/ui/controllers/cart_list_controller.dart';
import 'package:crafty_bay/features/cart/ui/widgets/cart_item.dart';
import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartListController _cartListController = Get.find<CartListController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cartListController.getCartItemList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        _backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
          leading: IconButton(
            onPressed: _backToHome,
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: GetBuilder(
          init: _cartListController,
          builder: (_) {
            if (_cartListController.inProgress) {
              return const CenteredCircularProgressIndicator();
            }
            if (_cartListController.errorMessage != null) {
              return Center(
                child: Text(_cartListController.errorMessage!),
              );
            }

            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListView.separated(
                      itemCount: _cartListController.cartItemList.length,
                      itemBuilder: (context, index) {
                        return CartItem(
                          cartItemModel: _cartListController.cartItemList[index],
                        );
                      },
                      separatorBuilder: (_, __) => const SizedBox(height: 4),
                    ),
                  ),
                ),
                _buildPriceAndCheckoutSection(),
              ],
            );
          }
        ),
      ),
    );
  }

  Widget _buildPriceAndCheckoutSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: AppColors.themeColor.withOpacity(0.3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total Price', style: Theme.of(context).textTheme.bodyLarge),
              Text(
                '${Constants.takaSign}${_cartListController.totalPrice}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.themeColor,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(onPressed: () {}, child: Text('Checkout')),
          ),
        ],
      ),
    );
  }

  void _backToHome() {
    Get.find<MainBottomNavController>().backToHome();
  }
}