import 'package:flutter/material.dart';

import 'package:flutter_tawk/flutter_tawk.dart';

class CustomerSupportPage extends StatelessWidget {
  const CustomerSupportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            ' URBAN ERA CUSTOMER SUPPORT',
            style: TextStyle(
              color: Colors.black, // Text color
              fontSize: 15.0, // Text size
            ),
          ),
          backgroundColor: Colors.white, // Background color
          elevation: 0, // No shadow
          iconTheme: IconThemeData(color: Colors.black), // Icon color
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Tawk(
          directChatLink:
              'https://tawk.to/chat/660ab5461ec1082f04dd8fe7/1hqct87ij',
          visitor: TawkVisitor(
            name: 'patel palash',
            email: 'patelpalash@gmail.com',
          ),
          onLoad: () {
            print('Hello Tawk!');
          },
          onLinkTap: (String url) {
            print(url);
          },
          placeholder: const Center(
            child: Text('Loading...'),
          ),
        ),
      ),
    );
  }
}
