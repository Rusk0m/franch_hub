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
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
        child: Stack(children: [
          IndexedStack(
            index: selectedTab.index,
            children: [
              FranchiseCatalogPage(),
              ComparisonFranchisePage(),
              ProfilePage()
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              child: BottomNavigationBar(
                  currentIndex: selectedTab.index,
                  onTap: (index) => context.read<HomeCubit>().setTab(HomeTab.values[index]),
                  // 🛠️ Фиксирует стиль
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Theme.of(context).colorScheme.onSecondary,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home,),
                        label: 'Catalog'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.align_vertical_bottom_outlined),
                        label: 'Comparison'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: 'Profile'),
                  ]),
            ),
          )
        ]),
      )),
    );
  }
}

class _HomeTabButton extends StatelessWidget {
  const _HomeTabButton({
    required this.groupValue,
    required this.value,
    required this.icon,
  });

  final HomeTab groupValue;
  final HomeTab value;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 32,
      onPressed: () => context.read<HomeCubit>().setTab(value),
      color: groupValue != value ? null : Colors.green,
      icon: icon,
    );
  }
}
