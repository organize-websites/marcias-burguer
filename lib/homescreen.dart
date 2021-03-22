import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_icons/flutter_icons.dart';


void main() {runApp(MaterialApp(
	title: 'Navegação Básica',
	 theme: ThemeData(
	   primarySwatch: Colors.blue[900],
         ),
         home: HomePage(),
      )
    );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marcias Burguer e Pizza',
      theme: ThemeData.light(),
      home: Scaffold(
        key: _scaffoldKey,
        body:
        Container(
          color: Color.fromRGBO(170, 1, 4, 1.0),
          child: 
          CustomScrollView(
            slivers: [
              SliverList(
                delegate: 
                SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Image.asset('imagens/ic_launcher.png', fit: BoxFit.fitWidth,)
                    )
                  ]
                )
              ),
              SliverList(
                delegate: 
                SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                        child: 
                        ListTile(
                          title: Text('Faça Seu Pedido', style: TextStyle(fontSize: 20, color: Color.fromRGBO(170, 1, 4, 1.0)),),
                          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => FacaSeuPedido()));}
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                        child: 
                        ListTile(
                          title: Text('Sobre nos', style: TextStyle(fontSize: 20, color: Color.fromRGBO(170, 1, 4, 1.0)),),
                          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Sobre()));}
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                        child: 
                        ListTile(
                          title: Text('Encontre-nos', style: TextStyle(fontSize: 20, color: Color.fromRGBO(170, 1, 4, 1.0)),),
                          onTap: _launchURL4,
                        ),
                      ),
                    ),
                  ]
                )
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), 
                delegate: SliverChildListDelegate(
                  [
                    IconButton(icon: Icon(FontAwesome5Brands.whatsapp, color: Colors.white), onPressed: _launchURL),
                    IconButton(icon: Icon(FontAwesome5Brands.facebook, color: Colors.white), onPressed: _launchURL2),
                    IconButton(icon: Icon(FontAwesome5Brands.instagram, color: Colors.white), onPressed: _launchURL3),
                  ]
                )
              ),
              SliverList(
                delegate: 
                SliverChildListDelegate(
                  [
                    Container(
                      color: Color.fromRGBO(255, 205, 0, 1.0),
                      child:
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Somos uma empresa de delivery de pizzas e hamburguers e estamos sempre dispostos a entregar o melhor e mais saboroso para nossos clientes.', style: TextStyle(color: Color.fromRGBO(170, 1, 4, 1.0), fontSize: 20, fontWeight: FontWeight.w200), textAlign: TextAlign.center,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Aguardamos seu pedido!!!', style: TextStyle(color: Color.fromRGBO(170, 1, 4, 1.0), fontSize: 20, fontWeight: FontWeight.w200), textAlign: TextAlign.center,),
                            ),
                          ],
                        ),
                      )
                    ),
                  ]
                )
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Center(
                  child: TextButton(
                    child: Image.asset('imagens/ic_launcher.png', fit: BoxFit.fitWidth,),
                    onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('HOME'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
              ),              
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('SOBRE NÓS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Sobre()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.map),
                title: Text('ENCONTRE-NOS'),
                onTap: _launchURL4,
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text('FAÇA SEU PEDIDO'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FacaSeuPedido()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.copyright),
                title: Text('SOBRE O APP'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SobreOApp()));
                        },
              ),
              ListTile(
                leading: Icon(FontAwesome.whatsapp),
                title: Text('WHATSAPP'),
                onTap: _launchURL,
              ),
              ListTile(
                leading: Icon(FontAwesome.facebook),
                title: Text('FACEBOOK'),
                onTap: _launchURL2,
              ),
              ListTile(
                leading: Icon(FontAwesome.instagram),
                title: Text('INSTAGRAM'),
                onTap: _launchURL3,
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('LIGUE PRA GENTE'),
                onTap: _launchURL5,
              ),
              ListTile(
                leading: Icon(Icons.public),
                title: Text('POLÍTICA DE PRIVACIDADE'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PoliticaDePrivacidade()));
                        },
              ),
            ],
          ),
        ),
        bottomNavigationBar: 
        BottomNavigationBar(
          selectedItemColor: Colors.grey[800],
          unselectedItemColor: Colors.grey[800],
          items: [
            BottomNavigationBarItem(
              icon: IconButton(icon: Icon(Icons.home), onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));},),
              label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: IconButton(icon: Icon(Icons.menu), onPressed: () => _scaffoldKey.currentState.openDrawer(),),
              label: 'Menu'
            ),
            BottomNavigationBarItem(
              icon: IconButton(icon: Icon(Icons.exit_to_app), onPressed: (){exit(0);},),
              label: 'Sair'
            ),
          ],
        ),
      ),
    );
  }
}

