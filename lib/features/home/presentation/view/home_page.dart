import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/features/franchise/presentation/screens/franchise_catalog/view/franchise_catalog_page.dart';
import 'package:franch_hub/features/home/presentation/cubit/home_cubit.dart';
import 'package:franch_hub/features/profile/presentation/screens/profile/view/profile_page.dart';

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
                //ComparisonFranchisePage(),
                ProfilePage()
              ],
            ),
          )),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey, width: 1.5), // Верхняя граница
          ),
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
