import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/bike_controllers.dart';
import 'package:shoping_app/bike_model.dart';

import 'animation/FadeAnimation.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<BikesController>.value(
        value: BikesController(),
      )
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _buildList() {
    BikesController bikesController = Provider.of<BikesController>(context);
    return GridView.builder(
      itemCount: bikesController.bikes.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return _buildItens(bikesController.bikes[index]);
      },
    );
  }

  _buildItens(BikeModel model,) {
     BikesController bikesController = Provider.of<BikesController>(context);
    return GestureDetector(
      onTap: () {
      bikesController.checkFavortite(model);
      

      },
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: FadeAnimation(
          1.6,
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(model.image),
                  fit: BoxFit.cover,
                )),
            child: FadeAnimation(
              1.6,
              Transform.translate(
                offset: Offset(50, -50),
                child: Container(
                    margin: EdgeInsets.symmetric(vertical: 65, horizontal: 63),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: model.isFavorite
                        ? Icon(
                            Icons.bookmark,
                            size: 15,
                            color: Colors.black,
                          )
                        : Icon(
                            Icons.bookmark_border,
                            size: 15,
                          )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[700],
        appBar: AppBar(
          title: Text('Home'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(Icons.menu),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 35,
                height: 30.0,
                child: Center(
                  child: Icon(Icons.shopping_cart),
                ),
                decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            )
          ],
        ),
        body: Consumer<BikesController>(
          builder: (context, bikesController, widget) {
            return SafeArea(
              child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 250.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://images.unsplash.com/photo-1511994298241-608e28f14fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80'),
                                fit: BoxFit.cover)),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomRight,
                                  colors: [
                                    Colors.black.withOpacity(.4),
                                    Colors.black.withOpacity(.2),
                                  ])),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              FadeAnimation(
                                1,
                                Text(
                                  'Bikes Store',
                                  style: TextStyle(
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                height: 50.0,
                                margin: EdgeInsets.symmetric(horizontal: 40),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: FadeAnimation(
                                    1.2,
                                    Align(
                                      child: Text('Compre Agora',
                                          style: TextStyle(
                                              color: Colors.grey[900],
                                              fontWeight: FontWeight.bold)),
                                    )),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(child: _buildList())
                    ],
                  )),
            );
          },
        ));
  }
}
