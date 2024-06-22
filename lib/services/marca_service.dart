import '../models/marca_model.dart';

class MarcaService {
  static List<Marca> marcaList = [
    Marca(id: 0, name: 'Nike', descripcion: 'Marca reconocidad a nivel mundial'),
    Marca(id: 1, name: 'Adidas', descripcion: 'Marca reconocidad a nivel mundial'),
  ];

  static List<Marca> getMarca() {
    return marcaList;
  }

  static void addMarca(Marca marca) {
    marcaList.add(marca);
  }
}
