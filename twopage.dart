import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DisasterNewsPage(),
    );
  }
}

class DisasterNewsPage extends StatefulWidget {
  @override
  _DisasterNewsPageState createState() => _DisasterNewsPageState();
}

class _DisasterNewsPageState extends State<DisasterNewsPage> {
  final Color primaryColor = Color(0xFF105C2F);
  final List<String> categories = [
    'All',
    'Wildfire',
    'Floods',
    'Landslides',
    'Earthquake',
    'Drought',
    'Temperature Extremes'
  ];
  String selectedCategory = 'All';
  String sortOrder = 'Ascending';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('News', style: TextStyle(color: Colors.white)),
        backgroundColor: primaryColor,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: _buildDropdownButton(
                      'Sort Order',
                      sortOrder,
                      ['Ascending', 'Descending'],
                      (String? value) {
                        if (value != null) {
                          setState(() {
                            sortOrder = value;
                          });
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: _buildDropdownButton(
                      'Category',
                      selectedCategory,
                      categories,
                      (String? value) {
                        if (value != null) {
                          setState(() {
                            selectedCategory = value;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 4,
                separatorBuilder: (context, index) =>
                    Divider(color: Colors.grey),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(
                        'https://th.bing.com/th/id/OIP.7kxFZ4M9NrlYsOPmctMwtwHaE7?rs=1&pid=ImgDetMain',
                        width: 50,
                        height: 50),
                    title: Text('Disaster Name'),
                    subtitle: Text('Date: \nCategories: \nLocate: '),
                    trailing: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Details()),
                        );
                      },
                      child: Icon(Icons.map, color: primaryColor),
                    ),
                  );
                },
              ),
            ),
            Divider(color: Colors.grey),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                    'https://jimdo-storage.freetls.fastly.net/image/207559429/0ac59b29-c5f0-48b2-b74e-647af58cca02.png?quality=80',
                    width: 24,
                    height: 24),
                Text('Home'),
                Spacer(),
                Image.network(
                    'https://cdn-icons-png.flaticon.com/512/2991/2991174.png',
                    width: 24,
                    height: 24),
                Text('Emergency Call'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownButton(String hint, String value, List<String> items,
      ValueChanged<String?> onChanged) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: primaryColor),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          icon: Icon(Icons.arrow_drop_down, color: primaryColor),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: primaryColor),
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: TextStyle(color: primaryColor)),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text('News', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.green[900],
          centerTitle: true,
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'California Earthquake near Los Angeles',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                  ),
                ),
              ),
              Image.network(
                'https://akm-img-a-in.tosshub.com/indiatoday/images/story/202401/japan-earthquake-044751828-16x9_0.jpg?VersionId=RBM6I1Flkjgb8On.fmy3IlKcXUMLAhNG&size=690:388',
                height: 200.0,
                width: 220.0,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '''A strong earthquake will happen near Sunset Boulevard, Silver Lake, Los Angeles, California.
                  
Date to be Alert: 18th of January 2024 
Time: afternoon''',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        bottom: 8.0), // Adjusted margin to move the icon higher
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.green[900],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.map,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          'Map',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                'https://jimdo-storage.freetls.fastly.net/image/207559429/0ac59b29-c5f0-48b2-b74e-647af58cca02.png?quality=80',
                width: 24,
                height: 24,
              ),
              Text('Home'),
              Image.network(
                'https://cdn-icons-png.flaticon.com/512/2991/2991174.png',
                width: 24,
                height: 24,
              ),
              Text('Emergency Call'),
            ],
          ),
        ), // Close the BottomAppBar here
      ),
    );
  }
}
