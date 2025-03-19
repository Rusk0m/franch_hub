import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/app/pages/comparison_franchise/view/comparison_franchise_page.dart';
import 'package:franch_hub/app/pages/franchise_catalog/view/franchise_catalog_page.dart';
import 'package:franch_hub/app/pages/home/cubit/home_cubit.dart';
import 'package:franch_hub/app/pages/profile/profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select((HomeCubit cubit) => cubit.state.tab);

    return Scaffold(
      body: SafeArea(
          bottom: false, // Отключаем нижний SafeAreas
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 10, left: 10),
            child: IndexedStack(
              index: selectedTab.index,
              children: [
                FranchiseCatalogPage(),
                ComparisonFranchisePage(),
                ProfilePage()
              ],
            ),
          )),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey, width: 1.5), // Верхняя граница
          ),
          /*boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            )
          ],*/
        ),
        child: BottomNavigationBar(
          currentIndex: selectedTab.index,
          onTap: (index) =>
              context.read<HomeCubit>().setTab(HomeTab.values[index]),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,

          // Убираем фон у самого BottomNavigationBar
          elevation: 0,
          // Отключаем стандартную тень
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Catalog',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.align_vertical_bottom_outlined),
              label: 'Comparison',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
