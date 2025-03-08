import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/app/blocs/authentication/auth_bloc.dart';
import 'package:franch_hub/app/pages/franchise_catalog/widgets/widgets.dart';
import 'package:franch_hub/app/theme/theme.dart';

class FranchiseCatalogPage extends StatelessWidget {
  const FranchiseCatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
            child: Text(
          'Franch Hub',
          style: FlutterTextTheme.headlineMedium(context),
        )),
        SizedBox(
          height: 20,
        ),
        SearchBar(
          leading: Icon(Icons.search),
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: 2.0, horizontal: 15)),
          hintText: 'Search',
        ),
        SizedBox(
          height: 20,
        ),
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: Stack(children: [
            Image.network(
              'https://imgs.search.brave.com/3HiHUNx5IdAHvGMgsSf5y5ti1ukAbCuvBJdLO2az3CI/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMudmVjdGVlenku/Y29tL3ZpdGUvYXNz/ZXRzL3Bob3RvLUM4/cTBLUUhHLndlYnA',
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 250,
                color: Colors.grey[200],
                child: const Icon(Icons.broken_image),
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.3),
              width: double.infinity,
              height: 250,
            ),
            Positioned(
              left: 20,
              bottom: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Find Your Perfect Franchise',
                    style: FlutterTextTheme.custom(context: context,color: Colors.white,fontSize: 24,fontWeight: FontWeight.w400),
                  ),
                  Text('Xnjndkfksadgfks',style: FlutterTextTheme.custom(context: context,color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400),),
                ],
              ),
            )
          ]),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Explore Our Franchise',
          style: FlutterTextTheme.titleLarge(context),
        ),
        SizedBox(
          height: 20,
        ),
        CategoryCarousel(),
        SizedBox(
          height: 20,
        ),
        GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 355),
            itemCount: 5,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return FranchiseCard(
                title: "Coffee Master",
                imageUrl:
                    "https://imgs.search.brave.com/3HiHUNx5IdAHvGMgsSf5y5ti1ukAbCuvBJdLO2az3CI/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMudmVjdGVlenku/Y29tL3ZpdGUvYXNz/ZXRzL3Bob3RvLUM4/cTBLUUhHLndlYnA",
                minInvestment: 50000,
                paybackPeriod: "12-18 мес",
                roi: 25,
                description:
                    "Сеть кофеен премиум-класса с уникальной системой обучения "
                    "бариста и эксклюзивными сортами кофе.",
              );
            }),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              context.read<AuthBloc>().add(LogoutRequested());
            },
            child: Text('LogOut')),
        SizedBox(
          height: 400,
        ),
      ],
    );
  }
}
