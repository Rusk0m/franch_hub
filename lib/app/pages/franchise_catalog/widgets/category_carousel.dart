import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CategoryCarousel extends StatelessWidget {
  final List<String> categories = [
    'Рестораны',
    'Розничная торговля',
    'Образование',
    'Красота',
    'Спорт',
    'Здоровье',
  ];

  CategoryCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: categories.length,
      options: CarouselOptions(
          enableInfiniteScroll: true, // Бесконечная прокрутка
          autoPlay: false, // Автопрокрутка (по желанию)
          viewportFraction: 0.3, // Видимая часть элементов
          //enlargeCenterPage: true,    // Активный элемент крупнее
          height: 50),
      itemBuilder: (context, index, realIndex) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: Theme.of(context).highlightColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                categories[index],
                maxLines: 1, // Запрещаем перенос строк
                overflow: TextOverflow.ellipsis, // Троеточие если не влезает
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
