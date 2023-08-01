import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../widgets/dotted_line_widget.dart';
import 'chip_item_widget.dart';

class ItemAdapterWidget extends StatelessWidget {
  const ItemAdapterWidget({Key? key,  this.title="Jupiter", this.description="Jupiter is the largest planet in our solar system, with a diameter of approximately 139,820 kilometers (86,881 miles). It is more than 11 times the diameter of Earth, making it a true giant. This gas giant is primarily composed of hydrogen and helium, similar to the composition of the sun.",this.image="https://i.imgur.com/sOfOZeX.png"}) : super(key: key);
final String title;
final String description;
final String? image;
  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color:
                isDark ? const Color(0xff242634) : Colors.white,
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                    bottom: Radius.circular(6))),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child:
                        CachedNetworkImage(
                          fit: BoxFit.fill,
                          width: 93,
                          height: 120,
                          imageUrl: image??"https://i.imgur.com/sOfOZeX.png",
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,

                              ),
                            ),
                          ),
                          placeholder: (context, url) =>
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                               child: SizedBox(
                                 width: 93,
                                 height: 120,
                               ),
                             ),
                          errorWidget: (context, url, error) =>
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: SizedBox(
                                  width: 93,
                                  height: 120,
                                ),
                              ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(title,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight:
                                              FontWeight.w700,
                                              color: isDark
                                                  ? const Color(0xffDADBE1)
                                                  : const Color(
                                                  0xff001E48))),
                                      Text("The Milky Way",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight:
                                              FontWeight.w400,
                                              color: isDark
                                                  ? const Color(0xff7781A7)
                                                  .withOpacity(
                                                  0.800000011920929)
                                                  : const Color(0xff001E48)
                                                  .withOpacity(
                                                  0.800000011920929))),
                                    ],
                                  ),
                                ),
                                SvgPicture.asset(
                                  "assets/home/Frame.svg",
                                  width: 26,
                                  height: 26,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const  Wrap(
                              runSpacing: 6,
                              spacing: 6,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment:
                              WrapCrossAlignment.center,
                              children: [
                                ChipItemWidget(
                                    image: "assets/home/distance.svg",
                                    value: "139,820 KM"),
                                ChipItemWidget(
                                    image:
                                    "assets/home/Frame (1).svg",
                                    value: '1.898 × 10^27 KG'),
                                ChipItemWidget(
                                    image: "assets/home/baggage.svg",
                                    value: "1 large"),
                                ChipItemWidget(
                                    image:
                                    "assets/home/Frame (2).svg",
                                    value: '8 passengers'),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Divider(
                    thickness: 0.5,
                    color: isDark
                        ? const Color(0xff181922)
                        : const Color(0xffE5EAF6),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                        height: 2,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: isDark
                            ? const Color(0xff7781A7)
                            .withOpacity(0.800000011920929)
                            : const Color(0xff001E48)
                            .withOpacity(0.800000011920929)),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: DottedLine(
              dashColor:
              isDark ? const Color(0xff242634) : Colors.white,
              alignment: WrapAlignment.center,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color:
                isDark ? const Color(0xff242634) : Colors.white,
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(6),
                    bottom: Radius.circular(16))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("\$ 7000/Day",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: isDark
                                      ? const Color(0xff8968FF)
                                      : const Color(0xff5135B4))),
                          Text("\$ 140 total (from 3 sites)",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: isDark
                                      ? const Color(0xff7781A7)
                                      .withOpacity(
                                      0.699999988079071)
                                      : const Color(0xff001E48)
                                      .withOpacity(
                                      0.699999988079071))),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(8)),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xff002F75),
                                  Color(0xff5135B4),
                                ])),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 32, vertical: 11),
                          child: Text("Book",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
