import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/breakpoints.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  bool _isWriting = false;

  // void _onSearchChanged(String value) {}

  // void _onSearchSubmitted(String value) {}

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _onPressedXmark() {
    _textEditingController.clear();
    setState(() {
      _isWriting = false;
    });
  }

  void _onChanged(String value) {
    if (_textEditingController.text.isNotEmpty) {
      _isWriting = true;
    } else {
      _isWriting = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false, // 키보드 가리는 거 막기
        appBar: AppBar(
          elevation: 1,
          title: Container(
            constraints: const BoxConstraints(
              maxWidth: Breakpoints.sm,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FaIcon(FontAwesomeIcons.arrowLeft),
                Gaps.h14,
                Expanded(
                  child: TextField(
                    onChanged: _onChanged,
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: Sizes.size5,
                        horizontal: Sizes.size16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Sizes.size5),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Sizes.size14,
                            ),
                            child: FaIcon(
                              FontAwesomeIcons.magnifyingGlass,
                              size: Sizes.size16,
                            ),
                          ),
                        ],
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (_isWriting)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: Sizes.size12,
                                vertical: Sizes.size14,
                              ),
                              child: GestureDetector(
                                onTap: _onPressedXmark,
                                child: const FaIcon(
                                  FontAwesomeIcons.solidCircleXmark,
                                  size: Sizes.size20,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Gaps.h14,
                const FaIcon(
                  FontAwesomeIcons.sliders,
                  size: Sizes.size20,
                ),
              ],
            ),
          ),
          bottom: TabBar(
            onTap: (value) => FocusManager.instance.primaryFocus?.unfocus(),
            splashFactory: NoSplash.splashFactory,
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
            isScrollable: true,
            unselectedLabelColor: Colors.grey.shade500,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size16,
            ),
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            tabs: [
              for (var tab in tabs)
                Tab(
                  text: tab,
                ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
              keyboardDismissBehavior:
                  ScrollViewKeyboardDismissBehavior.onDrag, // 키보드가 드래그할때 ㅐ사라짐
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size6,
                vertical: Sizes.size6,
              ),
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 9 / 20,
                crossAxisCount: width > Breakpoints.lg ? 5 : 2,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size10,
              ),
              itemBuilder: (context, index) => LayoutBuilder(
                builder: (context, constraint) => Column(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Sizes.size4,
                        ),
                      ),
                      child: AspectRatio(
                        aspectRatio: 9 / 15,
                        child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          placeholder: "assets/images/images.jpg",
                          image:
                              "https://images.unsplash.com/photo-1559603407-fa21f00a0afe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80",
                        ),
                      ),
                    ),
                    Gaps.v10,
                    Text(
                      "${constraint.maxWidth}this is a very long caption for my tiktok that im upload just now currently.",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: Sizes.size16 + Sizes.size2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.v5,
                    if (constraint.maxWidth < 200 || constraint.maxWidth > 250)
                      DefaultTextStyle(
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w600,
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 12,
                              backgroundImage: NetworkImage(
                                "https://avatars.githubusercontent.com/u/94308690?v=4",
                              ),
                            ),
                            Gaps.h4,
                            const Expanded(
                              child: Text(
                                "My avatar is going to be very long",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Gaps.h4,
                            FaIcon(
                              FontAwesomeIcons.heart,
                              size: Sizes.size16,
                              color: Colors.grey.shade600,
                            ),
                            Gaps.h2,
                            const Text("2.5M"),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(
                  tab,
                  style: const TextStyle(fontSize: Sizes.size16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
