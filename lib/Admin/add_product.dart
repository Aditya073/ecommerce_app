import 'dart:ui';

import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  List<String> categoryItem = ['Watch', 'Tv', 'Laptop', 'Phone'];

  String? value;

  final TextEditingController newProductName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        backgroundColor: Color(0xfff2f2f2),
        title: Text(
          'Add Product',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20),
        color: Color(0xfff2f2f2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Upload the product image',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: 22,
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: Color(0xfff2f2f2),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black, width: 2),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.camera_alt_outlined, color: Colors.black),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            Text(
              'Product Name',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 210, 210, 229),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: newProductName,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(height: 20),

            Text(
              'Category',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: 18,
              ),
            ),

            SizedBox(height: 10),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 210, 210, 229),
                borderRadius: BorderRadius.circular(20),
              ),

              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  items: categoryItem
                      .map(
                        (item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: ((value) => setState(() {
                    this.value = value;
                  })),

                  dropdownColor: Colors.white,
                  hint: Text('Select a Category'),
                  iconSize: 30,

                  value: value,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    print(newProductName.text.trim());
                    print(value);
                  },

                  child: Text('Add Product', style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
