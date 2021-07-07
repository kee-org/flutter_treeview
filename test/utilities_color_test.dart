import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_treeview/src/utilities.dart';

void main() {
  group('Color from HEX', () {
    test('full with hash', () {
      final color = Utilities.getColor('#AAaaaa');
      expect(color, Color(0xffAAAAAA));
    });
    test('full without hash', () {
      final color = Utilities.getColor('232323');
      expect(color, Color(0xff232323));
    });
    test('partial with hash', () {
      final color = Utilities.getColor('#bcE');
      expect(color, Color(0xffBBCCEE));
    });
    test('partial without hash', () {
      final color = Utilities.getColor('981');
      expect(color, Color(0xff998811));
    });
    test('invalid with hash', () {
      final color = Utilities.getColor('#4981');
      expect(color, Color(0xff000000));
    });
    test('invalid without hash', () {
      final color = Utilities.getColor('981H');
      expect(color, Color(0xff000000));
    });
  });
  group('Color from RGB', () {
    test('white', () {
      final color = Utilities.getColor('rgb(255,255,255)');
      expect(color, Color(0xffFFFFFF));
    });
    test('black with spaces', () {
      final color = Utilities.getColor('rgb(0, 0, 0)');
      expect(color, Color(0xff000000));
    });
    test('invalid', () {
      final color = Utilities.getColor('rgb(345)');
      expect(color, Color(0xff000000));
    });
  });
  group('Color from RGBA', () {
    test('white', () {
      final color = Utilities.getColor('rgba(255,255,255,1)');
      expect(color, Color(0xffFFFFFF));
    });
    test('transparent white', () {
      final color = Utilities.getColor('rgba(255,255,255,0)');
      expect(color, Color(0x00FFFFFF));
    });
    test('semi-opaque white', () {
      final color = Utilities.getColor('rgba(255,255,255,0.5)');
      expect(color, Color(0x7fFFFFFF));
    });
    test('black with spaces', () {
      final color = Utilities.getColor('rgba(0, 0, 0, 1.0)');
      expect(color, Color(0xff000000));
    });
    test('transparent black', () {
      final color = Utilities.getColor('rgba(0, 0, 0, 0.0)');
      expect(color, Color(0x00000000));
    });
    test('0.3 transparent black', () {
      final color = Utilities.getColor('rgba(0, 0, 0, 0.3)');
      expect(color, Color(0x4c000000));
    });
    test('invalid', () {
      final color = Utilities.getColor('rgba(345)');
      expect(color, Color(0xff000000));
    });
  });
  group('Color from Material Design colors', () {
    test('white', () {
      final color = Utilities.getColor('white');
      expect(color, Colors.white);
    });
    test('black', () {
      final color = Utilities.getColor('black');
      expect(color, Colors.black);
    });
    test('amber', () {
      final color = Utilities.getColor('amber');
      expect(color, Colors.amber);
    });
    test('amber[100]', () {
      final color = Utilities.getColor('amber100');
      expect(color, Colors.amber.shade100);
    });
    test('amber[200]', () {
      final color = Utilities.getColor('amber200');
      expect(color, Colors.amber.shade200);
    });
    test('amber[300]', () {
      final color = Utilities.getColor('amber300');
      expect(color, Colors.amber.shade300);
    });
    test('amber[400]', () {
      final color = Utilities.getColor('amber400');
      expect(color, Colors.amber.shade400);
    });
    test('amber[500]', () {
      final color = Utilities.getColor('amber500');
      expect(color, Colors.amber.shade500);
    });
    test('amber[600]', () {
      final color = Utilities.getColor('amber600');
      expect(color, Colors.amber.shade600);
    });
    test('amber[700]', () {
      final color = Utilities.getColor('amber700');
      expect(color, Colors.amber.shade700);
    });
    test('amber[800]', () {
      final color = Utilities.getColor('amber800');
      expect(color, Colors.amber.shade800);
    });
    test('amber[900]', () {
      final color = Utilities.getColor('amber900');
      expect(color, Colors.amber.shade900);
    });

    test('blue', () {
      final color = Utilities.getColor('blue');
      expect(color, Colors.blue);
    });
    test('blue[100]', () {
      final color = Utilities.getColor('blue100');
      expect(color, Colors.blue.shade100);
    });
    test('blue[200]', () {
      final color = Utilities.getColor('blue200');
      expect(color, Colors.blue.shade200);
    });
    test('blue[300]', () {
      final color = Utilities.getColor('blue300');
      expect(color, Colors.blue.shade300);
    });
    test('blue[400]', () {
      final color = Utilities.getColor('blue400');
      expect(color, Colors.blue.shade400);
    });
    test('blue[500]', () {
      final color = Utilities.getColor('blue500');
      expect(color, Colors.blue.shade500);
    });
    test('blue[600]', () {
      final color = Utilities.getColor('blue600');
      expect(color, Colors.blue.shade600);
    });
    test('blue[700]', () {
      final color = Utilities.getColor('blue700');
      expect(color, Colors.blue.shade700);
    });
    test('blue[800]', () {
      final color = Utilities.getColor('blue800');
      expect(color, Colors.blue.shade800);
    });
    test('blue[900]', () {
      final color = Utilities.getColor('blue900');
      expect(color, Colors.blue.shade900);
    });

    test('blueGrey', () {
      final color = Utilities.getColor('blueGrey');
      expect(color, Colors.blueGrey);
    });
    test('blueGrey[100]', () {
      final color = Utilities.getColor('blueGrey100');
      expect(color, Colors.blueGrey.shade100);
    });
    test('blueGrey[200]', () {
      final color = Utilities.getColor('blueGrey200');
      expect(color, Colors.blueGrey.shade200);
    });
    test('blueGrey[300]', () {
      final color = Utilities.getColor('blueGrey300');
      expect(color, Colors.blueGrey.shade300);
    });
    test('blueGrey[400]', () {
      final color = Utilities.getColor('blueGrey400');
      expect(color, Colors.blueGrey.shade400);
    });
    test('blueGrey[500]', () {
      final color = Utilities.getColor('blueGrey500');
      expect(color, Colors.blueGrey.shade500);
    });
    test('blueGrey[600]', () {
      final color = Utilities.getColor('blueGrey600');
      expect(color, Colors.blueGrey.shade600);
    });
    test('blueGrey[700]', () {
      final color = Utilities.getColor('blueGrey700');
      expect(color, Colors.blueGrey.shade700);
    });
    test('blueGrey[800]', () {
      final color = Utilities.getColor('blueGrey800');
      expect(color, Colors.blueGrey.shade800);
    });
    test('blueGrey[900]', () {
      final color = Utilities.getColor('blueGrey900');
      expect(color, Colors.blueGrey.shade900);
    });

    test('brown', () {
      final color = Utilities.getColor('brown');
      expect(color, Colors.brown);
    });
    test('brown[100]', () {
      final color = Utilities.getColor('brown100');
      expect(color, Colors.brown.shade100);
    });
    test('brown[200]', () {
      final color = Utilities.getColor('brown200');
      expect(color, Colors.brown.shade200);
    });
    test('brown[300]', () {
      final color = Utilities.getColor('brown300');
      expect(color, Colors.brown.shade300);
    });
    test('brown[400]', () {
      final color = Utilities.getColor('brown400');
      expect(color, Colors.brown.shade400);
    });
    test('brown[500]', () {
      final color = Utilities.getColor('brown500');
      expect(color, Colors.brown.shade500);
    });
    test('brown[600]', () {
      final color = Utilities.getColor('brown600');
      expect(color, Colors.brown.shade600);
    });
    test('brown[700]', () {
      final color = Utilities.getColor('brown700');
      expect(color, Colors.brown.shade700);
    });
    test('brown[800]', () {
      final color = Utilities.getColor('brown800');
      expect(color, Colors.brown.shade800);
    });
    test('brown[900]', () {
      final color = Utilities.getColor('brown900');
      expect(color, Colors.brown.shade900);
    });

    test('cyan', () {
      final color = Utilities.getColor('cyan');
      expect(color, Colors.cyan);
    });
    test('cyan[100]', () {
      final color = Utilities.getColor('cyan100');
      expect(color, Colors.cyan.shade100);
    });
    test('cyan[200]', () {
      final color = Utilities.getColor('cyan200');
      expect(color, Colors.cyan.shade200);
    });
    test('cyan[300]', () {
      final color = Utilities.getColor('cyan300');
      expect(color, Colors.cyan.shade300);
    });
    test('cyan[400]', () {
      final color = Utilities.getColor('cyan400');
      expect(color, Colors.cyan.shade400);
    });
    test('cyan[500]', () {
      final color = Utilities.getColor('cyan500');
      expect(color, Colors.cyan.shade500);
    });
    test('cyan[600]', () {
      final color = Utilities.getColor('cyan600');
      expect(color, Colors.cyan.shade600);
    });
    test('cyan[700]', () {
      final color = Utilities.getColor('cyan700');
      expect(color, Colors.cyan.shade700);
    });
    test('cyan[800]', () {
      final color = Utilities.getColor('cyan800');
      expect(color, Colors.cyan.shade800);
    });
    test('cyan[900]', () {
      final color = Utilities.getColor('cyan900');
      expect(color, Colors.cyan.shade900);
    });

    test('deepOrange', () {
      final color = Utilities.getColor('deepOrange');
      expect(color, Colors.deepOrange);
    });
    test('deepOrange[100]', () {
      final color = Utilities.getColor('deepOrange100');
      expect(color, Colors.deepOrange.shade100);
    });
    test('deepOrange[200]', () {
      final color = Utilities.getColor('deepOrange200');
      expect(color, Colors.deepOrange.shade200);
    });
    test('deepOrange[300]', () {
      final color = Utilities.getColor('deepOrange300');
      expect(color, Colors.deepOrange.shade300);
    });
    test('deepOrange[400]', () {
      final color = Utilities.getColor('deepOrange400');
      expect(color, Colors.deepOrange.shade400);
    });
    test('deepOrange[500]', () {
      final color = Utilities.getColor('deepOrange500');
      expect(color, Colors.deepOrange.shade500);
    });
    test('deepOrange[600]', () {
      final color = Utilities.getColor('deepOrange600');
      expect(color, Colors.deepOrange.shade600);
    });
    test('deepOrange[700]', () {
      final color = Utilities.getColor('deepOrange700');
      expect(color, Colors.deepOrange.shade700);
    });
    test('deepOrange[800]', () {
      final color = Utilities.getColor('deepOrange800');
      expect(color, Colors.deepOrange.shade800);
    });
    test('deepOrange[900]', () {
      final color = Utilities.getColor('deepOrange900');
      expect(color, Colors.deepOrange.shade900);
    });

    test('deepPurple', () {
      final color = Utilities.getColor('deepPurple');
      expect(color, Colors.deepPurple);
    });
    test('deepPurple[100]', () {
      final color = Utilities.getColor('deepPurple100');
      expect(color, Colors.deepPurple.shade100);
    });
    test('deepPurple[200]', () {
      final color = Utilities.getColor('deepPurple200');
      expect(color, Colors.deepPurple.shade200);
    });
    test('deepPurple[300]', () {
      final color = Utilities.getColor('deepPurple300');
      expect(color, Colors.deepPurple.shade300);
    });
    test('deepPurple[400]', () {
      final color = Utilities.getColor('deepPurple400');
      expect(color, Colors.deepPurple.shade400);
    });
    test('deepPurple[500]', () {
      final color = Utilities.getColor('deepPurple500');
      expect(color, Colors.deepPurple.shade500);
    });
    test('deepPurple[600]', () {
      final color = Utilities.getColor('deepPurple600');
      expect(color, Colors.deepPurple.shade600);
    });
    test('deepPurple[700]', () {
      final color = Utilities.getColor('deepPurple700');
      expect(color, Colors.deepPurple.shade700);
    });
    test('deepPurple[800]', () {
      final color = Utilities.getColor('deepPurple800');
      expect(color, Colors.deepPurple.shade800);
    });
    test('deepPurple[900]', () {
      final color = Utilities.getColor('deepPurple900');
      expect(color, Colors.deepPurple.shade900);
    });

    test('green', () {
      final color = Utilities.getColor('green');
      expect(color, Colors.green);
    });
    test('green[100]', () {
      final color = Utilities.getColor('green100');
      expect(color, Colors.green.shade100);
    });
    test('green[200]', () {
      final color = Utilities.getColor('green200');
      expect(color, Colors.green.shade200);
    });
    test('green[300]', () {
      final color = Utilities.getColor('green300');
      expect(color, Colors.green.shade300);
    });
    test('green[400]', () {
      final color = Utilities.getColor('green400');
      expect(color, Colors.green.shade400);
    });
    test('green[500]', () {
      final color = Utilities.getColor('green500');
      expect(color, Colors.green.shade500);
    });
    test('green[600]', () {
      final color = Utilities.getColor('green600');
      expect(color, Colors.green.shade600);
    });
    test('green[700]', () {
      final color = Utilities.getColor('green700');
      expect(color, Colors.green.shade700);
    });
    test('green[800]', () {
      final color = Utilities.getColor('green800');
      expect(color, Colors.green.shade800);
    });
    test('green[900]', () {
      final color = Utilities.getColor('green900');
      expect(color, Colors.green.shade900);
    });

    test('greenAccent[100]', () {
      final color = Utilities.getColor('greenAccent100');
      expect(color, Colors.greenAccent.shade100);
    });
    test('greenAccent[200]', () {
      final color = Utilities.getColor('greenAccent200');
      expect(color, Colors.greenAccent.shade200);
    });
    test('greenAccent[400]', () {
      final color = Utilities.getColor('greenAccent400');
      expect(color, Colors.greenAccent.shade400);
    });
    test('greenAccent[700]', () {
      final color = Utilities.getColor('greenAccent700');
      expect(color, Colors.greenAccent.shade700);
    });

    test('grey', () {
      final color = Utilities.getColor('grey');
      expect(color, Colors.grey);
    });
    test('grey[100]', () {
      final color = Utilities.getColor('grey100');
      expect(color, Colors.grey.shade100);
    });
    test('grey[200]', () {
      final color = Utilities.getColor('grey200');
      expect(color, Colors.grey.shade200);
    });
    test('grey[300]', () {
      final color = Utilities.getColor('grey300');
      expect(color, Colors.grey.shade300);
    });
    test('grey[400]', () {
      final color = Utilities.getColor('grey400');
      expect(color, Colors.grey.shade400);
    });
    test('grey[500]', () {
      final color = Utilities.getColor('grey500');
      expect(color, Colors.grey.shade500);
    });
    test('grey[600]', () {
      final color = Utilities.getColor('grey600');
      expect(color, Colors.grey.shade600);
    });
    test('grey[700]', () {
      final color = Utilities.getColor('grey700');
      expect(color, Colors.grey.shade700);
    });
    test('grey[800]', () {
      final color = Utilities.getColor('grey800');
      expect(color, Colors.grey.shade800);
    });
    test('grey[900]', () {
      final color = Utilities.getColor('grey900');
      expect(color, Colors.grey.shade900);
    });

    test('indigo', () {
      final color = Utilities.getColor('indigo');
      expect(color, Colors.indigo);
    });
    test('indigo[100]', () {
      final color = Utilities.getColor('indigo100');
      expect(color, Colors.indigo.shade100);
    });
    test('indigo[200]', () {
      final color = Utilities.getColor('indigo200');
      expect(color, Colors.indigo.shade200);
    });
    test('indigo[300]', () {
      final color = Utilities.getColor('indigo300');
      expect(color, Colors.indigo.shade300);
    });
    test('indigo[400]', () {
      final color = Utilities.getColor('indigo400');
      expect(color, Colors.indigo.shade400);
    });
    test('indigo[500]', () {
      final color = Utilities.getColor('indigo500');
      expect(color, Colors.indigo.shade500);
    });
    test('indigo[600]', () {
      final color = Utilities.getColor('indigo600');
      expect(color, Colors.indigo.shade600);
    });
    test('indigo[700]', () {
      final color = Utilities.getColor('indigo700');
      expect(color, Colors.indigo.shade700);
    });
    test('indigo[800]', () {
      final color = Utilities.getColor('indigo800');
      expect(color, Colors.indigo.shade800);
    });
    test('indigo[900]', () {
      final color = Utilities.getColor('indigo900');
      expect(color, Colors.indigo.shade900);
    });

    test('lightBlue', () {
      final color = Utilities.getColor('lightBlue');
      expect(color, Colors.lightBlue);
    });
    test('lightBlue[100]', () {
      final color = Utilities.getColor('lightBlue100');
      expect(color, Colors.lightBlue.shade100);
    });
    test('lightBlue[200]', () {
      final color = Utilities.getColor('lightBlue200');
      expect(color, Colors.lightBlue.shade200);
    });
    test('lightBlue[300]', () {
      final color = Utilities.getColor('lightBlue300');
      expect(color, Colors.lightBlue.shade300);
    });
    test('lightBlue[400]', () {
      final color = Utilities.getColor('lightBlue400');
      expect(color, Colors.lightBlue.shade400);
    });
    test('lightBlue[500]', () {
      final color = Utilities.getColor('lightBlue500');
      expect(color, Colors.lightBlue.shade500);
    });
    test('lightBlue[600]', () {
      final color = Utilities.getColor('lightBlue600');
      expect(color, Colors.lightBlue.shade600);
    });
    test('lightBlue[700]', () {
      final color = Utilities.getColor('lightBlue700');
      expect(color, Colors.lightBlue.shade700);
    });
    test('lightBlue[800]', () {
      final color = Utilities.getColor('lightBlue800');
      expect(color, Colors.lightBlue.shade800);
    });
    test('lightBlue[900]', () {
      final color = Utilities.getColor('lightBlue900');
      expect(color, Colors.lightBlue.shade900);
    });

    test('lightGreen', () {
      final color = Utilities.getColor('lightGreen');
      expect(color, Colors.lightGreen);
    });
    test('lightGreen[100]', () {
      final color = Utilities.getColor('lightGreen100');
      expect(color, Colors.lightGreen.shade100);
    });
    test('lightGreen[200]', () {
      final color = Utilities.getColor('lightGreen200');
      expect(color, Colors.lightGreen.shade200);
    });
    test('lightGreen[300]', () {
      final color = Utilities.getColor('lightGreen300');
      expect(color, Colors.lightGreen.shade300);
    });
    test('lightGreen[400]', () {
      final color = Utilities.getColor('lightGreen400');
      expect(color, Colors.lightGreen.shade400);
    });
    test('lightGreen[500]', () {
      final color = Utilities.getColor('lightGreen500');
      expect(color, Colors.lightGreen.shade500);
    });
    test('lightGreen[600]', () {
      final color = Utilities.getColor('lightGreen600');
      expect(color, Colors.lightGreen.shade600);
    });
    test('lightGreen[700]', () {
      final color = Utilities.getColor('lightGreen700');
      expect(color, Colors.lightGreen.shade700);
    });
    test('lightGreen[800]', () {
      final color = Utilities.getColor('lightGreen800');
      expect(color, Colors.lightGreen.shade800);
    });
    test('lightGreen[900]', () {
      final color = Utilities.getColor('lightGreen900');
      expect(color, Colors.lightGreen.shade900);
    });

    test('lime', () {
      final color = Utilities.getColor('lime');
      expect(color, Colors.lime);
    });
    test('lime[100]', () {
      final color = Utilities.getColor('lime100');
      expect(color, Colors.lime.shade100);
    });
    test('lime[200]', () {
      final color = Utilities.getColor('lime200');
      expect(color, Colors.lime.shade200);
    });
    test('lime[300]', () {
      final color = Utilities.getColor('lime300');
      expect(color, Colors.lime.shade300);
    });
    test('lime[400]', () {
      final color = Utilities.getColor('lime400');
      expect(color, Colors.lime.shade400);
    });
    test('lime[500]', () {
      final color = Utilities.getColor('lime500');
      expect(color, Colors.lime.shade500);
    });
    test('lime[600]', () {
      final color = Utilities.getColor('lime600');
      expect(color, Colors.lime.shade600);
    });
    test('lime[700]', () {
      final color = Utilities.getColor('lime700');
      expect(color, Colors.lime.shade700);
    });
    test('lime[800]', () {
      final color = Utilities.getColor('lime800');
      expect(color, Colors.lime.shade800);
    });
    test('lime[900]', () {
      final color = Utilities.getColor('lime900');
      expect(color, Colors.lime.shade900);
    });

    test('orange', () {
      final color = Utilities.getColor('orange');
      expect(color, Colors.orange);
    });
    test('orange[100]', () {
      final color = Utilities.getColor('orange100');
      expect(color, Colors.orange.shade100);
    });
    test('orange[200]', () {
      final color = Utilities.getColor('orange200');
      expect(color, Colors.orange.shade200);
    });
    test('orange[300]', () {
      final color = Utilities.getColor('orange300');
      expect(color, Colors.orange.shade300);
    });
    test('orange[400]', () {
      final color = Utilities.getColor('orange400');
      expect(color, Colors.orange.shade400);
    });
    test('orange[500]', () {
      final color = Utilities.getColor('orange500');
      expect(color, Colors.orange.shade500);
    });
    test('orange[600]', () {
      final color = Utilities.getColor('orange600');
      expect(color, Colors.orange.shade600);
    });
    test('orange[700]', () {
      final color = Utilities.getColor('orange700');
      expect(color, Colors.orange.shade700);
    });
    test('orange[800]', () {
      final color = Utilities.getColor('orange800');
      expect(color, Colors.orange.shade800);
    });
    test('orange[900]', () {
      final color = Utilities.getColor('orange900');
      expect(color, Colors.orange.shade900);
    });

    test('pink', () {
      final color = Utilities.getColor('pink');
      expect(color, Colors.pink);
    });
    test('pink[100]', () {
      final color = Utilities.getColor('pink100');
      expect(color, Colors.pink.shade100);
    });
    test('pink[200]', () {
      final color = Utilities.getColor('pink200');
      expect(color, Colors.pink.shade200);
    });
    test('pink[300]', () {
      final color = Utilities.getColor('pink300');
      expect(color, Colors.pink.shade300);
    });
    test('pink[400]', () {
      final color = Utilities.getColor('pink400');
      expect(color, Colors.pink.shade400);
    });
    test('pink[500]', () {
      final color = Utilities.getColor('pink500');
      expect(color, Colors.pink.shade500);
    });
    test('pink[600]', () {
      final color = Utilities.getColor('pink600');
      expect(color, Colors.pink.shade600);
    });
    test('pink[700]', () {
      final color = Utilities.getColor('pink700');
      expect(color, Colors.pink.shade700);
    });
    test('pink[800]', () {
      final color = Utilities.getColor('pink800');
      expect(color, Colors.pink.shade800);
    });
    test('pink[900]', () {
      final color = Utilities.getColor('pink900');
      expect(color, Colors.pink.shade900);
    });

    test('purple', () {
      final color = Utilities.getColor('purple');
      expect(color, Colors.purple);
    });
    test('purple[100]', () {
      final color = Utilities.getColor('purple100');
      expect(color, Colors.purple.shade100);
    });
    test('purple[200]', () {
      final color = Utilities.getColor('purple200');
      expect(color, Colors.purple.shade200);
    });
    test('purple[300]', () {
      final color = Utilities.getColor('purple300');
      expect(color, Colors.purple.shade300);
    });
    test('purple[400]', () {
      final color = Utilities.getColor('purple400');
      expect(color, Colors.purple.shade400);
    });
    test('purple[500]', () {
      final color = Utilities.getColor('purple500');
      expect(color, Colors.purple.shade500);
    });
    test('purple[600]', () {
      final color = Utilities.getColor('purple600');
      expect(color, Colors.purple.shade600);
    });
    test('purple[700]', () {
      final color = Utilities.getColor('purple700');
      expect(color, Colors.purple.shade700);
    });
    test('purple[800]', () {
      final color = Utilities.getColor('purple800');
      expect(color, Colors.purple.shade800);
    });
    test('purple[900]', () {
      final color = Utilities.getColor('purple900');
      expect(color, Colors.purple.shade900);
    });

    test('red', () {
      final color = Utilities.getColor('red');
      expect(color, Colors.red);
    });
    test('red[100]', () {
      final color = Utilities.getColor('red100');
      expect(color, Colors.red.shade100);
    });
    test('red[200]', () {
      final color = Utilities.getColor('red200');
      expect(color, Colors.red.shade200);
    });
    test('red[300]', () {
      final color = Utilities.getColor('red300');
      expect(color, Colors.red.shade300);
    });
    test('red[400]', () {
      final color = Utilities.getColor('red400');
      expect(color, Colors.red.shade400);
    });
    test('red[500]', () {
      final color = Utilities.getColor('red500');
      expect(color, Colors.red.shade500);
    });
    test('red[600]', () {
      final color = Utilities.getColor('red600');
      expect(color, Colors.red.shade600);
    });
    test('red[700]', () {
      final color = Utilities.getColor('red700');
      expect(color, Colors.red.shade700);
    });
    test('red[800]', () {
      final color = Utilities.getColor('red800');
      expect(color, Colors.red.shade800);
    });
    test('red[900]', () {
      final color = Utilities.getColor('red900');
      expect(color, Colors.red.shade900);
    });

    test('teal', () {
      final color = Utilities.getColor('teal');
      expect(color, Colors.teal);
    });
    test('teal[100]', () {
      final color = Utilities.getColor('teal100');
      expect(color, Colors.teal.shade100);
    });
    test('teal[200]', () {
      final color = Utilities.getColor('teal200');
      expect(color, Colors.teal.shade200);
    });
    test('teal[300]', () {
      final color = Utilities.getColor('teal300');
      expect(color, Colors.teal.shade300);
    });
    test('teal[400]', () {
      final color = Utilities.getColor('teal400');
      expect(color, Colors.teal.shade400);
    });
    test('teal[500]', () {
      final color = Utilities.getColor('teal500');
      expect(color, Colors.teal.shade500);
    });
    test('teal[600]', () {
      final color = Utilities.getColor('teal600');
      expect(color, Colors.teal.shade600);
    });
    test('teal[700]', () {
      final color = Utilities.getColor('teal700');
      expect(color, Colors.teal.shade700);
    });
    test('teal[800]', () {
      final color = Utilities.getColor('teal800');
      expect(color, Colors.teal.shade800);
    });
    test('teal[900]', () {
      final color = Utilities.getColor('teal900');
      expect(color, Colors.teal.shade900);
    });

    test('yellow', () {
      final color = Utilities.getColor('yellow');
      expect(color, Colors.yellow);
    });
    test('yellow[100]', () {
      final color = Utilities.getColor('yellow100');
      expect(color, Colors.yellow.shade100);
    });
    test('yellow[200]', () {
      final color = Utilities.getColor('yellow200');
      expect(color, Colors.yellow.shade200);
    });
    test('yellow[300]', () {
      final color = Utilities.getColor('yellow300');
      expect(color, Colors.yellow.shade300);
    });
    test('yellow[400]', () {
      final color = Utilities.getColor('yellow400');
      expect(color, Colors.yellow.shade400);
    });
    test('yellow[500]', () {
      final color = Utilities.getColor('yellow500');
      expect(color, Colors.yellow.shade500);
    });
    test('yellow[600]', () {
      final color = Utilities.getColor('yellow600');
      expect(color, Colors.yellow.shade600);
    });
    test('yellow[700]', () {
      final color = Utilities.getColor('yellow700');
      expect(color, Colors.yellow.shade700);
    });
    test('yellow[800]', () {
      final color = Utilities.getColor('yellow800');
      expect(color, Colors.yellow.shade800);
    });
    test('yellow[900]', () {
      final color = Utilities.getColor('yellow900');
      expect(color, Colors.yellow.shade900);
    });
    test('amberAccent', () {
      final color = Utilities.getColor('amberAccent');
      expect(color, Colors.amberAccent);
    });
    test('amberAccent[100]', () {
      final color = Utilities.getColor('amberAccent100');
      expect(color, Colors.amberAccent.shade100);
    });
    test('amberAccent[400]', () {
      final color = Utilities.getColor('amberAccent400');
      expect(color, Colors.amberAccent.shade400);
    });
    test('amberAccent[700]', () {
      final color = Utilities.getColor('amberAccent700');
      expect(color, Colors.amberAccent.shade700);
    });

    test('blueAccent', () {
      final color = Utilities.getColor('blueAccent');
      expect(color, Colors.blueAccent);
    });
    test('blueAccent[100]', () {
      final color = Utilities.getColor('blueAccent100');
      expect(color, Colors.blueAccent.shade100);
    });
    test('blueAccent[400]', () {
      final color = Utilities.getColor('blueAccent400');
      expect(color, Colors.blueAccent.shade400);
    });
    test('blueAccent[700]', () {
      final color = Utilities.getColor('blueAccent700');
      expect(color, Colors.blueAccent.shade700);
    });

    test('cyanAccent', () {
      final color = Utilities.getColor('cyanAccent');
      expect(color, Colors.cyanAccent);
    });
    test('cyanAccent[100]', () {
      final color = Utilities.getColor('cyanAccent100');
      expect(color, Colors.cyanAccent.shade100);
    });
    test('cyanAccent[400]', () {
      final color = Utilities.getColor('cyanAccent400');
      expect(color, Colors.cyanAccent.shade400);
    });
    test('cyanAccent[700]', () {
      final color = Utilities.getColor('cyanAccent700');
      expect(color, Colors.cyanAccent.shade700);
    });

    test('deepOrangeAccent', () {
      final color = Utilities.getColor('deepOrangeAccent');
      expect(color, Colors.deepOrangeAccent);
    });
    test('deepOrangeAccent[100]', () {
      final color = Utilities.getColor('deepOrangeAccent100');
      expect(color, Colors.deepOrangeAccent.shade100);
    });
    test('deepOrangeAccent[400]', () {
      final color = Utilities.getColor('deepOrangeAccent400');
      expect(color, Colors.deepOrangeAccent.shade400);
    });
    test('deepOrangeAccent[700]', () {
      final color = Utilities.getColor('deepOrangeAccent700');
      expect(color, Colors.deepOrangeAccent.shade700);
    });

    test('deepPurpleAccent', () {
      final color = Utilities.getColor('deepPurpleAccent');
      expect(color, Colors.deepPurpleAccent);
    });
    test('deepPurpleAccent[100]', () {
      final color = Utilities.getColor('deepPurpleAccent100');
      expect(color, Colors.deepPurpleAccent.shade100);
    });
    test('deepPurpleAccent[400]', () {
      final color = Utilities.getColor('deepPurpleAccent400');
      expect(color, Colors.deepPurpleAccent.shade400);
    });
    test('deepPurpleAccent[700]', () {
      final color = Utilities.getColor('deepPurpleAccent700');
      expect(color, Colors.deepPurpleAccent.shade700);
    });

    test('greenAccent', () {
      final color = Utilities.getColor('greenAccent');
      expect(color, Colors.greenAccent);
    });
    test('greenAccent[100]', () {
      final color = Utilities.getColor('greenAccent100');
      expect(color, Colors.greenAccent.shade100);
    });
    test('greenAccent[400]', () {
      final color = Utilities.getColor('greenAccent400');
      expect(color, Colors.greenAccent.shade400);
    });
    test('greenAccent[700]', () {
      final color = Utilities.getColor('greenAccent700');
      expect(color, Colors.greenAccent.shade700);
    });

    test('indigoAccent', () {
      final color = Utilities.getColor('indigoAccent');
      expect(color, Colors.indigoAccent);
    });
    test('indigoAccent[100]', () {
      final color = Utilities.getColor('indigoAccent100');
      expect(color, Colors.indigoAccent.shade100);
    });
    test('indigoAccent[400]', () {
      final color = Utilities.getColor('indigoAccent400');
      expect(color, Colors.indigoAccent.shade400);
    });
    test('indigoAccent[700]', () {
      final color = Utilities.getColor('indigoAccent700');
      expect(color, Colors.indigoAccent.shade700);
    });

    test('lightBlueAccent', () {
      final color = Utilities.getColor('lightBlueAccent');
      expect(color, Colors.lightBlueAccent);
    });
    test('lightBlueAccent[100]', () {
      final color = Utilities.getColor('lightBlueAccent100');
      expect(color, Colors.lightBlueAccent.shade100);
    });
    test('lightBlueAccent[400]', () {
      final color = Utilities.getColor('lightBlueAccent400');
      expect(color, Colors.lightBlueAccent.shade400);
    });
    test('lightBlueAccent[700]', () {
      final color = Utilities.getColor('lightBlueAccent700');
      expect(color, Colors.lightBlueAccent.shade700);
    });

    test('lightGreenAccent', () {
      final color = Utilities.getColor('lightGreenAccent');
      expect(color, Colors.lightGreenAccent);
    });
    test('lightGreenAccent[100]', () {
      final color = Utilities.getColor('lightGreenAccent100');
      expect(color, Colors.lightGreenAccent.shade100);
    });
    test('lightGreenAccent[400]', () {
      final color = Utilities.getColor('lightGreenAccent400');
      expect(color, Colors.lightGreenAccent.shade400);
    });
    test('lightGreenAccent[700]', () {
      final color = Utilities.getColor('lightGreenAccent700');
      expect(color, Colors.lightGreenAccent.shade700);
    });

    test('limeAccent', () {
      final color = Utilities.getColor('limeAccent');
      expect(color, Colors.limeAccent);
    });
    test('limeAccent[100]', () {
      final color = Utilities.getColor('limeAccent100');
      expect(color, Colors.limeAccent.shade100);
    });
    test('limeAccent[400]', () {
      final color = Utilities.getColor('limeAccent400');
      expect(color, Colors.limeAccent.shade400);
    });
    test('limeAccent[700]', () {
      final color = Utilities.getColor('limeAccent700');
      expect(color, Colors.limeAccent.shade700);
    });

    test('orangeAccent', () {
      final color = Utilities.getColor('orangeAccent');
      expect(color, Colors.orangeAccent);
    });
    test('orangeAccent[100]', () {
      final color = Utilities.getColor('orangeAccent100');
      expect(color, Colors.orangeAccent.shade100);
    });
    test('orangeAccent[400]', () {
      final color = Utilities.getColor('orangeAccent400');
      expect(color, Colors.orangeAccent.shade400);
    });
    test('orangeAccent[700]', () {
      final color = Utilities.getColor('orangeAccent700');
      expect(color, Colors.orangeAccent.shade700);
    });

    test('pinkAccent', () {
      final color = Utilities.getColor('pinkAccent');
      expect(color, Colors.pinkAccent);
    });
    test('pinkAccent[100]', () {
      final color = Utilities.getColor('pinkAccent100');
      expect(color, Colors.pinkAccent.shade100);
    });
    test('pinkAccent[400]', () {
      final color = Utilities.getColor('pinkAccent400');
      expect(color, Colors.pinkAccent.shade400);
    });
    test('pinkAccent[700]', () {
      final color = Utilities.getColor('pinkAccent700');
      expect(color, Colors.pinkAccent.shade700);
    });

    test('purpleAccent', () {
      final color = Utilities.getColor('purpleAccent');
      expect(color, Colors.purpleAccent);
    });
    test('purpleAccent[100]', () {
      final color = Utilities.getColor('purpleAccent100');
      expect(color, Colors.purpleAccent.shade100);
    });
    test('purpleAccent[400]', () {
      final color = Utilities.getColor('purpleAccent400');
      expect(color, Colors.purpleAccent.shade400);
    });
    test('purpleAccent[700]', () {
      final color = Utilities.getColor('purpleAccent700');
      expect(color, Colors.purpleAccent.shade700);
    });

    test('redAccent', () {
      final color = Utilities.getColor('redAccent');
      expect(color, Colors.redAccent);
    });
    test('redAccent[100]', () {
      final color = Utilities.getColor('redAccent100');
      expect(color, Colors.redAccent.shade100);
    });
    test('redAccent[400]', () {
      final color = Utilities.getColor('redAccent400');
      expect(color, Colors.redAccent.shade400);
    });
    test('redAccent[700]', () {
      final color = Utilities.getColor('redAccent700');
      expect(color, Colors.redAccent.shade700);
    });

    test('tealAccent', () {
      final color = Utilities.getColor('tealAccent');
      expect(color, Colors.tealAccent);
    });
    test('tealAccent[100]', () {
      final color = Utilities.getColor('tealAccent100');
      expect(color, Colors.tealAccent.shade100);
    });
    test('tealAccent[400]', () {
      final color = Utilities.getColor('tealAccent400');
      expect(color, Colors.tealAccent.shade400);
    });
    test('tealAccent[700]', () {
      final color = Utilities.getColor('tealAccent700');
      expect(color, Colors.tealAccent.shade700);
    });

    test('yellowAccent', () {
      final color = Utilities.getColor('yellowAccent');
      expect(color, Colors.yellowAccent);
    });
    test('yellowAccent[100]', () {
      final color = Utilities.getColor('yellowAccent100');
      expect(color, Colors.yellowAccent.shade100);
    });
    test('yellowAccent[400]', () {
      final color = Utilities.getColor('yellowAccent400');
      expect(color, Colors.yellowAccent.shade400);
    });
    test('yellowAccent[700]', () {
      final color = Utilities.getColor('yellowAccent700');
      expect(color, Colors.yellowAccent.shade700);
    });
  });
}
