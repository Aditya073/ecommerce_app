import 'dart:io';
import 'dart:convert';
import 'package:ecommerce_app/services/database.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;
  String? base64Image;

  Future<void> getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  List<String> categoryItem = ['Watch', 'Tv', 'Laptop', 'Phone'];

  String? value;

  final TextEditingController newProductName = TextEditingController();
  final TextEditingController newProductPrice = TextEditingController();
  final TextEditingController newProductDetails = TextEditingController();

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

      body: SingleChildScrollView(
        child: Container(
          // width: double.infinity,
          // height: double.infinity,
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
                child: GestureDetector(
                  onTap: getImage,
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: selectedImage == null
                        ? const Icon(Icons.camera_alt_outlined, size: 40)
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.file(
                              selectedImage!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
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
                'Product Price',
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
                  controller: newProductPrice,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
              SizedBox(height: 20),

              Text(
                'Product Details',
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
                  maxLines: 6,
                  controller: newProductDetails,
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
                    onPressed: () async {
                      if (base64Image == null || value == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please fill all fields")),
                        );
                        return;
                      }

                      Map<String, dynamic> productData = {
                        "name": newProductName.text.trim(),
                        "category": value,
                        "image": base64Image, // 👈 stored here
                      };

                      await DatabaseMethods().addProduct(productData);

                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("Product Added")));
                    },
                    child: Text('Add Product', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
