// services/shoe_service.dart

import '../models/shoe_model.dart';

class ShoeService {
  static List<Shoe> shoeList = [
    Shoe(name: 'Nike Air Max', size: '42', marca: 0),
    Shoe(name: 'Adidas Ultraboost', size: '40', marca: 1),
    Shoe(name: 'Nike Running', size: '41', marca: 0),
  ];

  static List<Shoe> getShoes() {
    return shoeList;
  }

  static void addShoe(Shoe shoe) {
    shoeList.add(shoe);
  }
}
