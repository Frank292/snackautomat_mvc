import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snackautomat/controller/_register_controller.dart';
import 'package:snackautomat/controller/main_controller.dart';
import 'package:snackautomat/objects/product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MainController con = MainController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Snackautomat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(con),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MainController con;
  MyHomePage(this.con);

  @override
  _MyHomePageState createState() => _MyHomePageState(con);
}

class _MyHomePageState extends State<MyHomePage> {
  MainController con;
  _MyHomePageState(this.con);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Snackautomat'),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Flex(
                direction: Axis.horizontal,
                children: [
                  Flexible(
                    flex: 3,
                    child: Container(
                      color: Colors.black,
                      padding: EdgeInsets.all(3),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [Colors.green[700]!, Colors.blue])),
                        child: Flex(
                          direction: Axis.vertical,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                child: GridView.count(
                                  crossAxisCount: 3,
                                  children: [
                                    ..._buildSnackBoxes(
                                      con,
                                      [
                                        Product(
                                          slotID: 1,
                                          price: 150,
                                          image: Image.asset(
                                            'assets/images/chips.png',
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                        Product(
                                          slotID: 2,
                                          price: 90,
                                          image: Image.asset(
                                            'assets/images/yummyBar.png',
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Container(
                                  color: Colors.black,
                                  padding: EdgeInsets.all(3),
                                  child: Stack(
                                    children: [
                                      Flex(
                                        direction: Axis.vertical,
                                        children: [
                                          Flexible(
                                            flex: 5,
                                            child: Container(
                                              color: Colors.grey[800],
                                            ),
                                          ),
                                          Flexible(
                                            flex: 3,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    begin:
                                                        Alignment.bottomCenter,
                                                    end: Alignment.topCenter,
                                                    colors: [
                                                      Colors.grey,
                                                      Colors.grey[800]!
                                                    ]),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: double.infinity,
                                        width: double.infinity,
                                        child: _functionBox(
                                            function: con.takeSnack,
                                            image: con
                                                .producedProducts.last.image),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: double.infinity,
                      color: Colors.red,
                      child: Flex(
                        direction: Axis.vertical,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              color: Colors.black,
                              padding: EdgeInsets.fromLTRB(0, 3, 3, 3),
                              child: Column(
                                children: [
                                  _displayBox('${con.message1}'),
                                  _displayBox('${con.message2}'),
                                ],
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 5,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 3, 3),
                              color: Colors.black,
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                color: Colors.orange,
                                child: GridView.count(
                                  crossAxisCount: 2,
                                  children: [
                                    _coinButton(200),
                                    _coinButton(100),
                                    _coinButton(50),
                                    _coinButton(20),
                                    _coinButton(10),
                                    _coinButton(5),
                                    _coinButton(2),
                                    _coinButton(1),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Container(
                          //   color: Colors.black,
                          //   padding: EdgeInsets.fromLTRB(0, 0, 3, 0),
                          //   child: Container(
                          //     color: Colors.red,
                          //     child: Flex(
                          //       direction: Axis.horizontal,
                          //       children: [
                          //         Flexible(child: _coinButton(200)),
                          //         Flexible(child: _coinButton(100)),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // Container(
                          //   color: Colors.black,
                          //   padding: EdgeInsets.fromLTRB(0, 0, 3, 0),
                          //   child: Container(
                          //     color: Colors.red,
                          //     child: Flex(
                          //       direction: Axis.horizontal,
                          //       children: [
                          //         Flexible(child: _coinButton(50)),
                          //         Flexible(child: _coinButton(20)),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // Container(
                          //   color: Colors.black,
                          //   padding: EdgeInsets.fromLTRB(0, 0, 3, 0),
                          //   child: Container(
                          //     color: Colors.red,
                          //     child: Flex(
                          //       direction: Axis.horizontal,
                          //       children: [
                          //         Flexible(child: _coinButton(10)),
                          //         Flexible(child: _coinButton(5)),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // Container(
                          //   color: Colors.black,
                          //   padding: EdgeInsets.fromLTRB(0, 0, 3, 3),
                          //   child: Container(
                          //     color: Colors.red,
                          //     child: Flex(
                          //       direction: Axis.horizontal,
                          //       children: [
                          //         Flexible(child: _coinButton(2)),
                          //         Flexible(child: _coinButton(1)),
                          //       ],
                          //     ),
                          //   ),

                          Expanded(
                            flex: 2,
                            child: Stack(
                              children: [
                                Container(
                                  color: Colors.black,
                                  padding: EdgeInsets.fromLTRB(0, 0, 3, 3),
                                  child: Flex(
                                    direction: Axis.vertical,
                                    children: [
                                      Flexible(
                                        flex: 5,
                                        child: Container(
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                      Flexible(
                                        flex: 3,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                                colors: [
                                                  Colors.grey,
                                                  Colors.grey[800]!
                                                ]),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: _functionBox(
                                      function: con.takePayout,
                                      text: '${con.payoutSum}'),
                                ),
                              ],
                            ),
                          ),
                          _functionBox(
                              function: con.adminMode, text: 'Admin Mode'),
                          _functionBox(
                              function: con.emptyCoinBag, text: 'Empty Bag'),
                          Expanded(
                            flex: 5,
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              _displayInventory(con.guiData.isInventoryOpen),
            ],
          ),
        ),
      );

  Widget _displayInventory(bool isInventoryOpen) {
    if (isInventoryOpen == false) {
      return Align(
        alignment: Alignment.bottomRight,
        child: Container(
          padding: EdgeInsets.all(20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.brown[600],
              child: _functionBox(
                function: con.setInventoryOpen,
                image: Image.asset('assets/images/chips.png'),
              ),
            ),
          ),
        ),
      );
    }

    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        padding: EdgeInsets.all(20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Colors.brown[600],
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: GridView.count(
                    crossAxisCount: 4,
                    children: [
                      ..._buildInventory(),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    child: _functionBox(
                      function: con.setInventoryOpen,
                      icon: Icons.cancel,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildInventory() {
    List<Widget> list = [];
    for (var i = 0; i < con.inventory.length; i++) {
      list.add(
        Container(
          child: _functionBox(
              function: con.eatSnack,
              parameter: con.inventory[i],
              image: con.inventory[i].image),
        ),
      );
    }
    for (var i = 0; i < con.wallet.length; i++) {
      list.add(
        Container(
          child: _coinButton(con.wallet[i]),
        ),
      );
    }
    return list;
  }

  Widget _displayBox(String text) => Expanded(
        child: Container(
          color: Colors.green[800],
          child: Center(
            child: Text(
              '$text',
              textAlign: TextAlign.center,
              textScaleFactor: 0.8,
            ),
          ),
        ),
      );

  Widget _functionBox({
    Function? function,
    var parameter,
    String text = '',
    Image? image,
    IconData? icon,
  }) {
    function ??= () => {};
    Widget? buttonChild;

    if (icon != null) buttonChild = Icon(icon);
    if (text != '') buttonChild = Text(text);
    buttonChild ??= image ?? Container();

    return Container(
      child: TextButton(
        child: buttonChild,
        onPressed: () {
          setState(
            () {
              if (parameter == null) {
                function!();
              } else {
                function!(parameter);
              }
            },
          );
        },
      ),
    );
  }

  Widget _coinButton(int denomination) => ClipRRect(
        borderRadius: BorderRadius.circular(99),
        child: Container(
          color: Colors.black,
          padding: const EdgeInsets.all(2.5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: Container(
              color: Colors.yellow,
              child: TextButton(
                child: Text('$denomination'),
                onPressed: () {
                  setState(
                    () {
                      con.insertCoin(denomination);
                    },
                  );
                },
              ),
            ),
          ),
        ),
      );

  List<Widget> _buildSnackBoxes(MainController con, List<Product> products) {
    List<Widget> boxes = [];
    for (var i = 1; i <= products.length; i++) {
      boxes.add(_snackBox(con, i, products[i - 1]));
    }
    return boxes;
  }

  Widget _snackBox(MainController con, int slot, Product product) => Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          color: Colors.black,
          padding: EdgeInsets.all(3),
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.grey[800],
                      )),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.grey[800],
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [Colors.grey, Colors.grey[800]!]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: Stack(
                  children: [
                    Center(
                      child: product.image,
                    ),
                    Container(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          '${product.price}',
                          style: const TextStyle(color: Colors.black87),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(
                          () {
                            con.selectProduct(product);
                          },
                        );
                      },
                      child: Container(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
