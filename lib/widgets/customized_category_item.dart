import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:food_app/my_provider.dart';
import 'package:food_app/constants.dart';

class CustomizedCategoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //todo provider for mediaQuery
  double width = MediaQuery.of(context).size.width;
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Provider.of<MyProvider>(context, listen: false)
            .selectedCategoryFunc(),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(5, 5),
              ),
            ],
            borderRadius: BorderRadius.circular(10.0),
            color: Provider.of<MyProvider>(context)
                .selectedCategoryIcon
                ? secondaryColor
                : Colors.grey.shade200,
          ),
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.all(5.0),
          //width: width / 3.4,
          width: width / 3,
          child: Row(
            children: [
              CircleAvatar(
                child: Image(
                  height: 25.0,
                  width: 25.0,
                  image: AssetImage('assets/images/Icon_taco.png'),
                ),
                backgroundColor: Colors.white,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text('Burger',
                  style: TextStyle(
                      color: Provider.of<MyProvider>(context)
                          .selectedCategoryIcon
                          ? Colors.white
                          : Colors.black)),
            ],
          ),
        ),
      ),
      separatorBuilder: (context, index) => SizedBox(
        width: 20.0,
      ),

    );
  }
}
