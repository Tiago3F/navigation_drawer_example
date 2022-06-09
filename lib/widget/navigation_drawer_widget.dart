import 'package:flutter/material.dart';
import 'package:navigation_drawer_example/page/favourites_page.dart';
import 'package:navigation_drawer_example/page/people_page.dart';
import 'package:navigation_drawer_example/page/user_page.dart';

import '../shared/themes/app_text_styles.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final name = 'Osvaldo Crispim';
    final email = '(Osvaldo Crispim)';
    final urlImage = '../../assets/perfil.jpeg';

    return Drawer(
      child: Container(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("../assets/sidebar.jpg"),
                  fit: BoxFit.cover)),
          child: ListView(
            children: <Widget>[
              buildHeader(
                urlImage: urlImage,
                name: name,
                email: email,
                onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserPage(
                    name: 'Sarah Abs',
                    urlImage: urlImage,
                  ),
                )),
              ),
              Container(
                padding: padding,
                child: Column(
                  children: [
                    // buildSearchField(),
                    Divider(color: Colors.white70),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Pessoal',
                        style: TextStyles.titleRegular,
                      ),
                    ),
                    buildMenuItem(
                      text: 'Organograma',
                      icon: Icons.view_module_sharp,
                      onClicked: () => selectedItem(context, 0),
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      text: 'Formar Organograma',
                      icon: Icons.control_point_duplicate_outlined,
                      onClicked: () => selectedItem(context, 1),
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      text: 'HomeOffice/Covid',
                      icon: Icons.account_circle_rounded,
                      onClicked: () => selectedItem(context, 2),
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      text: 'Meus Subordinados',
                      icon: Icons.supervisor_account_outlined,
                      onClicked: () => selectedItem(context, 3),
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      text: 'Minhas Ocorrências',
                      icon: Icons.file_copy,
                      onClicked: () => selectedItem(context, 4),
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      text: 'Mensagens',
                      icon: Icons.mail,
                      onClicked: () => selectedItem(context, 5),
                    ),
                     Divider(color: Colors.white70),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Relatórios',
                        style: TextStyles.titleRegular,
                      ),
                    ),
                 
                    buildMenuItem(
                      text: 'Controle do Efetivo',
                      icon: Icons.content_paste_search_outlined,
                      onClicked: () => selectedItem(context, 33),
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      text: 'Mapa de Vagas',
                      icon: Icons.map_sharp,
                      onClicked: () => selectedItem(context, 33),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  // Widget buildSearchField() {
  //   final color = Colors.white;

  //   return TextField(
  //     style: TextStyle(color: color),
  //     decoration: InputDecoration(
  //       contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
  //       hintText: 'Search',
  //       hintStyle: TextStyle(color: color),
  //       prefixIcon: Icon(Icons.search, color: color),
  //       filled: true,
  //       fillColor: Colors.white12,
  //       enabledBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(5),
  //         borderSide: BorderSide(color: color.withOpacity(0.7)),
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(5),
  //         borderSide: BorderSide(color: color.withOpacity(0.7)),
  //       ),
  //     ),
  //   );
  // }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PeoplePage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FavouritesPage(),
        ));
        break;
    }
  }
}
