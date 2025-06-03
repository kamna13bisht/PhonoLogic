import 'package:flutter/material.dart';

class Writing extends StatelessWidget {
  const Writing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text('Phonologic'))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/front_page.png', width: MediaQuery.of(context).size.width * 0.7),
            const SizedBox(height: 20),
            const Text(
              'Welcome! Let\'s get stronger!',
              style: TextStyle(
                fontFamily: 'Comfortaa',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                //letterSpacing: 2.5,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/whiteboard'),
              child: const Text('Student'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/teacher'),
              child: const Text('Teacher'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/about'),
              child: const Text('About'),
            ),
          ],
        ),
      ),
    );
  }
}