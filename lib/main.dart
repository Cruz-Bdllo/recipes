import 'package:flutter/material.dart';
import 'package:recipes/model/recipe.dart';
import 'package:recipes/recipe_detail.dart';

/**
 * Punto de entrada, este método lonza la aplicación pasada en su parámetro
 * Al parecer las 2 primeras clases usan el método build que retorna el objeto
 * Widget.
 */
void main() {
  runApp(const RecipeApp());
}

/**
 * 1 - Clase principal donde esta creado el Widget
 */
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
       Esta variable permite determinar los aspectos visuales, por defecto
       mostrara Standard Material.
       */
      theme: themeData.copyWith(
        colorScheme: themeData.colorScheme.copyWith(
          primary: Colors.blueAccent,
          secondary: Colors.black
        )
      ),
      home: const MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

/**
 * 2 - Clase para manejar los estilos estilos y contenedores del Widget
 */
class _MyHomePageState extends State<MyHomePage> {

  /**
   * Creamos un widget que use Card Widget.
   * Create a Card that provide a container for recipes.
   */
  Widget buildRecipeCard(Recipe recipe) {
    return Card( // Card es también un widget
      // Colum: es un widget que define un diseño vertical y este widget tiene
      // 2 children (Image y Text)
      elevation: 2.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            children: <Widget>[
              Image(image: AssetImage(recipe.imgUrl)),
              const SizedBox(
                height: 14.0,
              ),
              Text(
                recipe.lable,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Palatino'
                ),
              )
            ],
          )
      ),
    );
  } // end card


  @override
  Widget build(BuildContext context) {

    /**
     * Proporciona una estructura de alto nivel para una ventana, en este caso
     * usando 2 propiedades.
     */
    return Scaffold(

    /**
     * Aqui tomamos el valor de el objeto MyHomePage que fue creado por
     * el método RecipeApp.build, y usado para establecer el titulo de la barra
     * superior.
     */
      appBar: AppBar(
          title: Text(widget.title),
      ),

      /**
       * SafeArea: Evita que la aplicación se acerque demasiado a las
       * interfaces del sistema operativo, como la muesca o áreas interactivas
       * como el indicador de inicio en la parte inferior de algunas pantallas
       * de iOS.
       */
      body: SafeArea(

        /**
         * Cuerpo del widget
         */
        // Builds a list using
        child: ListView.builder(
            // determines the number of rows the list has
            itemCount: Recipe.sampleRecipes.length,

            // builds the widget tree for each row
            itemBuilder: (BuildContext context, int index) {
              // Agregar evento Tap sobre la card
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return RecipeDetail(recipe: Recipe.sampleRecipes[index]);
                      })
                  );
                },
                // Displays the recipe using a custom Card Widget
                child: buildRecipeCard(Recipe.sampleRecipes[index]),
              );
            },
          ),
      ),


    );
  }
}

/**
 * 3 - Clase para manejar los estados del Widget
 */
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
