import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../providers/result_provider.dart';
import '../favorites/widgets/item_adpter_widget.dart';
import 'model/result_model.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late ScrollController _scrollViewController;
  bool _showAppbar = true;
  bool isScrollingDown = false;

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController();
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection == ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          setState(() {});
        }
      }

      if (_scrollViewController.position.userScrollDirection == ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _scrollViewController.removeListener(() {});
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    Provider.of<ResultProvider>(context).init();
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor:
                isDark ? const Color(0xff10101B) : const Color(0xff002B75),
            centerTitle: true,
            leading:
                GestureDetector(onTap: () =>Navigator.pop(context),child: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white)),
            title:_showAppbar? Container(
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12))),child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9,vertical: 12),
                      child: Row(children: [Text("Planets",style: TextStyle(color:  Color(0xff001E48),fontSize: 14)),Spacer(),Icon(Icons.filter_list, color: Color(0xff001E48),)],),
                    )):Text("London",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w700)),
            bottom: TabBar(
              dividerColor: Colors.transparent,
               indicatorSize: TabBarIndicatorSize.label,
                padding: const EdgeInsets.only(bottom: 10),
                labelColor: Colors.white,
                labelStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                unselectedLabelColor:
                    const Color(0xff6C8DE9).withOpacity(0.6000000238418579),
                indicatorColor: Colors.white,
                isScrollable: true,
                tabs: [
                  Tab(
                    text: "Recommended",
                  ),
                  Tab(text: "Price"),
                  Tab(text: "Distance"),
                  Tab(text: "Class"),
                ])),
        body: TabBarView(children: [
          Consumer<ResultProvider>(
            builder: (context, provider, child) {
              List<Result>? result = provider.resultModel.result;

              if (result == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                controller: _scrollViewController,
                itemCount: result.length ?? 0,
                padding: const EdgeInsets.only(top: 14),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ItemAdapterWidget(
                    title: result?[index].title ?? "",
                    description: result?[index].title ?? "",
                    image: result?[index].imageUrl,
                  );
                },
              );
            },
          ),
          Center(
              child: Text(
            "Price",
            style: TextStyle(color: Colors.white),
          )),
          Center(
              child: Text("Distance", style: TextStyle(color: Colors.white))),
          Center(child: Text("Class", style: TextStyle(color: Colors.white))),
        ]),
      ),
    );
  }
}
