import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trips/cubit/app_cubit_state.dart';
import 'package:trips/cubit/app_cubits.dart';
import 'package:trips/misc/colors.dart';
import 'package:trips/pages/detail_pages/cubit/store_page_info_cubit.dart';
import 'package:trips/pages/home_page.dart';
import 'package:trips/widgets/app_button.dart';
import 'package:trips/widgets/app_large_text.dart';
import 'package:trips/widgets/app_text.dart';
import 'package:trips/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selected_index = -1;
  String? icon = "heart_";
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        DetailState detail = state as DetailState;
        var list = BlocProvider.of<StorePageInfoCubits>(context).state;
        for (int i = 0; i < list.length; i++) {
          if (list[i].name == detail.places.name) {
            selected_index = list[i].index!;
            icon = list[i].icon;
          }
        }

        return Scaffold(
          body: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Stack(
                children: [
                  Positioned(
                      left: 0,
                      right: 0,
                      child: InkWell(
                        onTap: () {
                          BlocProvider.of<AppCubits>(context).goHome();
                        },
                        child: Container(
                          width: double.maxFinite,
                          height: 300,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "http://mark.bslmeiyu.com/uploads/${detail.places.img}"),
                                fit: BoxFit.cover),
                          ),
                        ),
                      )),
                  Positioned(
                    left: 20,
                    child: menu(Colors.white, Container(), () => null),
                  ),
                  Positioned(
                    top: 250,
                    child: Container(
                      padding:
                          const EdgeInsets.only(right: 20, left: 20, top: 30),
                      width: MediaQuery.of(context).size.width,
                      height: 700,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppLargeText(
                                  text: detail.places.name,
                                  color: Colors.black.withOpacity(0.8)),
                              AppLargeText(
                                  text: "\$${detail.places.price}",
                                  color: AppColors.mainColor),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icon/location-pin.svg",
                                // ignore: deprecated_member_use
                                color: AppColors.mainColor,
                                height: 20,
                                width: 20,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              AppText(
                                text: detail.places.location,
                                color: AppColors.textColor1,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                return SvgPicture.asset(
                                  "assets/icon/star-1.svg",
                                  // ignore: deprecated_member_use
                                  color: index < detail.places.stars
                                      ? AppColors.starColor
                                      : AppColors.textColor2,
                                  height: 20,
                                  width: 20,
                                );
                              }),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            AppText(
                              text: "(${detail.places.stars.toString()}.0)",
                              color: AppColors.textColor2,
                            )
                          ]),
                          const SizedBox(
                            height: 25,
                          ),
                          AppLargeText(
                            text: "People",
                            color: Colors.black.withOpacity(0.8),
                            size: 20,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          AppText(
                            text: "Number of people in your group",
                            color: AppColors.mainTextColor,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Wrap(
                            children: List.generate(5, (index) {
                              return InkWell(
                                onTap: () {
                                  var data = state.places;
                                  var list =
                                      BlocProvider.of<StorePageInfoCubits>(
                                              context)
                                          .state;
                                  for (int i = 0; i < list.length; i++) {
                                    if (list[i].name == data.name) {
                                      if (list[i].index != index) {
                                        BlocProvider.of<StorePageInfoCubits>(
                                                context)
                                            .updatePageInfo(detail.places.name,
                                                index, icon);
                                        selected_index = index;
                                      }
                                    }
                                  }
                                  if (selected_index == -1) {
                                    BlocProvider.of<StorePageInfoCubits>(
                                            context)
                                        .addPageInfo(
                                            detail.places.name, index, icon);
                                  }

                                  setState(() {
                                    selected_index = index;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: AppButton(
                                    color: selected_index == index
                                        ? Colors.white
                                        : Colors.black,
                                    backgroundColor: selected_index == index
                                        ? Colors.black
                                        : AppColors.buttonBackground,
                                    size: 50,
                                    borderColor: selected_index == index
                                        ? Colors.black
                                        : AppColors.buttonBackground,
                                    text: (index + 1).toString(),
                                  ),
                                ),
                              );
                            }),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AppLargeText(
                            text: "Description",
                            color: Colors.black.withOpacity(0.8),
                            size: 20,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AppText(
                            text: detail.places.description,
                            color: AppColors.mainTextColor,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 20,
                      left: 20,
                      right: 20,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              var list =
                                  BlocProvider.of<StorePageInfoCubits>(context)
                                      .state;
                              if (list.isEmpty) {
                                setState(() {
                                  icon = "heart_";
                                });
                                BlocProvider.of<StorePageInfoCubits>(context)
                                    .updatePageWish(detail.places.name,
                                        selected_index, icon);
                              } else {
                                for (int i = 0; i < list.length; i++) {
                                  if (list[i].name == detail.places.name) {
                                    if (list[i].icon == "heart") {
                                      setState(() {
                                        icon = "heart_";
                                      });
                                      BlocProvider.of<StorePageInfoCubits>(
                                              context)
                                          .updatePageWish(detail.places.name,
                                              selected_index, icon);
                                      return;
                                    } else {
                                      setState(() {
                                        icon = "heart";
                                      });
                                      BlocProvider.of<StorePageInfoCubits>(
                                              context)
                                          .updatePageWish(detail.places.name,
                                              selected_index, icon);
                                      return;
                                    }
                                  }
                                }
                              }
                            },
                            child: AppButton(
                              color: AppColors.textColor1,
                              backgroundColor: Colors.white,
                              size: 60,
                              borderColor: AppColors.textColor1,
                              isIcon: true,
                              icon: icon,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          ResponsiveButton(
                            isResponsive: true,
                          ),
                        ],
                      )),
                ],
              )),
        );
      },
    );
  }
}
