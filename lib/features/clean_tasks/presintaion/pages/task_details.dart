// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:pro_task_weather/features/clean_tasks/domain/entities/task_entity.dart';

class TaskDetails extends StatelessWidget {
  final TaskEntity detailedTask;
final String imageUrl;
  TaskDetails({super.key, required this.imageUrl,required this.detailedTask});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Details'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitleSection(),
                const SizedBox(height: 16),
                _buildDescriptionSection(),
                const SizedBox(height: 16),
                _buildPrioritySection(),
                const SizedBox(height: 16),
                _buildWeatherSection(),
                const SizedBox(height: 16),
                _buildStatusSection(),
                const SizedBox(height: 16),
                _buildTimeSection()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          detailedTask.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(
          detailedTask.isDone ? Icons.check_circle : Icons.circle_outlined,
          color: detailedTask.isDone ? Colors.green : Colors.red,
          size: 28,
        ),
      ],
    );
  }

  Widget _buildDescriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          detailedTask.desc,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildPrioritySection() {
    return Row(
      children: [
        const Icon(Icons.flag, color: Colors.orangeAccent),
        const SizedBox(width: 8),
        Text(
          'Priority: ${detailedTask.priority}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildWeatherSection() {
    return Row(
      children: [
        Image.network("https:$imageUrl"),
        const SizedBox(width: 8),
        Text(
          detailedTask.relatedWeather,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildStatusSection() {
    return Row(
      children: [
        const Icon(Icons.calendar_today, color: Colors.purple),
        const SizedBox(width: 8),
        Text(
          detailedTask.isDone ? 'Status: Completed' : 'Status: Pending',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildTimeSection() {
    return Row(
      children: [
        const Icon(Icons.access_time, color: Colors.red),
        const SizedBox(width: 8),
        Column(
          children: [
            Text(
              "Due Date : ${detailedTask.dueDate.year}-${detailedTask.dueDate.month}-${detailedTask.dueDate.day}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              "Created At : ${detailedTask.dueDate.hour}:${detailedTask.dueDate.minute}:${detailedTask.dueDate.second}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
