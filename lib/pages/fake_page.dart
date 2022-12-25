import 'package:flutter/material.dart';

class FakePage extends StatelessWidget {
  final dynamic data;
  final String flag;
  const FakePage({super.key, required this.data, required this.flag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: const Color.fromARGB(255, 69, 69, 69),
        ),
        backgroundColor: const Color(0xffD3F3FF),
        title: Text(
          data.title,
          style: const TextStyle(
            color: Color.fromARGB(255, 69, 69, 69),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Center(
            child: Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(flag),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            data.code,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 32),
          ),
          const SizedBox(height: 20),
          Text(
            'Asl narxi: ${data.cbPrice}',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Color.fromARGB(255, 100, 100, 100),
            ),
          ),
          const SizedBox(height: 30),
          data.nbuBuyPrice == ''
              ? const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    'NBU banki bu valyuta bilan savdolarni vaqtincha to\'xtatgan',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              : Column(
                  children: [
                    Text(
                      'Olish narxi: ${data.nbuBuyPrice}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Color.fromARGB(255, 100, 100, 100),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Sotish narxi: ${data.nbuCellPrice}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Color.fromARGB(255, 100, 100, 100),
                      ),
                    ),
                  ],
                )
        ],
      ),
    );
  }
}
