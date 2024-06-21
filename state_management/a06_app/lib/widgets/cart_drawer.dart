import 'package:flutter/material.dart';

import '/business/business_provider.dart';

class CartDrawer extends StatelessWidget {
  final BusinessProvider businessProvider;

  const CartDrawer({super.key, required this.businessProvider});

  @override
  Widget build(BuildContext context) {
    businessProvider.cartBloc.action.add(ActionCartPullState());
    return StreamBuilder<CartState>(
        stream: businessProvider.cartBloc.state,
        builder: (context, snapshot) {
          List<Widget> col = [];

          col.add(
            const Padding(
              padding: EdgeInsets.only(top: 24, bottom: 20),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.green,
                child: Icon(Icons.shopping_cart, size: 45),
              ),
            ),
          );

          if (snapshot.hasData) {
            if (snapshot.data!.list.isNotEmpty) {
              for (final cartItem in snapshot.data!.list) {
                col.add(Card(
                  elevation: 4,
                  color: Colors.white70,
                  child: ListTile(
                    leading: IconButton(
                      icon: const Icon(Icons.cancel_outlined),
                      onPressed: () {
                        businessProvider.cartBloc.action
                            .add(ActionCartRemove(product: cartItem.product));
                      },
                    ),
                    title: Text(cartItem.product.title),
                    subtitle: Text(
                        '${cartItem.count.toString()} x ${cartItem.product.price.toString()} = ${cartItem.product.price * cartItem.count}'),
                    trailing: SizedBox(
                      width: 110,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  businessProvider.cartBloc.action.add(
                                      ActionCartAdd(
                                          product: cartItem.product,
                                          count: -1));
                                }),
                            Text(cartItem.count.toString(),
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                            IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  businessProvider.cartBloc.action.add(
                                      ActionCartAdd(
                                          product: cartItem.product, count: 1));
                                }),
                          ]),
                    ),
                  ),
                ));
              }

              col.addAll([
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Total: ${snapshot.data!.sum.toString()}',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FilledButton(
                            child: const Text('Clear'),
                            onPressed: () {
                              businessProvider.cartBloc.action
                                  .add(ActionCartClear());
                            }),
                        FilledButton(
                            child: const Text('Checkout'),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: const Text('Pay me!'),
                                        content: SizedBox(
                                            height: 100,
                                            child: Card(
                                              child: Row(
                                                children: [
                                                  const Text('Total: '),
                                                  Text(snapshot.data!.sum
                                                      .toString()),
                                                ],
                                              ),
                                            )),
                                      ));
                            }),
                      ],
                    ),
                  ],
                ),
              ]);
            } else {
              col.add(const Text('Empty cart'));
            }
          } else {
            col.add(const Text('Loading...'));
          }
          return Drawer(
              child: SingleChildScrollView(child: Column(children: col)));
        });
  }
}
