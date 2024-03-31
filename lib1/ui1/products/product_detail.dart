import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/product.dart';

class ProductDetail extends StatefulWidget {
  final Products product;

  const ProductDetail({super.key, required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final TextEditingController _value = TextEditingController();
  int _count = 0;
  bool isFavorite = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
        // Thêm Trái tim
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20.0, 0),
            child: GestureDetector(
              onTap: () => {
                setState(() {
                  isFavorite = !isFavorite;
                })
              },
              child: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image(
              image: AssetImage(widget.product.image),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '\$${widget.product.cost}',
            style: const TextStyle(color: Colors.grey, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 250,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _count--;
                      _value.text = '$_count';
                      if (_count < 0) {
                        _count = 0;
                        _value.text = '$_count';
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(const SnackBar(
                            content: Text(
                              'the count must not less than zero',
                              textAlign: TextAlign.center,
                            ),
                          ));
                      }
                    });
                    // dev.log('$_count');
                  },
                  icon: const Icon(
                    Icons.remove,
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 60,
                  child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: _value,
                      onChanged: (newValue) {
                        _value.text = newValue;
                        int? temp = int.tryParse(newValue);
                        if (temp != null) {
                          _count = temp;
                        }
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: InputBorder.none)),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _count++;
                      _value.text = '$_count';
                    });
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.red,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _count = 0;
                      _value.text = '$_count';
                    });
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(const SnackBar(
                        content: Text(
                          'The count are add to cart',
                          textAlign: TextAlign.center,
                        ),
                      ));
                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Align(
            alignment: Alignment(-0.8, 0),
            child: Text(
              'Mô tả sản phẩm :',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Align(
              alignment: const Alignment(-0.8, -0.9),
              child: Text(
                widget.product.discription,
                textAlign: TextAlign.center,
                softWrap: true,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
