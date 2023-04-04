import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ekinch/app/modules/postjob/Style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownFieldFull extends StatelessWidget {
  final String? hintText;
  late TextEditingController controller;
  final String? initialValue;
  late final String? dropdownvalue;
  final List<String>? items;
  final EdgeInsetsGeometry? margin;
  DropdownFieldFull(
      {Key? key,
      this.hintText,
      required TextEditingController controller,
      this.margin,
      this.initialValue,
      this.items,
      this.dropdownvalue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> indexvalue = [0];
    int index = 0;
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      //margin: margin ?? EdgeInsets.symmetric( vertical: 10),
      decoration: BoxDecoration(
          // color: theme.backgroundColor,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Boxborder, width: 1)),
      child: DropdownButtonFormField<String>(
        autovalidateMode: AutovalidateMode.always,
        hint: Text(
          hintText as String,
          style: GoogleFonts.kadwa(fontSize: F16()),
        ),
        value: dropdownvalue,
        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        style: GoogleFonts.kadwa(fontSize: F16()),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(5),
          border: UnderlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
        ),
        items: items!.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            // alignment: Alignment.centerRight,
            child: Text(
              value,
              style: GoogleFonts.kadwa(color: grey, fontSize: F16()),
            ),
          );
        }).toList(),
        onChanged: (String? value) {
          dropdownvalue = value!;
          controller.text = value;
          for (int i = 0; i < items!.length; i++) {
            if (value == items![i]) {
              index = indexvalue[i];
            }
          }
        },
      ),
    );
  }
}

class Dropdownprefix extends StatelessWidget {
  final String? hintText;
  final String? initialValue;
  final String? dropdownvalue;
  final List<String>? items;
  late TextEditingController controller;
  // final Decoration? prefix;
  final EdgeInsetsGeometry? margin;
  Dropdownprefix(
      {Key? key,
      this.hintText,
      this.margin,
      controller,
      this.initialValue,
      this.items,
      this.dropdownvalue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      //    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      //margin: margin ?? EdgeInsets.symmetric( vertical: 10),
      decoration: BoxDecoration(
          // color: theme.backgroundColor,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Boxborder, width: 1)),
      child: DropdownButtonFormField<String>(
        value: dropdownvalue,
        //iconSize: 0.0,
        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
hint: Text(hintText as String,style: GoogleFonts.kadwa(color: grey,fontSize: F16()),),
        style: GoogleFonts.kadwa(color: black, fontSize: F16()),
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(10),
            border: UnderlineInputBorder(borderSide: BorderSide.none),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
            prefixIcon: Icon(
              Icons.keyboard_arrow_left,
            )),
        items: items!.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            // alignment: Alignment.centerRight,
            child: new Text(
              value,
              style: GoogleFonts.kadwa(color: grey, fontSize: F16()),
            ),
          );
        }).toList(),
        onChanged: ( value) {
          controller.text = value as String;
        },
      ),
    );
  }
}

class DescriptionLong extends StatelessWidget {
  final String? hintText;
  final String? initialValue;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? margin;
  DescriptionLong(
      {Key? key,
      this.hintText,
      this.margin,
      this.initialValue,
      this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
        height: MediaQuery.of(context).size.height * 0.2,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        //margin: margin ?? EdgeInsets.symmetric( vertical: 10),
        decoration: BoxDecoration(
            // color: theme.backgroundColor,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Boxborder, width: 1)),
        child: TextFormField(
          controller: controller,
          textInputAction: TextInputAction.newline,
          keyboardType: TextInputType.multiline,
          maxLines: null,
//style:TextStyle( color: grey,fontFamily: 'Kadwa') ,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(5),
              hintText: hintText,
              hintStyle: GoogleFonts.kadwa(color: grey, fontSize: F16()),
              border: const UnderlineInputBorder(borderSide: BorderSide.none),
              focusedBorder:
                  const UnderlineInputBorder(borderSide: BorderSide.none),
              enabledBorder:
                  const UnderlineInputBorder(borderSide: BorderSide.none)),
        ));
  }
}

class Description extends StatelessWidget {
  final String? hintText;
  final String? initialValue;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? margin;
  Description(
      {Key? key,
      this.hintText,
      this.margin,
      this.initialValue,
      this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        //margin: margin ?? EdgeInsets.symmetric( vertical: 10),
        decoration: BoxDecoration(
            // color: theme.backgroundColor,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Boxborder, width: 1)),
        child: TextFormField(
          controller: controller,
          textInputAction: TextInputAction.newline,
          keyboardType: TextInputType.multiline,
          maxLines: null,
//style:TextStyle( color: grey,fontFamily: 'Kadwa') ,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(5),
              hintText: hintText,
              hintStyle: GoogleFonts.kadwa(color: grey, fontSize: F16()),
              border: const UnderlineInputBorder(borderSide: BorderSide.none),
              focusedBorder:
                  const UnderlineInputBorder(borderSide: BorderSide.none),
              enabledBorder:
                  const UnderlineInputBorder(borderSide: BorderSide.none)),
        ));
  }
}

