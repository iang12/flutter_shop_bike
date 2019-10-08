import 'package:flutter/foundation.dart';
import 'package:shoping_app/bike_model.dart';

class BikesController extends ChangeNotifier{

  List <BikeModel>  bikes = [
    BikeModel(modelo:"Aro 29",isFavorite: true,image:'https://images.unsplash.com/photo-1545974452-caa213f76132?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80' ),
    BikeModel(modelo:"Aro 29",isFavorite: true,image:'https://images.unsplash.com/photo-1485965120184-e220f721d03e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80' ),
    BikeModel(modelo:"Aro 29",isFavorite: false,image:'https://images.unsplash.com/photo-1511994298241-608e28f14fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80' ),
    BikeModel(modelo:"Aro 29",isFavorite: false,image:'https://images.unsplash.com/photo-1541584285245-c83a93cce0e8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=751&q=8' ),
    BikeModel(modelo:"Aro 29",isFavorite: false,image:'https://images.unsplash.com/photo-1532298229144-0ec0c57515c7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=708&q=80' ),
    BikeModel(modelo:"Aro 29",isFavorite: false,image:'https://images.unsplash.com/photo-1505705694340-019e1e335916?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=889&q=80' ),
    BikeModel(modelo:"Aro 29",isFavorite: true,image:'https://images.unsplash.com/photo-1542397680-c1450496a750?ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80' ),
    BikeModel(modelo:'Arro',isFavorite: false,image:'https://images.unsplash.com/photo-1466201071558-2242fb1d130d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80')
  ];

  checkFavortite(BikeModel model){
    model.isFavorite = !model.isFavorite;
    notifyListeners();
  }
}

