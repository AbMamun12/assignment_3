import 'package:assignment/Presentation/Screens/responsive_builder.dart';
import 'package:assignment/Presentation/utils/screens_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: _titlebar(size),
          toolbarHeight: 80,
        ),
        drawer: _seedrawer(size),
        body:
            ResponsiveBuilder(mobile: _mobile(), tablet: _tablet(), pc: _pc()));
  }

  _seedrawer(double size) {
    DeviceType deviceType = ScreensUtils.getdevicetype(size);

    if (DeviceType.PC == deviceType || deviceType == DeviceType.TABLET) {
      return null;
    } else {
      return NewWidget();
    }
  }

  Widget _mobile() {
    return _body('Mobile');
  }

  Widget _tablet() {
    return _body('Tablet');
  }

  Widget _pc() {
    return _bodypc('Pc');
  }

  Widget _body(String devicename) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _bodytext(devicename),
          SizedBox(
            height: 20,
          ),
          _mybutton()
        ],
      ),
    );
  }

  Widget _bodypc(String devicename) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(width: 400, child: _bodytext(devicename)),
          SizedBox(
            width: 80,
          ),
          _mybutton()
        ],
      ),
    );
  }

  Widget _mybutton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        "SUBSCRIBE",
        style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold, color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(
          shape: ContinuousRectangleBorder(),
          backgroundColor: Colors.limeAccent[400]),
    );
  }

  Widget _bodytext(String devicename) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 400),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "FLUTTER WEB \nTHE BASICS",
              style:
                  GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 48),
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "${devicename} Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,",
              textAlign: TextAlign.justify,
              style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _titlebar(double size) {
    DeviceType deviceType = ScreensUtils.getdevicetype(size);
    if (deviceType == DeviceType.PC || deviceType == DeviceType.TABLET) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 28, horizontal: 28.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Logo\nHello',
              style: GoogleFonts.roboto(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Text(
                  'Home',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'About',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'My Logo',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    }
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.limeAccent[400]),
          ),
          ListTile(
            title: Text(
              "Home",
              style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
            ),
            tileColor: Colors.grey,
          ),
          ListTile(
            title: Text(
              "About",
              style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
            ),
            tileColor: Colors.limeAccent,
          )
        ],
      ),
    );
  }
}
