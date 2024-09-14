import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vacancy/view/vacancy_details_screen.dart';

import '../model/vacancy_model.dart';

class VacancyWidget extends StatelessWidget {
  final VacancyModel vacancyModel;

  const VacancyWidget({
    super.key,
    required this.vacancyModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VacancyDetailsScreen(
              vacancyModel: vacancyModel,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: vacancyModel.imageUrl ?? "-",
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              vacancyModel.title ?? "-",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(vacancyModel.company ?? "-"),
            const SizedBox(height: 8),
            Text(vacancyModel.description ?? "-"),
            const SizedBox(height: 8),
            Text('Posted on: ${vacancyModel.datePosted}'),
          ],
        ),
      ),
    );

    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: vacancyModel.imageUrl!,
            width: MediaQuery.of(context).size.width,
            height: 100,
            fit: BoxFit.cover,
          ),
          Text(vacancyModel.title ?? "-"),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(vacancyModel.company ?? "-"),
          Text(vacancyModel.description ?? "-"),
          Text('Posted on: ${vacancyModel.datePosted}'),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VacancyDetailsScreen(
              vacancyModel: vacancyModel,
            ),
          ),
        );
      },
    );
  }
}
