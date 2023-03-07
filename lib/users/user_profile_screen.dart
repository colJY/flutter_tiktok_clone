import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/settings/settings_screen.dart';
import 'package:tiktok_clone/users/widgets/user_account.dart';
import 'package:tiktok_clone/users/widgets/persistent_tabbar.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  void _onGearPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final psizes = MediaQuery.of(context).size;
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: const Text('영주'),
                actions: [
                  IconButton(
                    onPressed: _onGearPressed,
                    icon: const FaIcon(
                      FontAwesomeIcons.gear,
                      size: Sizes.size20,
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      foregroundImage: NetworkImage(
                        "https://avatars.githubusercontent.com/u/94308690?v=4",
                      ),
                      child: Text("영주"),
                    ),
                    Gaps.v20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "@영주",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: Sizes.size18,
                          ),
                        ),
                        Gaps.h5,
                        FaIcon(
                          FontAwesomeIcons.solidCircleCheck,
                          size: Sizes.size16,
                          color: Colors.blue.shade600,
                        ),
                      ],
                    ),
                    Gaps.v24,
                    SizedBox(
                      height: Sizes.size48,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const UserAccount(
                            text: "97",
                            followtext: "Following",
                          ),
                          VerticalDivider(
                            width: Sizes.size32,
                            thickness: Sizes.size1,
                            color: Colors.grey.shade400,
                            indent: Sizes.size14,
                            endIndent: Sizes.size14,
                          ),
                          const UserAccount(
                            text: "10.5M",
                            followtext: "Followers",
                          ),
                          VerticalDivider(
                            width: Sizes.size32,
                            thickness: Sizes.size1,
                            color: Colors.grey.shade400,
                            indent: Sizes.size14,
                            endIndent: Sizes.size14,
                          ),
                          const UserAccount(
                            text: "149.3M",
                            followtext: "Likes",
                          ),
                        ],
                      ),
                    ),
                    Gaps.v14,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size12,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(
                                Sizes.size4,
                              ),
                            ),
                            child: const Text(
                              "Follow",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Gaps.h5,
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 8,
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size7,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey.shade400,
                              ),
                              borderRadius: BorderRadius.circular(
                                Sizes.size4,
                              ),
                            ),
                            child: const FaIcon(
                              FontAwesomeIcons.youtube,
                            ),
                          ),
                        ),
                        Gaps.h5,
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 8,
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size7,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey.shade400,
                              ),
                              borderRadius: BorderRadius.circular(
                                Sizes.size4,
                              ),
                            ),
                            child: const FaIcon(
                              FontAwesomeIcons.arrowDown,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gaps.v14,
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.size32,
                      ),
                      child: Text(
                        "All highlights and where to watch live matechs on FIFA +",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Gaps.v14,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        FaIcon(
                          FontAwesomeIcons.link,
                          size: Sizes.size12,
                        ),
                        Gaps.v4,
                        Text(
                          "https://www.naver.com",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Gaps.v20,
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: PersistentTabBar(),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              GridView.builder(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag, // 키보드가 드래그할때 ㅐ사라짐
                padding: EdgeInsets.zero,
                itemCount: 20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 9 / 14,
                  crossAxisCount: psizes.width < 750 ? 3 : 5,
                  crossAxisSpacing: Sizes.size2,
                  mainAxisSpacing: Sizes.size2,
                ),
                itemBuilder: (context, index) => Column(
                  children: [
                    Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: 9 / 14,
                          child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholder: "assets/images/images.jpg",
                            image:
                                "https://images.unsplash.com/photo-1559603407-fa21f00a0afe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80",
                          ),
                        ),
                        Positioned(
                          left: 3,
                          bottom: 3,
                          child: Row(
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.solidCirclePlay,
                                color: Colors.white,
                              ),
                              Gaps.h3,
                              Text(
                                "4.1M +${psizes.width}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: Sizes.size12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Center(
                child: Text('1페이지'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
