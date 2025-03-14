import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// 1. Root widget + define routes
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // You can use named routes:
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
        '/twitter': (context) => const TwitterScreen(),
        '/facebook': (context) => const FacebookScreen(),
        '/court': (context) => const CourtCounterScreen(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
    );
  }
}

// 2. Your original HomePage (counter)
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() => _counter++);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('You have pushed the button this many times:'),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 40),

              // Buttons to go to other screens
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/twitter');
                },
                child: const Text('Go to Twitter Screen'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/facebook');
                },
                child: const Text('Go to Facebook Screen'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/court');
                },
                child: const Text('Go to Court Counter Screen'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// 3. Twitter Splash Screen
class TwitterScreen extends StatelessWidget {
  const TwitterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Typically, Twitter’s splash is a blue background with the bird icon
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // If you have a real Twitter image asset, you can do:
            Image.asset('assets/twitter2.jpg', width: 100, height: 100),
            // For this example, just an Icon:
            // Icon(Icons.flutter_dash, color: Colors.white, size: 80),
            const SizedBox(height: 20),
            const Text(
              'Twitter',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Back'),
            )
          ],
        ),
      ),
    );
  }
}

// 4. Facebook Splash Screen
class FacebookScreen extends StatelessWidget {
  const FacebookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Facebook’s typical background is white with a blue logo
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // If you have a real FB image asset, you can do:
            // Image.asset('assets/facebook_logo.png', width: 100, height: 100),
            // For demonstration:
            CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 40,
              child: const Text(
                'f',
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Facebook',
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Back'),
            )
          ],
        ),
      ),
    );
  }
}

class CourtCounterScreen extends StatefulWidget {
  const CourtCounterScreen({Key? key}) : super(key: key);

  @override
  State<CourtCounterScreen> createState() => _CourtCounterScreenState();
}

class _CourtCounterScreenState extends State<CourtCounterScreen> {
  int teamAScore = 0;
  int teamBScore = 0;

  void addPointsToTeamA(int points) {
    setState(() => teamAScore += points);
  }

  void addPointsToTeamB(int points) {
    setState(() => teamBScore += points);
  }

  void resetScores() {
    setState(() {
      teamAScore = 0;
      teamBScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Orange AppBar
      appBar: AppBar(
        title: const Text('Court Counter'),
        backgroundColor: Colors.orange,
      ),

      // White background
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Team A column
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Team A',
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ),
                Text(
                  '$teamAScore',
                  style: const TextStyle(fontSize: 50, color: Colors.black),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // button color
                    foregroundColor: Colors.black,  // text/icon color
                  ),
                  onPressed: () => addPointsToTeamA(3),
                  child: const Text('+3 POINTS'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () => addPointsToTeamA(2),
                  child: const Text('+2 POINTS'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () => addPointsToTeamA(1),
                  child: const Text('FREE THROW'),
                ),
              ],
            ),

            // Divider (optional)
            Container(width: 1, height: 150, color: Colors.black54),

            // Team B column
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Team B',
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ),
                Text(
                  '$teamBScore',
                  style: const TextStyle(fontSize: 50, color: Colors.black),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () => addPointsToTeamB(3),
                  child: const Text('+3 POINTS'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () => addPointsToTeamB(2),
                  child: const Text('+2 POINTS'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () => addPointsToTeamB(1),
                  child: const Text('FREE THROW'),
                ),
              ],
            ),
          ],
        ),
      ),

      // Reset button at bottom
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.black,
          ),
          onPressed: resetScores,
          child: const Text('RESET'),
        ),
      ),
    );
  }
}

