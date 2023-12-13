import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/consts/colors.dart';
import 'package:weather_app/consts/images.dart';
import 'package:weather_app/consts/strings.dart';
import 'package:weather_app/utils/our_themes.dart';
import 'package:intl/intl.dart';

main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: CustomThemes.lightTheme,
      darkTheme: CustomThemes.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const WeatherApp(),
      title: "Weather App",
    );
  }
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    var date = DateFormat('yMMMMd').format(DateTime.now());
    var theme=Theme.of(context);
    var Controller=Get.put(MainController());
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
       Get.
      appBar: AppBar(
        title: '$date'.text.color(theme.primaryColor).make(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
             Get.changeThemeMode(ThemeMode.dark);
            },
            icon: Icon(
              Icons.light_mode_rounded,
              color: theme.iconTheme.color,
Get.
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert_rounded,
              color: theme.iconTheme.color,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
            child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              'Vancouver'
                  .text
                  .fontFamily('poppins_bold')
                  .size(32).color(theme.primaryColor)
                  .letterSpacing(3)
                  .make(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'asset/weather/01d.png',
                    height: 80,
                    width: 80,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: '37$degree',
                      style: TextStyle(
                          color: theme.primaryColor,
                          fontSize: 64,
                          fontFamily: 'poppins'),
                    ),
                    TextSpan(
                      text: 'Sunny',
                      style: TextStyle(
                          color: theme.primaryColor,
                          letterSpacing: 3,
                          fontSize: 14,
                          fontFamily: 'poppins_light'),
                    )
                  ])),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton.icon(
                      onPressed: null,
                      icon: Icon(Icons.expand_less_rounded, color: theme.iconTheme.color),
                      label: '41$degree'.text.color(theme.iconTheme.color).make()),
                  5.widthBox,
                  TextButton.icon(
                      onPressed: null,
                      icon: Icon(Icons.expand_more_rounded, color: theme.iconTheme.color),
                      label: '26$degree'.text.color(theme.iconTheme.color).make()),
                ],
              ),
              10.heightBox,
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(3, (index) {
                    var iconslist = [clouds, humidity, windspeed];
                    var values = ['70%', '40', '3.5 km/h'];
                    return Column(
                      children: [
                        Image.asset(
                          iconslist[index],
                          height: 60,
                          width: 60,
                        )
                            .box
                            .padding(EdgeInsets.all(8))
                            .gray200
                            .roundedSM
                            .make(),
                        10.heightBox,
                        '${values[index]}'.text.gray400.make(),
                      ],
                    );
                  })),
              10.heightBox,
              Divider(),
              10.heightBox,
              SizedBox(
                height: 150,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                            color: cardColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              '${index + 1}AM'.text.gray200.make(),
                              Image.asset(
                                'asset/weather/09n.png',
                                width: 80,
                              ),
                              '38$degree'.text.gray200.make(),
                            ],
                          ));
                    }),
              ),
              20.heightBox,
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  'Next 7 days'.text.semiBold.size(16).make(),
                  TextButton(onPressed: () {}, child: 'View All'.text.make()),
                ],
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 7,
                  itemBuilder: (BuildContext context, int index) {
                    var day = DateFormat('EEEE')
                        .format(DateTime.now().add(Duration(days: index + 1)));
                    return Card(
                      color: theme.cardColor,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: '$day'.text.color(theme.iconTheme.color).semiBold.make()),
                            Expanded(
                              child: TextButton.icon(
                                  onPressed: null,
                                  icon: Image.asset('asset/weather/50n.png',width: 40,),
                                  label: '26$degree'.text.gray800.make()),
                            ),
                             RichText(text: TextSpan(children: [
                               TextSpan(
                                 text: '38$degree',
                                 style: TextStyle(
                                   color: theme.primaryColor,
                                   fontFamily: 'poppins',
                                   fontSize: 16,
                                 )
                               ),
                               TextSpan(
                                   text: ' /24$degree',
                                   style: TextStyle(
                                     color: theme.primaryColor,
                                     fontFamily: 'poppins',
                                     fontSize: 16,
                                   )
                               ),
                             ]))
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        )),
      ),
    );
  }
}
