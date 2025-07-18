import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/theme/app_colors.dart';
import 'package:food_recipe_app/features/home/presentation/views/home_view.dart';
import 'package:food_recipe_app/features/navBar/presentation/manager/cubit/navbar_cubit.dart';
import 'package:food_recipe_app/features/notification/presentation/views/notification_view.dart';
import 'package:food_recipe_app/features/profile/presentation/views/profile_view.dart';
import 'package:food_recipe_app/features/saves/presentation/views/saves_view.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});
  static List<Widget> views = [
    const HomeView(),
    const SavesView(),
    const NotificationView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavbarCubit, NavbarState>(
      builder: (context, index) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () {},
            backgroundColor: AppColors.primaryColor,
            child: Icon(Icons.add, color: Colors.white, size: 24.0.sp),
          ),

          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: views[index is NavbarUpdate ? index.currentIndex : 0],
          bottomNavigationBar: Container(
            height: 75,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, -1),
                ),
              ],
            ),
            child: BottomNavigationBar(
              elevation: 2,
              backgroundColor: Colors.white,
              currentIndex: index is NavbarUpdate ? index.currentIndex : 0,
              onTap: (newIndex) {
                context.read<NavbarCubit>().updateIndex(newIndex);
              },
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: AppColors.greyColor,

              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 24.sp),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark, size: 24.sp),
                  label: 'Saves',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications, size: 24.sp),
                  label: 'Notifications',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person, size: 24.sp),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
