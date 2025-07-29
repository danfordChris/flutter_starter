import 'package:changisha/constants/app_colors.dart';
import 'package:changisha/constants/app_pictures.dart';
import 'package:changisha/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hugeicons/hugeicons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearch().animate().fadeIn(duration: 300.ms).slideY(
                begin: 0.2,
                end: 0,
                duration: 500.ms,
                curve: Curves.easeOutQuad,
              ),
              const SizedBox(height: 24),
              _buildBanner().animate().fadeIn(delay: 100.ms).slideY(
                begin: 0.3,
                end: 0,
                duration: 600.ms,
                curve: Curves.easeOutBack,
              ),
              const SizedBox(height: 24),
              _buildCategoryGrid(),
              const SizedBox(height: 24),
              Expanded(child: _buildRecentPackages()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentPackages() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.white4, width: 1),
      ),
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 4),
              Text(
                'Recent Packages',
                style: AppTextStyle.paragraph3(AppColors.blackText),
              ).animate().fadeIn(delay: 200.ms).slideY(
                begin: 0.2,
                end: 0,
                duration: 400.ms,
              ),
              const SizedBox(height: 4),
              const Divider(color: AppColors.white4),

              // Animated list items with staggered delays
              ...List.generate(10, (index) {
                return _buildRecentItemsContainers()
                    .animate()
                    .fadeIn(delay: (300 + index * 100).ms)
                    .slideY(
                  begin: 0.3,
                  end: 0,
                  duration: 500.ms,
                  curve: Curves.easeOutQuad,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentItemsContainers() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.borderGrey,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: HugeIcon(
                    icon: HugeIcons.strokeRoundedPackage,
                    color: AppColors.black,
                    size: 30,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("ID Number", style: AppTextStyle.subtext4(Colors.black)),
                  const SizedBox(height: 4),
                  Text(
                    "F1234H418",
                    style: AppTextStyle.paragraph3(Colors.black),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                "Completed",
                style: AppTextStyle.subtext4(AppColors.primaryGreen),
              ),
            ],
          ),
        ),
        const Divider(color: AppColors.white4),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildBanner() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        height: 160,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.black, AppColors.red],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
              ).animate(onPlay: (controller) => controller.repeat())
                  // .scale(begin: 0.8, end: 1.2, duration: 3000.ms)
                  .fade(begin: 0.5, end: 0.1, duration: 3000.ms),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Special Offer!",
                    style: AppTextStyle.heading3(Colors.white),
                  ).animate().fadeIn(delay: 200.ms).slideY(
                    begin: 0.2,
                    end: 0,
                    duration: 500.ms,
                    curve: Curves.easeOutQuad,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Get 20% discount on your first shipment",
                    style: AppTextStyle.subtext1(Colors.white.withOpacity(0.9)),
                  ).animate().fadeIn(delay: 300.ms).slideY(
                    begin: 0.3,
                    end: 0,
                    duration: 500.ms,
                    curve: Curves.easeOutQuad,
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Claim Now",
                      style: AppTextStyle.subtext2(AppColors.primary),
                    ),
                  ).animate().fadeIn(delay: 400.ms).slideY(
                    begin: 0.4,
                    end: 0,
                    duration: 600.ms,
                    curve: Curves.easeOutBack,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      childAspectRatio: 0.8,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      children: [
        _buildCategoryContainer(
          title: "Price",
          icon: HugeIcons.strokeRoundedCash01,
          color: AppColors.primary,
        ).animate().fadeIn(delay: 200.ms).slideY(
          begin: 0.3,
          end: 0,
          duration: 500.ms,
          curve: Curves.easeOutBack,
        ),
        _buildCategoryContainer(
          title: "Point",
          icon: HugeIcons.strokeRoundedLocation01,
          color: AppColors.blackText,
        ).animate().fadeIn(delay: 300.ms).slideY(
          begin: 0.3,
          end: 0,
          duration: 500.ms,
          curve: Curves.easeOutBack,
        ),
        _buildCategoryContainer(
          title: "News",
          icon: HugeIcons.strokeRoundedNews,
          color: AppColors.orange,
        ).animate().fadeIn(delay: 400.ms).slideY(
          begin: 0.3,
          end: 0,
          duration: 500.ms,
          curve: Curves.easeOutBack,
        ),
        _buildCategoryContainer(
          title: "Info",
          icon: HugeIcons.strokeRoundedInformationCircle,
          color: AppColors.red,
        ).animate().fadeIn(delay: 500.ms).slideY(
          begin: 0.3,
          end: 0,
          duration: 500.ms,
          curve: Curves.easeOutBack,
        ),
      ],
    );
  }

  Widget _buildCategoryContainer({
    required String title,
    required IconData icon,
    required Color color,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: HugeIcon(icon: icon, color: color, size: 24),
                ),
              ),
              const SizedBox(height: 4),
              Text(title, style: AppTextStyle.subtext3(AppColors.black)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearch() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Track your package...',
          hintStyle: AppTextStyle.subtext4(AppColors.grey),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedSearch01,
              color: AppColors.grey,
              size: 24,
            ).animate(onPlay: (controller) => controller.repeat())
                .shake(duration: 2000.ms, hz: 2, curve: Curves.easeInOut),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedIrisScan,
              color: AppColors.primary,
              size: 24,
            ).animate().fadeIn(delay: 300.ms).slideY(
              begin: 0.2,
              end: 0,
              duration: 400.ms,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
        ),
        style: AppTextStyle.subtext3(AppColors.black),
        onChanged: (value) {
          print('Searching: $value');
        },
      ),
    );
  }
}