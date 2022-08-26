import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo/commons/app_assets.dart';
import 'package:demo/commons/app_colors.dart';
import 'package:demo/commons/app_text_styles.dart';
import 'package:demo/commons/constant.dart';
import 'package:demo/commons/widgets.dart';
import 'package:demo/controllers/AppIntroProvider/app_intro_provider.dart';
import 'package:demo/views/Auth_Views/sign_in_with_google_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppIntroView extends StatefulWidget {
  const AppIntroView({Key? key}) : super(key: key);

  @override
  State<AppIntroView> createState() => _AppIntroViewState();
}

class _AppIntroViewState extends State<AppIntroView> {
  late AppIntroProvider appIntroProvider = Provider.of<AppIntroProvider>(context, listen: false);
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (appIntroProvider.index < appIntroProvider.introSubTitle.length - 1) {
            carouselController.nextPage();
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
              return const SignInWithGoogleView();
            }));
          }
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.arrow_forward_outlined),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(AppAssets.mainBG), fit: BoxFit.cover)),
            ),
          ),
          Consumer<AppIntroProvider>(
            builder: (BuildContext context, value, Widget? child) {
              return SizedBox(
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          indicator(width: appIntroProvider.index == 0 ? 20 : 5),
                          indicator(width: appIntroProvider.index == 1 ? 20 : 5),
                          indicator(width: appIntroProvider.index == 2 ? 20 : 5),
                        ],
                      ),
                    ),
                    CarouselSlider(
                      carouselController: carouselController,
                      options: CarouselOptions(
                        height: AppConst.screenHeight(context) * .4,
                        viewportFraction: 1,
                        autoPlay: false,
                        onPageChanged: (int index, reason) {
                          appIntroProvider.carousalIndex(index);
                        },
                      ),
                      items: List.generate(appIntroProvider.introTitle.length, (index) {
                        String title = appIntroProvider.introTitle[index];
                        String subTitle = appIntroProvider.introSubTitle[index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: [
                              AppWidgets.spacer(verticalSpace: 20),
                              Text(
                                title,
                                style: AppTextStyles.subTitleStyle,
                              ),
                              AppWidgets.spacer(verticalSpace: 20),
                              Text(
                                subTitle,
                                style: AppTextStyles.subTitleStyle
                                    .copyWith(fontWeight: FontWeight.w300),
                              ),
                              AppWidgets.spacer(verticalSpace: 20),
                            ],
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget indicator({required double width}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        height: 5,
        width: width,
        decoration:
            BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(100)),
      ),
    );
  }
}
