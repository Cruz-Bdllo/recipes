import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipes/model/recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetail({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  _RecipeDetailState createState() {
    return _RecipeDetailState();
  }
}

class _RecipeDetailState extends State<RecipeDetail> {
  // Se actualiza de manera reactiva al usar el slider
  int _sliderValue = 1;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.lable),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.recipe.imgUrl),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.recipe.lable,
              style: const TextStyle(fontSize: 18),
            ),
            /**
             * Se expande para llenar el espacio en una columna. De esta manera,
             * la lista de ingredientes ocupará el espacio que no llenan los
             * otros widgets
             */
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(7.0),
                itemCount: widget.recipe.ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  final ingredient = widget.recipe.ingredients[index];
                  return Text('${_sliderValue * ingredient.quantity} ${ingredient.measure} ${ingredient.name}');
                }
              ),
            ),
            Slider(
              min: 1,
              max: 10,
              divisions: 10,
              value: _sliderValue.toDouble(),
              label: '${_sliderValue * widget.recipe.servings} servings',
              onChanged: (double value) {
                setState(() {
                  _sliderValue = value.round();
                });
              },
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
            )
          ],
        ),
      ),
    );
  }

} // end widget