import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/GetTreeController.dart';

class GetTreeScreen extends StatefulWidget {
  const GetTreeScreen({super.key});

  @override
  State<GetTreeScreen> createState() => _GetTreeScreenState();
}

class _GetTreeScreenState extends State<GetTreeScreen> {
  var getTree = Get.put(GetTreeController());
  @override
  void initState() {
    getTree.getTreeCont();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (getTree.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (getTree.response.value.treePlant == null ||
            getTree.response.value.treePlant!.isEmpty) {
          return const Center(child: Text('No data available'));
        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: getTree.response.value.treePlant!.length,
                itemBuilder: (BuildContext context, int index) {
                  final plant = getTree.response.value.treePlant![index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: Get.height * 0.06,
                        width: Get.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                        ),
                        child: Row(
                          children: [
                            Image.network(
                              plant.image ?? 'default_image_url',
                              height: 300,
                              width:
                              100, // Provide a default image URL if needed
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(plant.name ?? 'Unknown Name'),
                                Container(
                                    width: Get.width * 0.5,
                                    height: Get.height * 0.03,
                                    child: Text(
                                        plant.description ?? 'No Description',
                                        overflow: TextOverflow.ellipsis)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
