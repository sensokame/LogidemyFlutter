import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logidemy/Model/fallacy.dart';
import 'package:share/share.dart';

class FallacyActionsController{
  static void showSigns(BuildContext context, List<dynamic> signs){
    var size = MediaQuery.of(context).size;
    var height = size.height * 80 / 100;
    var width = size.width * 60/100;
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text(AppLocalizations.of(context)!.signsText),
            content:
              SizedBox(
                height: height,
                width: width,
                child: SingleChildScrollView(
                  child:  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: signs.length,
                      itemBuilder: (BuildContext context, int index){
                        return Column(
                          children: [
                            ListTile(
                              title: Text(signs[index]),
                            ),
                            const Divider()
                          ],
                        );
                      }
                  )
                )
              )
          );
        }
    );
  }
  static void shareFallacy(Fallacy? fallacy){
    Share.share(fallacy.toString());
  }
}