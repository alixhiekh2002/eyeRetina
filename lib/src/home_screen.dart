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
    final padding = size.width * 0.04; // Responsive padding

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Text(
            "Home",
            style: TextStyle(fontSize: size.width * 0.05),
          ),
          SizedBox(
            width: size.width * 0.56,
          ),
          CircleAvatar(
              backgroundColor: Colors.red[300],
              backgroundImage: ExactAssetImage("assets/ob.jpeg")),
          SizedBox(
            width: size.width * 0.05,
          )
        ],
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
                  padding: EdgeInsets.all(padding),
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
                                fontSize: isTablet
                                    ? size.width * 0.05
                                    : size.width * 0.06,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Hi, Hammad Akhtar',
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: isTablet
                                    ? size.width * 0.04
                                    : size.width * 0.045),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.red[300],
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: size.width * 0.05,
                        ),
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
                      padding: EdgeInsets.all(padding),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isTablet ? 3 : 2, // Dynamic columns
                        crossAxisSpacing: size.width * 0.03,
                        mainAxisSpacing: size.width * 0.03,
                        childAspectRatio: isTablet ? 1.3 : 1.0,
                      ),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        switch (index) {
                          case 0:
                            return _buildCard(
                              size,
                              icon: Icons.thermostat,
                              title: 'Stage of Disease',
                              child: _buildCircularProgress(size, 'Mild', 45),
                            );
                          case 1:
                            return _buildCard(
                              size,
                              icon: Icons.bar_chart,
                              title: 'Weekly Report',
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.show_chart,
                                      size: isTablet
                                          ? size.width * 0.08
                                          : size.width * 0.07,
                                      color: Colors.red),
                                  SizedBox(height: size.height * 0.01),
                                  Text('Last Date',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: size.width * 0.03)),
                                  Text('11/15/2024',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: size.width * 0.04)),
                                ],
                              ),
                            );
                          case 2:
                            return _buildCard(
                              size,
                              icon: Icons.favorite,
                              title: 'Retina Health',
                              child: _buildGraph(size),
                            );
                          case 3:
                            return _buildCard(
                              size,
                              icon: Icons.medical_services,
                              title: 'Disease Detected',
                              child: Center(
                                child: Text(
                                  'No Diabetic Retinopathy',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * 0.04),
                                ),
                              ),
                            );
                          case 4:
                            return _buildCard(
                              size,
                              icon: Icons.opacity,
                              title: 'Saturation',
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('%',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: size.width * 0.03)),
                                  Text('45%',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: size.width * 0.045)),
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
    );
  }

  Widget _buildCard(Size size,
      {required IconData icon, required String title, required Widget child}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(size.width * 0.01),
            child: Row(
              children: [
                Icon(icon, color: Colors.red, size: size.width * 0.05),
                SizedBox(width: size.width * 0.02),
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.04),
                ),
              ],
            ),
          ),
          Expanded(child: Center(child: child)),
        ],
      ),
    );
  }

  Widget _buildCircularProgress(Size size, String stage, double value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: size.width * 0.2,
          width: size.width * 0.2,
          child: CircularProgressIndicator(
            value: value / 100,
            strokeWidth: size.width * 0.02,
            color: Colors.red,
            backgroundColor: Colors.red[100],
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Text(stage,
            style: TextStyle(
                fontSize: size.width * 0.04, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildGraph(Size size) {
    return Container(
      height: size.width * 0.15,
      width: size.width * 0.3,
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
