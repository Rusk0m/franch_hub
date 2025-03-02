import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/app/blocs/authentication/auth_bloc.dart';
import 'package:franch_hub/app/theme/text_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
            child: Stack(children: [
              ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        maxRadius: 30,
                        minRadius: 25,
                        child: Icon(
                          Icons.person,
                          size: 45,
                        ),
                      ),
                      Text(
                        'Franch Hub',
                        style: FlutterTextTheme.headlineMedium(context),
                      ),
                      CircleAvatar(
                        maxRadius: 30,
                        minRadius: 25,
                        child: Icon(
                          Icons.notifications,
                          size: 35,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SearchBar(
                    leading: Icon(Icons.search),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 15)),
                    hintText: 'Search',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 250,
                    width: MediaQuery
                        .sizeOf(context)
                        .width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green,
                      image: DecorationImage(
                          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
                          fit: BoxFit.cover, // Масштабирование картинки
                          image: NetworkImage(
                              'https://imgs.search.brave.com/r8slpduXzDDG_ACyfROf3PEpNy4o4Fi3VYBFBroRui0/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly90My5m/dGNkbi5uZXQvanBn/LzAyLzI4LzkwLzY0/LzM2MF9GXzIyODkw/NjQ2NF9jM3ZYUVVm/SkxpQW9sNVJKZTNr/emF1MkhCcjViMkll/VS5qcGc')
                      ),
                    ),
                    child: Align(
                      alignment: FractionalOffset(0.2, 0.9),
                      child: Text('Find Your Perfect Franchise',
                        style: FlutterTextTheme.custom(context: context,color: Colors.white,fontSize: 26,),),
                    ),
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

                  ElevatedButton(onPressed: (){context.read<AuthBloc>().add(LogoutRequested());}, child: Text('LogOut'))
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  child: BottomNavigationBar(
                    // 🛠️ Фиксирует стиль
                      type: BottomNavigationBarType.fixed,
                      backgroundColor: Theme
                          .of(context)
                          .colorScheme
                          .onSecondary,
                      items: [
                        BottomNavigationBarItem(
                            icon: Icon(
                              Icons.home,
                            ),
                            label: 'Home'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.open_in_new_rounded),
                            label: 'Open Dialog'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.open_in_new_rounded),
                            label: 'Open Dialog'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.open_in_new_rounded),
                            label: 'Open Dialog'),
                      ]),
                ),
              )
            ]),
          )),
    );
  }
}