class TextFeild extends StatelessWidget {
  final String? hintText;
  final TextInputType? keyboardtype;
  final String? initialValue;
  final TextInputFormatter? inputFormatter;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? margin;
  TextFeild(
      {Key? key,
      this.hintText,
      this.margin,
      this.initialValue,
      this.controller,
      this.inputFormatter,
      this.keyboardtype})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        //margin: margin ?? EdgeInsets.symmetric( vertical: 10),
        decoration: BoxDecoration(
            // color: theme.backgroundColor,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Boxborder, width: 1)),
        child: TextField(
          controller: controller,
          keyboardType: keyboardtype,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(5),
              hintText: hintText,
              hintStyle: GoogleFonts.kadwa(color: grey, fontSize: F16()),
              border: const UnderlineInputBorder(borderSide: BorderSide.none),
              focusedBorder:
                  const UnderlineInputBorder(borderSide: BorderSide.none),
              enabledBorder:
                  const UnderlineInputBorder(borderSide: BorderSide.none)),
        ));
  }
}

class TextFeildWhiteBorder extends StatelessWidget {
  final String? hintText;
  final TextInputType? keyboardtype;
  final String? initialValue;
  final TextInputFormatter? inputFormatter;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? margin;
  TextFeildWhiteBorder(
      {Key? key,
      this.hintText,
      this.margin,
      this.initialValue,
      this.controller,
      this.inputFormatter,
      this.keyboardtype})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        //margin: margin ?? EdgeInsets.symmetric( vertical: 10),
        decoration: BoxDecoration(
            color: whitedark,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Boxborder, width: 0.5)),
        child: TextField(
          controller: controller,
//autofocus: true,
          keyboardType: keyboardtype,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              hintText: hintText,
              hintStyle: GoogleFonts.kadwa(color: greybox, fontSize: F16()),
              border: const UnderlineInputBorder(borderSide: BorderSide.none),
              focusedBorder:
                  const UnderlineInputBorder(borderSide: BorderSide.none),
              enabledBorder:
                  const UnderlineInputBorder(borderSide: BorderSide.none),
              prefixIcon: Icon(
                Icons.search_rounded,
                color: greybox,
              )),
        ));
  }
}
class TextFeildGreyBorder extends StatelessWidget {
  final String? hintText;
  final TextInputType? keyboardtype;
  final String? initialValue;
  final TextInputFormatter? inputFormatter;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? margin;
  TextFeildGreyBorder(
      {Key? key,
      this.hintText,
      this.margin,
      this.initialValue,
      this.controller,
      this.inputFormatter,
      this.keyboardtype})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        //margin: margin ?? EdgeInsets.symmetric( vertical: 10),
        decoration: BoxDecoration(
            color: whitedark,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.grey, width: 0.5)),
        child: TextField(
          controller: controller,
//autofocus: true,
          keyboardType: keyboardtype,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              hintText: hintText,
              hintStyle: GoogleFonts.kadwa(color: Colors.grey, fontSize: F16()),
              border: const UnderlineInputBorder(borderSide: BorderSide.none),
              focusedBorder:
                  const UnderlineInputBorder(borderSide: BorderSide.none),
              enabledBorder:
                  const UnderlineInputBorder(borderSide: BorderSide.none),
              prefixIcon: Icon(
                Icons.search_rounded,
                color: greybox,
              )),
        ));
  }
}

class TextFeildWhite extends StatelessWidget {
  final String? hintText;
  final TextInputType? keyboardtype;
  final String? initialValue;
  final TextInputFormatter? inputFormatter;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? margin;
  TextFeildWhite(
      {Key? key,
      this.hintText,
      this.margin,
      this.initialValue,
      this.controller,
      this.inputFormatter,
      this.keyboardtype})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        //margin: margin ?? EdgeInsets.symmetric( vertical: 10),
        decoration: BoxDecoration(
          color: whitedark,
          borderRadius: BorderRadius.circular(6),
          //border: Border.all(color: Boxborder,width: 1)
        ),
        child: TextField(
          controller: controller,
//autofocus: true,
          keyboardType: keyboardtype,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              hintText: hintText,
              hintStyle: GoogleFonts.kadwa(color: greybox, fontSize: F16()),
              border: const UnderlineInputBorder(borderSide: BorderSide.none),
              focusedBorder:
                  const UnderlineInputBorder(borderSide: BorderSide.none),
              enabledBorder:
                  const UnderlineInputBorder(borderSide: BorderSide.none),
              prefixIcon: Icon(
                Icons.search_rounded,
                color: greybox,
              )),
        ));
  }
}


