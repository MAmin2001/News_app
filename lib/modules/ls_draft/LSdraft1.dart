import 'package:flutter/material.dart';
class LSdraft1 extends StatelessWidget {
  const LSdraft1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[700],
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
          children:  [
            Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            SizedBox(
              height: 40.0,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),

                prefixIcon: Icon(Icons.email),

              ),
            )

          ],
          ),
        ),
      ),
    );
  }
}
