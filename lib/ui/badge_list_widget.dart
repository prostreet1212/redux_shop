import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import '../model/coffee_menu.dart';

class BadgeListWidget extends StatelessWidget {
   const BadgeListWidget({Key? key,required this.badgeList,required this.clearBadge,required this.changeBuyStatus}) : super(key: key);
  final List<CoffeeMenu> badgeList;
  final Function clearBadge;
  final Function changeBuyStatus;

  @override
  Widget build(BuildContext context) {
    return

      badgeList.isEmpty
          ? const Center(
        child: Text('Корзина пуста'),
      )
          : Column(
        children: [
          Expanded(
              flex: 9,
              child: ListView.builder(
                  itemCount: badgeList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.yellow,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/${badgeList[index].image}',
                              fit: BoxFit.fitWidth,
                            ),
                            Expanded(
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        badgeList[index].name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Text(
                                          'Цена: ${badgeList[index].price} руб.',
                                          style: const TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontSize: 16))
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    );
                  })),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Colors.black),
                  ),
                  child: const Text(
                    'Оформить заказ',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  onPressed: () {
                    clearBadge();
                    changeBuyStatus();
                    Navigator.pop(context);
                    showToast('Заказ успешно выполнен');
                  },
                ),
              ),
            ),
          )
        ],
      );

  }
}