class FacaSeuPedido extends StatefulWidget {
  @override
  _FacaSeuPedidoState createState() => _FacaSeuPedidoState();
}

class _FacaSeuPedidoState extends State<FacaSeuPedido> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isLoading = false;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override

      void initState() {
        setState(() {
          isLoading = true;
        });
        super.initState();
      }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: 'https://www.nsystem.tec.br/marcias/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
         );
         
      }),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Center(
                  child: TextButton(
                    child: Image.asset('imagens/ic_launcher.png', fit: BoxFit.fitWidth,),
                    onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('HOME'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
              ),              
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('SOBRE NÓS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Sobre()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.map),
                title: Text('ENCONTRE-NOS'),
                onTap: _launchURL4,
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text('FAÇA SEU PEDIDO'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FacaSeuPedido()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.copyright),
                title: Text('SOBRE O APP'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SobreOApp()));
                        },
              ),
              ListTile(
                leading: Icon(FontAwesome.whatsapp),
                title: Text('WHATSAPP'),
                onTap: _launchURL,
              ),
              ListTile(
                leading: Icon(FontAwesome.facebook),
                title: Text('FACEBOOK'),
                onTap: _launchURL2,
              ),
              ListTile(
                leading: Icon(FontAwesome.instagram),
                title: Text('INSTAGRAM'),
                onTap: _launchURL3,
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('LIGUE PRA GENTE'),
                onTap: _launchURL5,
              ),
              ListTile(
                leading: Icon(Icons.public),
                title: Text('POLÍTICA DE PRIVACIDADE'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PoliticaDePrivacidade()));
                        },
              ),
            ],
          ),
        ),
        bottomNavigationBar: 
        BottomNavigationBar(
          selectedItemColor: Colors.grey[800],
          unselectedItemColor: Colors.grey[800],
          items: [
            BottomNavigationBarItem(
              icon: IconButton(icon: Icon(Icons.home), onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));},),
              label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: IconButton(icon: Icon(Icons.menu), onPressed: () => _scaffoldKey.currentState.openDrawer(),),
              label: 'Menu'
            ),
            BottomNavigationBarItem(
              icon: IconButton(icon: Icon(Icons.exit_to_app), onPressed: (){exit(0);},),
              label: 'Sair'
            ),
          ],
        ),
    );
  }
}

