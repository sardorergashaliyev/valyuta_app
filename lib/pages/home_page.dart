import 'package:flutter/material.dart';
import 'package:valyuta/pages/fake_page.dart';
import 'package:valyuta/repository/get_info.dart';
import 'package:valyuta/store/flags.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data = [];
  GetInformationRepository api = GetInformationRepository();
  bool isLoading = false;

  Future<void> getInformation() async {
    isLoading = true;
    setState(() {});
    data = await api.getInformation();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    getInformation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD3F3FF),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      SizedBox(width: 24),
                      Text(
                        'Select Currency',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 32,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32)),
                          color: Colors.white),
                      child: ListView.builder(
                        itemCount: data.length - 1,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (a) => FakePage(
                                    data: data[index],
                                    flag: returnFlag(index),
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                const SizedBox(height: 5),
                                Container(
                                  height: 50,
                                  width: double.infinity,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 24),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      color: Colors.white),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              returnFlag(index),
                                            ),
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(12),
                                            bottomLeft: Radius.circular(12),
                                          ),
                                          color: Colors.blue,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        data[index].code ?? '',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        data[index].title ?? '',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12,
                                        ),
                                        maxLines: 1,
                                        softWrap: false,
                                        overflow: TextOverflow.fade,
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 24),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Divider(),
                                  ),
                                ),
                                const SizedBox(height: 5)
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
