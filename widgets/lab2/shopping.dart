import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: ShoppingCart(),
      ),
    );
  }
}

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  final List<Map<String, dynamic>> _cartItems = [
    {
      'title': 'Calas',
      'price': 15.00,
      'quantity': 1,
      'image': 'assets/calas.jpg',
    },
    {
      'title': 'Angel Hair',
      'description': 'Salmon, Mozzarella',
      'price': 22.99,
      'quantity': 1,
      'image': 'assets/angel.jpg',
    },
  ];

  double get _subtotal => _cartItems.fold(
      0, (total, current) => total + (current['price'] * current['quantity']));
  double get _tax => _subtotal * 0.10;
  double get _total => _subtotal + _tax;

  void _incrementQuantity(int index) {
    setState(() {
      _cartItems[index]['quantity']++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (_cartItems[index]['quantity'] > 1) {
        _cartItems[index]['quantity']--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _cartItems.length,
            itemBuilder: (context, index) {
              final item = _cartItems[index];
              return ListTile(
                leading: Image.asset(
                    item['image']), // Replace with Image.network if using URLs
                title: Text(item['title']),
                subtitle: Text(item['description'] ?? ''),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () => _decrementQuantity(index),
                    ),
                    Text('${item['quantity']}'),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () => _incrementQuantity(index),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Subtotal: \$${_subtotal.toStringAsFixed(2)}'),
              Text('TAX (10%): \$${_tax.toStringAsFixed(2)}'),
              Text('Total: \$${_total.toStringAsFixed(2)}',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Checkout'),
                onPressed: () {
                  // Handle checkout action
                },
                style: ElevatedButton.styleFrom(color: Colors.red),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
