import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class AdaptiveFlatButton extends StatelessWidget {
  final text;
  final clickHandler;

  AdaptiveFlatButton(this.text, this.clickHandler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
                        ? CupertinoButton(
                            child: Text(
                              text,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () => clickHandler(),
                            color: Theme.of(context).primaryColor,
                          )
                        : FlatButton(
                            child: Text(
                              text,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () => clickHandler(),
                            textColor: Theme.of(context).primaryColor,
                          );
  }
}