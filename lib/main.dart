import 'package:flutter/material.dart';

void main() {
  runApp(const UnivoxApp());
}

class UnivoxApp extends StatelessWidget {
  const UnivoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UNIVOX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool listening = false;
  String mode = "Student";

  final modes = [
    "Student",
    "Police",
    "Army",
    "Traveler",
    "Creator"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UNIVOX"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: modes.map((m) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: ChoiceChip(
                    label: Text(m),
                    selected: mode == m,
                    onSelected: (_) {
                      setState(() => mode = m);
                    },
                  ),
                );
              }).toList(),
            ),
          ),

          const Spacer(),

          GestureDetector(
            onTap: () {
              setState(() => listening = !listening);
            },
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: listening ? Colors.red : Colors.blue,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.mic, size: 60),
            ),
          ),

          const SizedBox(height: 20),
          Text(
            listening ? "Listening ($mode)..." : "Tap mic to start",
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
