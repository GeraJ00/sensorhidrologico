import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/registros_screen.dart';


void main() {
  runApp(HiTempApp()); // Punto de entrada de la aplicación
}

// ignore: use_key_in_widget_constructors
class HiTempApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HiTemp',
      debugShowCheckedModeBanner: false, // Oculta la banda de debug
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF001C34), // Color de fondo general
        primaryColor: Colors.cyan, // Color primario para elementos activos
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white), // Texto base en blanco
        ),
      ),
      home: MainNavigation(), // Pantalla principal con navegación inferior
    );
  }
}

// ignore: use_key_in_widget_constructors
class MainNavigation extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0; // Índice actual de la pantalla seleccionada

  // Lista de pantallas que se muestran al cambiar el índice
  final List<Widget> _screens = [
    HomeScreen(), // Pantalla de Inicio
    RegistrosScreen(), // Pantalla de Registros
    Center(child: Text('Configuración')), // Placeholder para Configuración
    Center(child: Text('Gráficos')),      // Placeholder para Gráficos
  ];

  // Método para manejar los taps en la barra de navegación
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Actualiza el índice de pantalla seleccionada
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Muestra la pantalla seleccionada
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Índice actual
        onTap: _onItemTapped, // Llama a la función al hacer tap
        backgroundColor: const Color(0xFF001830), // Color de fondo del navbar
        selectedItemColor: Colors.cyanAccent, // Color para ítem activo
        unselectedItemColor: Colors.white70,   // Color para ítems inactivos
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'INICIO',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'REGISTROS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'CONFIGURACIÓN',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'GRÁFICOS',
          ),
        ],
      ),
    );
  }
}
