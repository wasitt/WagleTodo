import 'package:flutter/material.dart';
import 'package:wagle_todo/component/app_bar.dart';

import 'package:go_router/go_router.dart';
import 'package:wagle_todo/component/icon_buttons.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ShopScreenAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              RecentSearchList(),
              AdvertisingBanner(),
              PopularDownloadList(),
            ],
          ),
        ),
      ),
    );
  }
}

///최근 검색창
///
class RecentSearchList extends StatelessWidget {
  const RecentSearchList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int itemCount = 2;
    double height = 0;
    if (itemCount < 7) {
      height = itemCount * 40;
    } else {
      height = MediaQuery.of(context).size.height / 2.5;
    }
    return Container(
      height: height,
      child: ListView.builder(
        itemCount: itemCount,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: ((context, index) {
          return RecentSearchTile();
        }),
      ),
    );
  }
}
//

///중간 광고 배너
///
class AdvertisingBanner extends StatelessWidget {
  const AdvertisingBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("asset/img/광고예시.png"),
      width: double.infinity,
    );
  }
}

///인기 다운로드 리스트
///
class PopularDownloadList extends StatelessWidget {
  const PopularDownloadList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: const Column(
        children: [
          PopularDownloaded(
              text: "서강대학교 학사일정1", route: "/category_information"),
          PopularDownloaded(
              text: "서강대학교 학사일정2", route: "/category_information"),
          PopularDownloaded(
              text: "서강대학교 학사일정3", route: "/category_information"),
          PopularDownloaded(
              text: "서강대학교 학사일정1", route: "/category_information"),
          PopularDownloaded(
              text: "서강대학교 학사일정1", route: "/category_information"),
          PopularDownloaded(
              text: "서강대학교 학사일정1", route: "/category_information"),
          PopularDownloaded(
              text: "서강대학교 학사일정1", route: "/category_information"),
          PopularDownloaded(
              text: "서강대학교 학사일정1", route: "/category_information"),
          PopularDownloaded(
              text: "서강대학교 학사일정1", route: "/category_information"),
        ],
      ),
    );
  }
}

///최근 검색창의 타일
///
class RecentSearchTile extends StatelessWidget {
  const RecentSearchTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        children: [
          const Expanded(child: Text("data")),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.clear),
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}

///인기 다운로드 항목
///
class PopularDownloaded extends StatelessWidget {
  final String text;
  final String route;
  const PopularDownloaded({
    required this.text,
    required this.route,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListTile(
        leading: Image.asset("asset/img/서강대아이콘.png"),
        title: Text(text),
        onTap: () => context.go(route),

        ///다운로드 완료 시에 아이콘 변경되게 하고싶음.
        trailing:
            const OnOffIconButton(onIcon: Icons.check, offIcon: Icons.download),
      ),
    );
  }
}
