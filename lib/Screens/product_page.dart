import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/Constant.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Widgets/CustomActionBar.dart';
import 'package:ecommerce/Widgets/image_View.dart';



class productPage extends StatefulWidget {
   final String id;
   productPage({this.id});
  @override
  _productPageState createState() => _productPageState();
}

class _productPageState extends State<productPage> {
  final CollectionReference _productRef= FirebaseFirestore.instance.collection("products");
  final CollectionReference _userRef = FirebaseFirestore.instance.collection("users");
  User _user = FirebaseFirestore.instance.currentUser;
  String _selectedProductSize = "0";

  Future _addToCart(){
    return _userRef.doc(_user).collection("Cart").doc(widget.id).set({"size": 1);
    
  }
    final SnackBar _snackBar = SnackBar(content: Text("Product added to the cart"),);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Scaffold(
        body: Stack(
        children: [
        FutureBuilder(
        future: _firebaseServices.productsRef.doc(widget.productId).get(),
    builder: (context, snapshot) {
    if (snapshot.hasError) {
    return Scaffold(
    body: Center(
    child: Text("Error: ${snapshot.error}"),
    ),
    );
    }

    if (snapshot.connectionState == ConnectionState.done) {
    // Firebase Document Data Map
    Map<String, dynamic> documentData = snapshot.data.data();

    // List of images
    List imageList = documentData['images'];
    List productSizes = documentData['size'];

    // Set an initial size
    _selectedProductSize = productSizes[0];

    return ListView(
    padding: EdgeInsets.all(0),
    children: [
    ImageSwipe(
    imageList: imageList,
    ),
    Padding(
    padding: const EdgeInsets.only(
    top: 24.0,
    left: 24.0,
    right: 24.0,
    bottom: 4.0,
    ),
    child: Text(
    "${documentData['name']}",
    style: Constants.boldHeading,
    ),
    ),
    Padding(
    padding: const EdgeInsets.symmetric(
    vertical: 4.0,
    horizontal: 24.0,
    ),
    child: Text(
    "\$${documentData['price']}",
    style: TextStyle(
    fontSize: 18.0,
    color: Theme.of(context).accentColor,
    fontWeight: FontWeight.w600,
    ),
    ),
    ),
    Padding(
    padding: const EdgeInsets.symmetric(
    vertical: 8.0,
    horizontal: 24.0,
    ),
    child: Text(
    "${documentData['desc']}",
    style: TextStyle(
    fontSize: 16.0,
    ),
    ),
    ),
    Padding(
    padding: const EdgeInsets.symmetric(
    vertical: 24.0,
    horizontal: 24.0,
    ),
    child: Text(
    "Select Size",
    style: Constants.regularDarkText,
    ),
    ),
    ProductSize(
    productSizes: productSizes,
    onSelected: (size) {
    _selectedProductSize = size;
    },
    ),
    Padding(
    padding: const EdgeInsets.all(24.0),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
    GestureDetector(
    onTap: () async {
    await _addToSaved();
    Scaffold.of(context).showSnackBar(_snackBar);
    },
    child: Container(
    width: 65.0,
    height: 65.0,
    decoration: BoxDecoration(
    color: Color(0xFFDCDCDC),
    borderRadius: BorderRadius.circular(12.0),
    ),
    alignment: Alignment.center,
    child: Image(
    image: AssetImage(
    "assets/images/tab_saved.png",
    ),
    height: 22.0,
    ),
    ),
    ),
    Expanded(
    child: GestureDetector(
    onTap: () async {
    await _addToCart();
    Scaffold.of(context).showSnackBar(_snackBar);
    },
    child: Container(
    height: 65.0,
    margin: EdgeInsets.only(
    left: 16.0,
    ),
    decoration: BoxDecoration(
    color: Colors.black,
    borderRadius: BorderRadius.circular(12.0),
    ),
    alignment: Alignment.center,
    child: Text(
    "Add To Cart",
    style: TextStyle(
    color: Colors.white,
    fontSize: 16.0,
    fontWeight: FontWeight.w600),
    ),
    ),
    ),
    )
    ],
    ),
    )
    ],
    );
    }

    // Loading State
    return Scaffold(
    body: Center(
    child: CircularProgressIndicator(),
    ),
    );
    },
    ),
    CustomActionBar(
    hasBackArrrow: true,
    hasTitle: false,
    hasBackground: false,
    )
    ],
    ),
    );
  }
}
