import 'package:crafty_bay/app/asset_paths.dart';
import 'package:crafty_bay/core/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/features/common/controllers/category_list_controller.dart';
import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty_bay/features/common/ui/widgets/product_card.dart';
import 'package:crafty_bay/features/home/ui/controllers/home_slider_controller.dart';
import 'package:crafty_bay/features/home/ui/widgets/app_bar_icon_button.dart';
import 'package:crafty_bay/features/home/ui/widgets/home_carousel_slider.dart';
import 'package:crafty_bay/features/common/ui/widgets/product_category_item.dart';
import 'package:crafty_bay/features/home/ui/widgets/product_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              ProductSearchBar(),
              const SizedBox(height: 16),
              GetBuilder<HomeSliderController>(
                builder: (sliderController) {
                  if (sliderController.inProgress) {
                    return SizedBox(
                        height: 192,
                        child: CenteredCircularProgressIndicator());
                  }

                  return HomeCarouselSlider(
                    sliders: sliderController.sliderModelList,
                  );
                }
              ),
              const SizedBox(height: 16),
              _buildSectionHeader(
                title: 'Categories',
                onTapSeeAll: () {
                  Get.find<MainBottomNavController>().moveToCategory();
                },
              ),
              _getCategoryList(),
              _buildSectionHeader(title: 'Popular', onTapSeeAll: () {}),
              _getPopularProducts(),
              _buildSectionHeader(title: 'Special', onTapSeeAll: () {}),
              _getSpecialProducts(),
              _buildSectionHeader(title: 'New', onTapSeeAll: () {}),
              _getNewProducts(),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getPopularProducts() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 8,
        // children: [1, 2, 3, 4].map((e) => ProductCard()).toList(),
      ),
    );
  }

  Widget _getSpecialProducts() {
    return SizedBox(
      height: 185,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          // return ProductCard();
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 8);
        },
      ),
    );
  }

  Widget _getNewProducts() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 8,
        // children: [1, 2, 3, 4].map((e) => ProductCard()).toList(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetPaths.navAppLogoSvg),
      actions: [
        AppBarIconButton(iconData: Icons.person, onTap: () {}),
        AppBarIconButton(iconData: Icons.call, onTap: () {}),
        AppBarIconButton(iconData: Icons.notifications, onTap: () {}),
      ],
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required VoidCallback onTapSeeAll,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleSmall),
        TextButton(onPressed: onTapSeeAll, child: Text('See all')),
      ],
    );
  }

  Widget _getCategoryList() {
    return SizedBox(
      height: 100,
      child: GetBuilder<CategoryListController>(
        builder: (controller) {
          if (controller.initialLoadingInProgress) {
            return CenteredCircularProgressIndicator();
          }

          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.homeCategoryListItemLength,
            itemBuilder: (context, index) {
              return ProductCategoryItem(
                categoryModel: controller.categoryModelList[index],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 8),
          );
        }
      ),
    );
  }
}