class TextFeildNumber extends StatelessWidget {
  final String? hintText;
  final String? initialValue;
  final String? dropdownvalue;
  final List<String>? items;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? margin;
  TextFeildNumber(
      {Key? key,
      this.hintText,
      this.margin,
      this.initialValue,
      this.controller,
      this.dropdownvalue,
      this.items})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        //margin: margin ?? EdgeInsets.symmetric( vertical: 10),
        decoration: BoxDecoration(
            // color: theme.backgroundColor,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Boxborder, width: 1)),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/india.png'),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: dropdownvalue,
                            //iconSize: 0.0,
                            icon: const Icon(Icons.keyboard_arrow_down,
                                color: Colors.grey),

                            style:
                                GoogleFonts.kadwa(color: grey, fontSize: F16()),
                            decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(top: 5, bottom: 5, right: 2),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                            items: items!
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                // alignment: Alignment.centerRight,
                                child: new Text(
                                  value,
                                  style: TextStyle(
                                      color: grey, fontFamily: 'Kadwa'),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {},
                          ),
                        )
                      ])),
              VerticalDivider(
                color: Boxborder,
                thickness: 1,
              ),
              const SizedBox(
                width: 3,
              ),
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  maxLength: 10,
                  decoration: InputDecoration(
                      counterText: '',
                      contentPadding: const EdgeInsets.all(5),
                      hintText: hintText,
                      hintStyle:
                          GoogleFonts.kadwa(color: grey, fontSize: F16()),
                      border: const UnderlineInputBorder(
                          borderSide: BorderSide.none),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide.none),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide.none)),
                ),
              ),
            ],
          ),
        ));
  }
}

class DropdownTime extends StatelessWidget {
  final String? hintText;
  final String? initialValue;
  final String? dropdownvalue;
  final List<String>? items;
  final Decoration? prefixicon;
  final EdgeInsetsGeometry? margin;
  DropdownTime(
      {Key? key,
      this.hintText,
      this.margin,
      this.initialValue,
      this.items,
      this.dropdownvalue,
      this.prefixicon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        //margin: margin ?? EdgeInsets.symmetric( vertical: 10),
        decoration: BoxDecoration(
            // color: theme.backgroundColor,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Boxborder, width: 1)),
        child: Container(
          child: IntrinsicHeight(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: hintText,
                    contentPadding: EdgeInsets.all(5),
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        UnderlineInputBorder(borderSide: BorderSide.none),
                    enabledBorder:
                        UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              SizedBox(
                width: 3,
              ),
              VerticalDivider(
                color: Boxborder,
                thickness: 1,
                endIndent: 8,
                indent: 8,
              ),
              SizedBox(
                width: 3,
              ),
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: dropdownvalue,
                  //iconSize: 0.0,
                  icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey),

                  style: GoogleFonts.kadwa(color: grey, fontSize: F16()),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        UnderlineInputBorder(borderSide: BorderSide.none),
                    enabledBorder:
                        UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                  items: items!.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      // alignment: Alignment.centerRight,
                      child: new Text(
                        value,
                        style: GoogleFonts.kadwa(color: grey, fontSize: F16()),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? value) {},
                ),
              )
            ],
          )),
        ));
  }
}

class Dropdownshort extends StatelessWidget {
  final String? hintText;

  final String? initialValue;
  late final String? dropdownvalue;
  final List<String>? items;
  final EdgeInsetsGeometry? margin;
  Dropdownshort(
      {Key? key,
      this.hintText,
      this.margin,
      this.initialValue,
      this.items,
      this.dropdownvalue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> indexvalue = [0];
    int index = 0;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      //margin: margin ?? EdgeInsets.symmetric( vertical: 10),
      decoration: const BoxDecoration(
          // color: theme.backgroundColor,
          //   borderRadius: BorderRadius.circular(8),
          //  border: Border.all(color: Boxborder,width: 1)
          ),
      child: DropdownButtonFormField<String>(
        value: dropdownvalue,

        //iconSize: 0.0,
        icon: Icon(Icons.keyboard_arrow_down_outlined, color: textcolor),

        style: GoogleFonts.kadwa(fontSize: F16()),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(5),
          border: UnderlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
        ),
        items: items!.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            // alignment: Alignment.centerRight,
            child: new Text(
              value,
              style: GoogleFonts.kadwa(color: black, fontSize: F16()),
            ),
          );
        }).toList(),
        onChanged: (String? value) {},
      ),
    );
  }
}
