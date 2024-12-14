import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Fetch screen size
    final isTablet = size.width > 600; // Simple check for tablet devices

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.red[800],
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome Back!',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: isTablet ? 28 : 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Hi, Hammad Akhtar',
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: isTablet ? 18 : 16),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: isTablet ? 36 : 24,
                        backgroundImage: const AssetImage(
                            'assets/profile.png'), // Add your profile image
                      ),
                    ],
                  ),
                ),

                // Grid Section
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: GridView.builder(
                      padding: const EdgeInsets.all(16.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isTablet ? 3 : 2, // Dynamic columns
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: isTablet ? 1.3 : 1.0,
                      ),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        switch (index) {
                          case 0:
                            return _buildCard(
                              icon: Icons.thermostat,
                              title: 'Stage of Disease',
                              child: _buildCircularProgress('Mild', 45),
                            );
                          case 1:
                            return _buildCard(
                              icon: Icons.bar_chart,
                              title: 'Weekly Report',
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.show_chart,
                                      size: isTablet ? 50 : 40,
                                      color: Colors.red),
                                  const SizedBox(height: 8),
                                  const Text('Last Date',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 12)),
                                  const Text('11/15/2024',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                ],
                              ),
                            );
                          case 2:
                            return _buildCard(
                              icon: Icons.favorite,
                              title: 'Retina Health',
                              child: _buildGraph(),
                            );
                          case 3:
                            return _buildCard(
                              icon: Icons.medical_services,
                              title: 'Disease Detected',
                              child: const Center(
                                child: Text(
                                  'No Diabetic Retinopathy',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            );
                          case 4:
                            return _buildCard(
                              icon: Icons.opacity,
                              title: 'Saturation',
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('%',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 14)),
                                  const Text('45%',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                ],
                              ),
                            );
                          default:
                            return const SizedBox.shrink();
                        }
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 210, 134, 134),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.arrow_back), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }

  // Function to build each card widget
  Widget _buildCard({
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                Icon(icon, color: Colors.red),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(child: Center(child: child)),
        ],
      ),
    );
  }

  // Function to create a mock circular progress widget
  Widget _buildCircularProgress(String stage, double value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 80,
          width: 80,
          child: CircularProgressIndicator(
            value: value / 100,
            strokeWidth: 8,
            color: Colors.red,
            backgroundColor: Colors.red[100],
          ),
        ),
        const SizedBox(height: 8),
        Text(stage,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }

  // Mock graph widget
  Widget _buildGraph() {
    return Container(
      height: 60,
      width: 120,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.red, Colors.red.withOpacity(0)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
