import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;
  var _purple = Color(0xff6908d6).withOpacity(0.1);
  var __purple = Color(0xff6908d6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(20.0),
            children: [
              Container(
                width: 150,
                height: 150,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    color: Color(0xff6908d6).withOpacity(0.1)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Total Per Person",  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: __purple,
                      fontSize: 15,
                    ),),
                    Text("\$${calculateTotalPerPerson(calculateTotalTip(_billAmount, _personCounter, _tipPercentage), _billAmount, _personCounter)}",  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: __purple,
                      fontSize: 34,
                    ),),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                        color: Colors.blueGrey.shade100,
                        style: BorderStyle.solid)),
                child: Column(
                  children: [
                    //bill amount
                    TextField(
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true, signed: false
                      ),
                      decoration: InputDecoration(
                          prefixText: "Bill Amount ",
                          prefixIcon: Icon(Icons.attach_money)),
                      onChanged: (String value) {
                        try {
                          _billAmount = double.parse(value);
                        } catch (exception) {
                          _billAmount = 0.0;
                        }
                      },
                    ),
                    //person count row
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Split",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: __purple,
                            fontSize: 17,
                          ),
                        )),
                        //decrement
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (_personCounter > 1) {
                                --_personCounter;
                               } else {

                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            width: 40,
                            height: 40,
                            child: Text(
                              '-',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: __purple,
                                fontSize: 17,
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xff6908d6).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        //Person Count
                        Text(
                          "$_personCounter",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: __purple,
                            fontSize: 17,
                          ),
                        ),
                        //increment
                        InkWell(
                          onTap: () {
                            setState(() {
                              _personCounter++;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            width: 40,
                            height: 40,
                            child: Text("+"),
                            decoration: BoxDecoration(
                              color: Color(0xff6908d6).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //tip value row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tip",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: __purple,
                            fontSize: 17,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Text(
                            "\$${calculateTotalTip(_billAmount, _personCounter, _tipPercentage)}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: __purple,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //tip percentage
                    Text("$_tipPercentage%",  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: __purple,
                      fontSize: 17,
                    ),),
                    Slider(
                        min: 0,
                        max: 100,
                        divisions: 20,
                        activeColor: __purple,
                        inactiveColor: _purple,
                        value: _tipPercentage.toDouble(),
                        onChanged: (double value) {
                          setState(() {
                            _tipPercentage = value.round();
                          });
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  calculateTotalPerPerson(double totalTip, double billAmount, int personCount){
    var totalPerPerson = (totalTip+billAmount)/personCount ;
    return totalPerPerson.toStringAsFixed(2);

  }
  calculateTotalTip(double billAmount, int personCount, int tipPercentage){
    var totalTip = 0.0;
    if (billAmount==0 || billAmount.toString().isEmpty || billAmount==null){


    }
    else totalTip = (tipPercentage*billAmount)/100;
    return totalTip;

    }

}