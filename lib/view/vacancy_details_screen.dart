import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:vacancy/model/vacancy_model.dart';

class VacancyDetailsScreen extends StatelessWidget {
  final VacancyModel vacancyModel;

  const VacancyDetailsScreen({super.key, required this.vacancyModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(vacancyModel.title ?? "-"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
              Text(
                vacancyModel.company ?? "-",
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Text('Location: ${vacancyModel.location ?? "-"}'),
              const SizedBox(height: 8),
              Text('Salary: ${vacancyModel.salary ?? "-"}'),
              const SizedBox(height: 8),
              Text('Posted on: ${vacancyModel.datePosted ?? "-"}'),
              const SizedBox(height: 16),
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(vacancyModel.description ?? "-"),
              const SizedBox(height: 16),
              const Text(
                'Long Description',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(vacancyModel.longDescription ?? "-"),
            ],
          ),
        ),
      ),
    );
  }
}
