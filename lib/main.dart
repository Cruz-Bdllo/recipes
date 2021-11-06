import 'package:flutter/material.dart';

/**
 * Punto de entrada, este método lonza la aplicación pasada en su parámetro
 */
void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key}) : super(key: key);

  // Este widget es la raiz de tu aplicación.
  // Permite hacer un widget el método build
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData();
    /*
    * Al retornar MaterialApp => Material Design este widget será incluido en
    * RecipeApp
    * */
    return MaterialApp(
      title: 'Recipe Calculator',

      /*
       Esta propiedad permite determinar los aspectos visuales, por defecto
       mostrara Standard Material.
       */
      theme: themeData.copyWith(
        colorScheme: themeData.colorScheme.copyWith(
          primary: Colors.grey,
          secondary: Colors.black
        )
      ),
      home: const MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  /**
   * Este metodo esta ejecutandose siempre, cada vez que el setState es llamado
   */
  @override
  Widget build(BuildContext context) {

    /**
     * Un Scaffold proporciona una estructura de alto nivel para una ventana,
     * dentro tendrá las propiedades de la misma que vas a usar.
     */
    return Scaffold(

      /**
       * AppVar obtiene la propiedad del titulo usando la clase "Text" del widget
       * El valor del titulo es pasado desde home: MyHomePage(title: 'asdad') en
       * Recipe.build().
       */
      appBar: AppBar(
        title: Text(widget.title)
      ),

      /**
       * SafeArea: Evita que la aplicación se acerque demasiado a las
       * interfaces del sistema operativo, como la muesca o áreas interactivas
       * como el indicador de inicio en la parte inferior de algunas pantallas
       * de iOS.
       */
      body: SafeArea(
        child: Container(),
      ),

    );
  }
}
