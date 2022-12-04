import 'package:flutter/material.dart';
import 'package:redux_shop/model/coffee_menu.dart';

class MenuItemWidget extends StatelessWidget {

   MenuItemWidget({Key? key,required this.coffee,required this.buyNot,required this.changeBadgeCount}) : super(key: key);
  CoffeeMenu coffee;
  Function buyNot;
  Function changeBadgeCount;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 255, 229, 85),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Wrap(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15)),
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/${coffee.image}',
                  fit: BoxFit.fitWidth,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    color:
                    const Color.fromARGB(255, 174, 206, 231),
                    height: 40,
                    width: 40,
                    child: IconButton(
                        icon: Icon(
                          Icons.shopping_basket,
                          color: !coffee.isBuy
                              ? Colors.grey
                              : Colors.red,
                        ),
                        onPressed: (){
                          buyNot(coffee);
                          changeBadgeCount(coffee);
                        },
                    ),
                  ),
                )
              ],
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 7,
              ),
              Text(
                coffee.name,
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Цена: '),
                  Text(
                    '${coffee.price} руб.',
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
