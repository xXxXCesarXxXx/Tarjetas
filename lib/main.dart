import 'package:flutter/material.dart';

void main() {
  // Inicia la aplicación
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Configura el título de la aplicación
      title: 'Reseñas',
      // Configura el tema de la aplicación
      theme: ThemeData(
        // Define el esquema de color
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        // Habilita el uso de Material 3
        useMaterial3: true,
      ),
      // Define la página de inicio de la aplicación
      home: const MyHomePage(title: 'Reseñas'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Configura la barra de aplicación
      appBar: AppBar(
        // Define el fondo de la barra de aplicación
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Define el título de la barra de aplicación
        title: Text(title),
      ),
      // Define el cuerpo de la página de inicio
      body: ListView(
        // Define los elementos del cuerpo de la página de inicio
        children: [
          ReviewCard(
            // Define las propiedades de la tarjeta de reseña
            name: 'Strawberry Pavlova',
            rating: 10,
            review: 'Un strawberry pavlova es un postre que consiste en un merengue crujiente por fuera y suave por dentro, cubierto con crema batida y fresas frescas.',
            imageUrl: 'http://canalcocina.es/medias/publicuploads/2015/02/06/133502/54d4d587cdc83-tarta-de-cereza-y-chocolate-blanco-1.jpg',
            prepTime: '25 min',
            cookTime: '1 hr',
            feeds: '4-6',
          ),
        ],
      ),
    );
  }
}

// Define la clase ReviewCard como un widget sin estado
class ReviewCard extends StatelessWidget {
  // Declara las propiedades de la clase
  final String name; // Nombre del platillo
  final int rating; // Calificación del platillo
  final String review; // Reseña del platillo
  final String imageUrl; // URL de la imagen del platillo
  final String prepTime; // Tiempo de preparación del platillo
  final String cookTime; // Tiempo de cocción del platillo
  final String feeds; // Número de porciones del platillo

  // Constructor de la clase
  ReviewCard({
    required this.name,
    required this.rating,
    required this.review,
    required this.imageUrl,
    required this.prepTime,
    required this.cookTime,
    required this.feeds,
  });

  // Método build del widget
  @override
  Widget build(BuildContext context) {
    // Crea un contenedor con un margen alrededor
    return Container(
      margin: EdgeInsets.all(10.0),
      // Crea una tarjeta con el contenedor como hijo
      child: Card(
        // Define el contenido de la tarjeta
        child: Column(
          // Alinea los elementos a lo ancho de la tarjeta
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // Define los elementos de la tarjeta
          children: [
            // Imagen del platillo
            Image.network(
              // URL de la imagen
              imageUrl,
              // Establece la altura de la imagen
              height: 200.0,
              // Ajusta la imagen al ancho y alto disponibles
              fit: BoxFit.cover,
            ),
            // Encabezado de la tarjeta con el nombre del platillo en negritas
            ListTile(
              leading: Icon(Icons.cake, color: Colors.brown), // Icono de pastel
              title: Text.rich(
                TextSpan(
                  text: ' ',
                  children: [
                    TextSpan(
                      text: name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              // Subtítulo de la tarjeta con la calificación, tiempo de preparación, tiempo de cocción y número de porciones
              subtitle: Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 20,), // Icono de estrella
                  Text('$rating '), // Calificación del platillo
                  SizedBox(width: 10), // Espacio entre la calificación y el tiempo de preparación
                  Icon(Icons.schedule, size: 20, color: Colors.green), // Icono de reloj
                  Text(' $prepTime   '), // Tiempo de preparación
                  Icon(Icons.timelapse, size: 20, color: Colors.green), // Icono de reloj
                  Text(' $cookTime'), // Tiempo de cocción
                  SizedBox(width: 10), // Espacio entre el tiempo de cocción y el número de porciones
                  Icon(Icons.restaurant, color: Colors.green, size: 20,), // Icono de restaurante
                  Text(' Piezas: $feeds'), // Número de porciones
                ],
              ),
            ),
            // Reseña del platillo
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(review),
            ),
          ],
        ),
      ),
    );
  }
}