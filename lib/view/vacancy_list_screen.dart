import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vacancy/controller/vacancy_controller.dart';
import 'package:vacancy/view/error_widget_with_retry.dart';
import 'package:vacancy/view/vacancy_widget.dart';

class VacancyListScreen extends StatelessWidget {
  const VacancyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vacancy List'),
      ),
      body: Consumer<VacancyController>(
        builder: (context, vacancyController, child) {
          if (vacancyController.showError) {
            return ErrorWidgetWithRetry(
              errorMessage: "Something Was Error",
              onRetry: () {
                vacancyController.fetchVacancies();
              },
            );
          } else if (vacancyController.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: vacancyController.listVacancies.length,
              itemBuilder: (context, index) {
                return VacancyWidget(
                  vacancyModel: vacancyController.listVacancies[index],
                );
              },
            );
          }
        },
      ),
    );
  }
}
