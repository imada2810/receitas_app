import 'package:flutter/material.dart';

void main() {
  runApp(ReceitasApp());
}

class ReceitasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receitas Fitness',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Color(0xFFF0F4F8),
        textTheme: TextTheme(
          titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          bodyMedium: TextStyle(fontSize: 16, height: 1.4, color: Colors.black87),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green[700],
          centerTitle: true,
          elevation: 2,
          titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        cardTheme: CardTheme(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          color: Colors.white,
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> receitas = [
    {
      'nome': 'Panqueca de Banana com Aveia',
      'descricao': 'Rica em fibras e sem açúcar. Ideal para o café da manhã.',
      'ingredientes': [
        '1 banana madura',
        '2 colheres de sopa de aveia',
        '2 ovos',
        '1 pitada de canela',
      ],
      'modo_preparo': [
        'Amasse a banana até formar um purê.',
        'Misture a aveia, os ovos e a canela com a banana amassada.',
        'Aqueça uma frigideira antiaderente e despeje a massa em porções.',
        'Cozinhe cada lado por cerca de 2 minutos até dourar.',
      ],
    },
    {
      'nome': 'Crepioca de Frango',
      'descricao': 'Fonte de proteína e baixa em carboidratos.',
      'ingredientes': [
        '2 colheres de sopa de goma de tapioca',
        '1 ovo',
        '100g de frango desfiado',
        'Sal e temperos a gosto',
      ],
      'modo_preparo': [
        'Misture a goma de tapioca e o ovo até formar uma massa homogênea.',
        'Adicione o frango desfiado e tempere a gosto.',
        'Despeje a massa na frigideira aquecida e cozinhe até firmar.',
        'Dobre e sirva quente.',
      ],
    },
    {
      'nome': 'Smoothie de Morango com Proteína',
      'descricao': 'Bebida pós-treino refrescante e nutritiva.',
      'ingredientes': [
        '1 xícara de morangos frescos',
        '1 scoop de proteína em pó sabor baunilha',
        '200 ml de leite de amêndoas',
        'Gelo a gosto',
      ],
      'modo_preparo': [
        'Coloque todos os ingredientes no liquidificador.',
        'Bata até obter uma mistura homogênea.',
        'Sirva gelado.',
      ],
    },
    {
      'nome': 'Omelete de Claras com Espinafre',
      'descricao': 'Baixo em calorias, ótimo para o jantar.',
      'ingredientes': [
        '4 claras de ovo',
        '1 xícara de espinafre picado',
        'Sal e pimenta a gosto',
        '1 colher de chá de azeite',
      ],
      'modo_preparo': [
        'Bata as claras com sal e pimenta.',
        'Aqueça o azeite em uma frigideira.',
        'Refogue o espinafre rapidamente.',
        'Adicione as claras batidas e cozinhe até firmar.',
        'Dobre a omelete e sirva.',
      ],
    },
    {
      'nome': 'Brownie Fit de Batata-Doce',
      'descricao': 'Sobremesa saudável sem farinha branca.',
      'ingredientes': [
        '1 xícara de batata-doce cozida e amassada',
        '2 colheres de sopa de cacau em pó',
        '2 ovos',
        '2 colheres de sopa de mel',
      ],
      'modo_preparo': [
        'Pré-aqueça o forno a 180°C.',
        'Misture todos os ingredientes até formar uma massa homogênea.',
        'Coloque a massa em uma forma pequena untada.',
        'Asse por cerca de 25 minutos ou até firmar.',
        'Deixe esfriar antes de cortar e servir.',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receitas Fitness'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 8),
        itemCount: receitas.length,
        itemBuilder: (context, index) {
          final receita = receitas[index];
          return Card(
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              title: Text(
                receita['nome'],
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: Colors.green[800]),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  receita['descricao'],
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.green[700], size: 18),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetalhesReceitaPage(receita: receita),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetalhesReceitaPage extends StatelessWidget {
  final Map<String, dynamic> receita;

  DetalhesReceitaPage({required this.receita});

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8),
      child: Text(title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.green[800],
          )),
    );
  }

  Widget _buildList(List<dynamic> items, {bool withIcon = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map<Widget>((item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (withIcon)
                      Padding(
                        padding: const EdgeInsets.only(top: 3, right: 10),
                        child: Icon(Icons.check_circle_outline, color: Colors.green, size: 20),
                      ),
                    Expanded(
                      child: Text(
                        item,
                        style: TextStyle(fontSize: 16, height: 1.4),
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ingredientes = receita['ingredientes'] as List<dynamic>? ?? [];
    final modoPreparo = receita['modo_preparo'] as List<dynamic>? ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(receita['nome']),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(receita['descricao'],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black87)),
            Divider(height: 30, thickness: 1, color: Colors.green[300]),
            _buildSectionTitle('Ingredientes'),
            _buildList(ingredientes),
            Divider(height: 30, thickness: 1, color: Colors.green[300]),
            _buildSectionTitle('Modo de Preparo'),
            _buildList(modoPreparo, withIcon: false),
          ],
        ),
      ),
    );
  }
}