class Sobre extends StatefulWidget {
  @override
  _SobreState createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marcias Burguer e Pizza',
      theme: ThemeData.light(),
      home: Scaffold(
        key: _scaffoldKey,
        body:
        Container(
          color: Color.fromRGBO(170, 1, 4, 1.0),
          child: 
          CustomScrollView(
            slivers: [
              SliverList(
                delegate: 
                SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Image.asset('imagens/ic_launcher.png', fit: BoxFit.fitWidth,)
                    )
                  ]
                )
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), 
                delegate: SliverChildListDelegate(
                  [
                    IconButton(icon: Icon(FontAwesome5Brands.whatsapp, color: Colors.white), onPressed: _launchURL),
                    IconButton(icon: Icon(FontAwesome5Brands.facebook, color: Colors.white), onPressed: _launchURL2),
                    IconButton(icon: Icon(FontAwesome5Brands.instagram, color: Colors.white), onPressed: _launchURL3),
                  ]
                )
              ),
              SliverList(
                delegate: 
                SliverChildListDelegate(
                  [
                    Container(
                      color: Color.fromRGBO(255, 205, 0, 1.0),
                      child:
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Somos uma empresa de delivery de pizzas e hamburguers e estamos sempre dispostos a entregar o melhor e mais saboroso para nossos clientes.', style: TextStyle(color: Color.fromRGBO(170, 1, 4, 1.0), fontSize: 20, fontWeight: FontWeight.w200), textAlign: TextAlign.center,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Aguardamos seu pedido!!!', style: TextStyle(color: Color.fromRGBO(170, 1, 4, 1.0), fontSize: 20, fontWeight: FontWeight.w200), textAlign: TextAlign.center,),
                            ),
                          ],
                        ),
                      )
                    ),
                  ]
                )
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Center(
                  child: TextButton(
                    child: Image.asset('imagens/ic_launcher.png', fit: BoxFit.fitWidth,),
                    onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('HOME'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
              ),              
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('SOBRE NÓS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Sobre()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.map),
                title: Text('ENCONTRE-NOS'),
                onTap: _launchURL4,
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text('FAÇA SEU PEDIDO'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FacaSeuPedido()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.copyright),
                title: Text('SOBRE O APP'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SobreOApp()));
                        },
              ),
              ListTile(
                leading: Icon(FontAwesome.whatsapp),
                title: Text('WHATSAPP'),
                onTap: _launchURL,
              ),
              ListTile(
                leading: Icon(FontAwesome.facebook),
                title: Text('FACEBOOK'),
                onTap: _launchURL2,
              ),
              ListTile(
                leading: Icon(FontAwesome.instagram),
                title: Text('INSTAGRAM'),
                onTap: _launchURL3,
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('LIGUE PRA GENTE'),
                onTap: _launchURL5,
              ),
              ListTile(
                leading: Icon(Icons.public),
                title: Text('POLÍTICA DE PRIVACIDADE'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PoliticaDePrivacidade()));
                        },
              ),
            ],
          ),
        ),
        bottomNavigationBar: 
        BottomNavigationBar(
          selectedItemColor: Colors.grey[800],
          unselectedItemColor: Colors.grey[800],
          items: [
            BottomNavigationBarItem(
              icon: IconButton(icon: Icon(Icons.home), onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));},),
              label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: IconButton(icon: Icon(Icons.menu), onPressed: () => _scaffoldKey.currentState.openDrawer(),),
              label: 'Menu'
            ),
            BottomNavigationBarItem(
              icon: IconButton(icon: Icon(Icons.exit_to_app), onPressed: (){exit(0);},),
              label: 'Sair'
            ),
          ],
        ),
      ),
    );
  }
}

class SobreOApp extends StatefulWidget {
  @override
  _SobreOAppState createState() => _SobreOAppState();
}

class _SobreOAppState extends State<SobreOApp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marcias Burguer e Pizza',
      theme: ThemeData.light(),
      home: Scaffold(
        key: _scaffoldKey,
        body:
        Container(
          color: Colors.white,
          child: 
          CustomScrollView(
            slivers: [
              SliverList(
                delegate: 
                SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Image.asset('imagens/ic_launcher.png', fit: BoxFit.fitWidth,)
                    )
                  ]
                )
              ),
              SliverList(
                delegate: 
                SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Marcias Burguer v1.0.0', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200), textAlign: TextAlign.center,),
                          ),
                        ],
                      ),
                    ),
                  ]
                )
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Center(
                  child: TextButton(
                    child: Image.asset('imagens/ic_launcher.png', fit: BoxFit.fitWidth,),
                    onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('HOME'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
              ),              
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('SOBRE NÓS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Sobre()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.map),
                title: Text('ENCONTRE-NOS'),
                onTap: _launchURL4,
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text('FAÇA SEU PEDIDO'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FacaSeuPedido()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.copyright),
                title: Text('SOBRE O APP'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SobreOApp()));
                        },
              ),
              ListTile(
                leading: Icon(FontAwesome.whatsapp),
                title: Text('WHATSAPP'),
                onTap: _launchURL,
              ),
              ListTile(
                leading: Icon(FontAwesome.facebook),
                title: Text('FACEBOOK'),
                onTap: _launchURL2,
              ),
              ListTile(
                leading: Icon(FontAwesome.instagram),
                title: Text('INSTAGRAM'),
                onTap: _launchURL3,
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('LIGUE PRA GENTE'),
                onTap: _launchURL5,
              ),
              ListTile(
                leading: Icon(Icons.public),
                title: Text('POLÍTICA DE PRIVACIDADE'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PoliticaDePrivacidade()));
                        },
              ),
            ],
          ),
        ),
        bottomNavigationBar: 
        BottomNavigationBar(
          selectedItemColor: Colors.grey[800],
          unselectedItemColor: Colors.grey[800],
          items: [
            BottomNavigationBarItem(
              icon: IconButton(icon: Icon(Icons.home), onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));},),
              label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: IconButton(icon: Icon(Icons.menu), onPressed: () => _scaffoldKey.currentState.openDrawer(),),
              label: 'Menu'
            ),
            BottomNavigationBarItem(
              icon: IconButton(icon: Icon(Icons.exit_to_app), onPressed: (){exit(0);},),
              label: 'Sair'
            ),
          ],
        ),
      ),
    );
  }
}

