import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izi_app/commons/cached_network_image_custom.dart';
import 'package:izi_app/commons/extensions/space.dart';
import 'package:izi_app/commons/extensions/text_extension.dart';
import 'package:izi_app/theme/asset_colors.dart';

import 'controller.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});

  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          title: Text(
            'Home',
            style: _textTheme.titleLarge?.semiBold,
          ),
          centerTitle: true,
          leading: const Icon(Icons.menu),
          actions: [
            Obx(
               () {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child:  SizedBox(
                    width: 40,
                    height: 40,
                    child: CachedImageNetworkWidget(
                      url: controller.user.value?.avatar ?? '',
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                ).paddingOnly(right: 16);
              }
            )
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                32.verticalSpace,
                _buildSearch(),
                16.verticalSpace,
                _buildBanner(),
                16.verticalSpace,
                _buildCategory(),
                16.verticalSpace,
                _buildTrandingCampaign(),
                120.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearch() {
    return TextFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          size: 20,
        ),
        hintText: 'Search',
      ),
    ).paddingSymmetric(horizontal: 16);
  }

  Widget _buildBanner() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(12),
            child: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          16.horizontalSpace,
          Expanded(
            child: Text(
              'Make The World More Meaningful',
              style: _textTheme.titleMedium?.bold.textWhite,
            ),
          )
        ],
      ),
    ).paddingSymmetric(horizontal: 16);
  }

  Widget _buildCategory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category',
          style: _textTheme.titleMedium?.semiBold,
        ).paddingSymmetric(horizontal: 16),
        12.verticalSpace,
        SizedBox(
          height: 40,
          child: Obx(() {
            return ListView(
              scrollDirection: Axis.horizontal,
              children: ['Education', 'Disaster', 'Medical'].map((item) {
                bool isSelected = controller.categorySelected.value == item;
                return InkWell(
                  onTap: () {
                    controller.categorySelected.value = item;
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.color434343 : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Center(
                      child: Text(
                        item,
                        style: _textTheme.titleSmall?.semiBold
                            .copyWith(color: isSelected ? Colors.white : AppColors.color1F1F1F),
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          }),
        )
      ],
    );
  }

  Widget _buildTrandingCampaign() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tranding Campaign',
          style: _textTheme.titleMedium?.semiBold,
        ).paddingSymmetric(horizontal: 16),
        12.verticalSpace,
        SizedBox(
          height: 200,
          child:ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: 4,
              scrollDirection: Axis.horizontal,
  itemBuilder: (context, index) => _buildCampaignItem(),
separatorBuilder: (context, index) => 12.horizontalSpace,
            ),
        )
      ],
    );
  }

  Widget _buildCampaignItem() {
    return Container(
      width: 250,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.colorBFBFBF,
      ),
    );
  }
}
