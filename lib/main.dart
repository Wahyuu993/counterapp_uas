import 'package:counterapp_uas/widgets/tombol_kurang.dart';
import 'package:counterapp_uas/widgets/tombol_tambah.dart';
import 'package:flutter/material.dart';

void main() => runApp(const CounterApplication());

class CounterApplication extends StatelessWidget{
  const CounterApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter counter application',
      home: CounterScreenState(),
    );
  }
}

class CounterScreenState extends StatefulWidget {
  const CounterScreenState({super.key});

  @override
  CounterScreen createState() => CounterScreen();
}

class CounterScreen extends State<CounterScreenState> {

  int _count = 0;

  void _incrementCount() {
    setState((){
      _count++;
    });
  }
  //tombol tambah

  void _decrementCount() {
    if(_count < 1) {
      return;
    }
    setState((){
      _count--;
    });
  }
  //tombol kurang

  void _resetCount() {
    setState((){
      _count = 0;
    });
  }
  //tombol reset

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // appbar
      appBar: AppBar(
        title: const Text('Counter'),
        backgroundColor: Colors.white70,
        elevation: 20,
        actions: [
          IconButton(
            onPressed: (){
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  actions: [
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      child: const Text('CANCEL'),
                    ),
                    TextButton(
                      onPressed: _resetCount,
                      child: const Text('RESET'),
                    ),
                  ],
                  contentPadding: const EdgeInsets.all(20.0),
                  content: const Text('Do you really want reset this counter?')
                ),
              );
            },
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: (){
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  actions: [
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      child: const Text('CANCEL'),
                      ),
                      TextButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      child: const Text('APPLY'),
                      ),
                  ],
                  title: const Text('Edit this counter'),
                  contentPadding: const EdgeInsets.all(20.0),
                  content: const Text(
                    'Title:\n'
                    'Value:',
                  ),
                ),
              );
            },
            icon: const Icon(Icons.edit),
          ),
          PopupMenuButton( 
            onSelected: (result) {
              if (result == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              }
            },


            //halaman settings
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context){
              return [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text("Delete counter"),
                ),
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text("Settings"),
                ),
              ];
            },
          ),
        ],
      ),
      // akhir appbar


      // drawer
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text('Counter'),
            ),
            ListTile(
              title: const Text('+ Add counter'),
              textColor: Colors.white,
              onTap: (){
              showDialog(
                context: context,
                  builder: (context) => AlertDialog(
                    actions: [
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        child: const Text('CANCEL'),
                      ),
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        child: const Text('ADD'),
                      ),
                    ],
                    title: const Text('Add a new counter'),
                    contentPadding: const EdgeInsets.all(20.0),
                    content: const Text('Title:') 
                  ),
                );
              },
            ),
          ],
        ),
      ),
      // akhir drawer 


      // body
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 150),
            Text(
              '$_count',
              style: const TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            ButtonTambah(
              text: '+',
              backgroundColor: Colors.blue,
              onPressed: _incrementCount,
            ),
            ButtonKurang(
              text: '-',
              backgroundColor: Colors.blue,
              onPressed: _decrementCount,
            ),
          ],
        ),
      ),
      // akhir body


    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;
  bool _notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan'),
      ),
      body: ListView(
        children: <Widget>[
          SwitchListTile(
            title: Text('Turn on sounds'),
            value: _darkMode,
            onChanged: (bool value) {
              setState(() {
                _darkMode = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Turn on vibration'),
            value: _notifications,
            onChanged: (bool value) {
              setState(() {
                _notifications = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Use hardware buttons'),
            value: _notifications,
            onChanged: (bool value) {
              setState(() {
                _notifications = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Tap valuee to increment'),
            value: _notifications,
            onChanged: (bool value) {
              setState(() {
                _notifications = value;
              });
            },
          ),
        ],
      ),
    );
  }
}