class PoliticaDePrivacidade extends StatefulWidget {
  @override
  _PoliticaDePrivacidadeState createState() => _PoliticaDePrivacidadeState();
}

class _PoliticaDePrivacidadeState extends State<PoliticaDePrivacidade> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isLoading = false;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override

      void initState() {
        setState(() {
          isLoading = true;
        });
        super.initState();
      }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: 'https://organizewebsites.com.br/privacidade-apps',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
         );
         
      }),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Center(
                  child: TextButton(
                    child: Image.asset('imagens/ic_launcher.png', fit: BoxFit.fitWidth,),
                    onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('HOME'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
              ),              
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('SOBRE NÓS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Sobre()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.map),
                title: Text('ENCONTRE-NOS'),
                onTap: _launchURL4,
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text('FAÇA SEU PEDIDO'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FacaSeuPedido()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.copyright),
                title: Text('SOBRE O APP'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SobreOApp()));
                        },
              ),
              ListTile(
                leading: Icon(FontAwesome.whatsapp),
                title: Text('WHATSAPP'),
                onTap: _launchURL,
              ),
              ListTile(
                leading: Icon(FontAwesome.facebook),
                title: Text('FACEBOOK'),
                onTap: _launchURL2,
              ),
              ListTile(
                leading: Icon(FontAwesome.instagram),
                title: Text('INSTAGRAM'),
                onTap: _launchURL3,
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('LIGUE PRA GENTE'),
                onTap: _launchURL5,
              ),
              ListTile(
                leading: Icon(Icons.public),
                title: Text('POLÍTICA DE PRIVACIDADE'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PoliticaDePrivacidade()));
                        },
              ),
            ],
          ),
        ),
        bottomNavigationBar: 
        BottomNavigationBar(
          selectedItemColor: Colors.grey[800],
          unselectedItemColor: Colors.grey[800],
          items: [
            BottomNavigationBarItem(
              icon: IconButton(icon: Icon(Icons.home), onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));},),
              label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: IconButton(icon: Icon(Icons.menu), onPressed: () => _scaffoldKey.currentState.openDrawer(),),
              label: 'Menu'
            ),
            BottomNavigationBarItem(
              icon: IconButton(icon: Icon(Icons.exit_to_app), onPressed: (){exit(0);},),
              label: 'Sair'
            ),
          ],
        ),
    );
  }
}




_launchURL() async {
  const url = 'http://wa.me/5516992624708&text=';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL2() async {
  const url = 'fb://page/514395472067838/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL3() async {
  const url = 'instagram://user?username=marcia_pizzas_e_burgers';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL4() async {
  const url = 'https://www.google.com/maps/place/Av.+Jamil+Said+Ahmed+Salim,+479,+Barrinha+-+SP,+14860-000/@-21.1917528,-48.1577328,17z/data=!3m1!4b1!4m5!3m4!1s0x94b9747970f86521:0x1f3218a62a3d2049!8m2!3d-21.1917528!4d-48.1555441';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL5() async {
  const url = 'tel:1639432712';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture)
      : assert(_webViewControllerFuture != null);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady =
            snapshot.connectionState == ConnectionState.done;
        final WebViewController controller = snapshot.data;
        return Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: !webViewReady
                  ? null
                  : () async {
                      if (await controller.canGoBack()) {
                        await controller.goBack();
                      } else {
                        ScaffoldMessenger(
                          child:
                          const SnackBar(content: Text("No back history item")),
                        );
                        return;
                      }
                    },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: !webViewReady
                  ? null
                  : () async {
                      if (await controller.canGoForward()) {
                        await controller.goForward();
                      } else {
                        ScaffoldMessenger(
                          child:
                          const SnackBar(
                              content: Text("No forward history item")),
                        );
                        return;
                      }
                    },
            ),
            IconButton(
              icon: const Icon(Icons.replay),
              onPressed: !webViewReady
                  ? null
                  : () {
                      controller.reload();
                    },
            ),
          ],
        );
      },
    );
  }
}