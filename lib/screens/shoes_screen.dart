import 'package:flutter/material.dart';
import '../models/shoe_model.dart';
import '../services/shoe_service.dart';
import '../services/marca_service.dart';
import '../models/marca_model.dart';

class ShoesScreen extends StatefulWidget {
  @override
  _ShoesScreenState createState() => _ShoesScreenState();
}

class _ShoesScreenState extends State<ShoesScreen> {
  List<Shoe> shoes = [];
  List<Marca> marcas = [];

  @override
  void initState() {
    super.initState();
    loadShoes();
    loadMarcas();
  }

  void loadShoes() {
    List<Shoe> fetchedShoes = ShoeService.getShoes();
    setState(() {
      shoes = fetchedShoes;
    });
  }

  void loadMarcas() {
    List<Marca> fetchedMarcas = MarcaService.getMarca();
    setState(() {
      marcas = fetchedMarcas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Zapatos'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: shoes.length,
              itemBuilder: (context, index) {
                var marcaId = shoes[index].marca;

                // Verificar que la lista de marcas está cargada y el marcaId es válido
                String marcaName = 'Desconocida';
                if (marcas.isNotEmpty && marcaId >= 0 && marcaId < marcas.length) {
                  marcaName = marcas[marcaId].name;
                }

                return ListTile(
                  title: Text(shoes[index].name),
                  subtitle: Text('Tamaño: ${shoes[index].size}, Marca: $marcaName'),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    print('Zapato seleccionado: ${shoes[index].name}');
                    // Navigator.pushNamed(context, '/marcas');
                  },
                );
              },
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/marcas');
            },
            child: Text('Ver Marcas'),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
