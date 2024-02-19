import 'dart:collection';
import 'package:watter_bucket/models/step_model.dart';

class WaterMeasurement {
  final int x;
  final int y;
  final int z;

  WaterMeasurement(this.x, this.y, this.z);

  List<StepModel> getNeighbors(StepModel s) {
    List<StepModel> neighbors = [];

    neighbors.add(StepModel(0, s.buckety, 'Empty bucket x', pred: s));
    neighbors.add(StepModel(s.bucketx, 0, 'Empty bucket y', pred: s));
    neighbors.add(StepModel(x, s.buckety, 'Fill bucket x', pred: s));
    neighbors.add(StepModel(s.bucketx, y, 'Fill bucket y', pred: s));

    // Transfer from bucket x to bucket y
    if (s.bucketx >= (y - s.buckety)) {
      neighbors.add(StepModel(
          s.bucketx - (y - s.buckety), y, 'Transfer from bucket x to bucket y',
          pred: s));
    } else {
      neighbors.add(StepModel(
          0, s.buckety + s.bucketx, 'Transfer from bucket x to bucket y',
          pred: s));
    }

    // Transfer from bucket y to bucket x
    if (s.buckety >= (x - s.bucketx)) {
      neighbors.add(StepModel(
          x, s.buckety - (x - s.bucketx), 'Transfer from bucket y to bucket x',
          pred: s));
    } else {
      neighbors.add(StepModel(
          s.bucketx + s.buckety, 0, 'Transfer from bucket y to bucket x',
          pred: s));
    }
    return neighbors;
  }

  List<StepModel> solve() {
    if (!canResolve(x, y, z)) {
      return [];
    }

    Queue<StepModel> queue = Queue();
    Set<StepModel> visited = {};

    StepModel initial = StepModel(0, 0, '', pred: null);

    queue.add(initial);
    visited.add(initial);

    while (queue.isNotEmpty) {
      StepModel current = queue.removeFirst();
      List<StepModel> neighbors = getNeighbors(current);

      for (var n in neighbors) {
        if (!visited.contains(n)) {
          visited.add(n);
          queue.add(n);
          if (n.bucketx == z || n.buckety == z) {
            return solution(n);
          }
        }
      }
    }
    return [];
  }

  List<StepModel> solution(StepModel step) {
    List<StepModel> solution = [];
    while (step.bucketx != 0 || step.buckety != 0) {
      solution.insert(0, step); // Insert at the beginning to reverse the order
      step = step.pred!;
    }
    return solution;
  }

  bool canResolve(int x, int y, int z) {
    if (z > x && z > y) {
      return false;
    }
    if (z == x || z == y || z == x + y) {
      return true;
    }
    return z % gcd(x, y) == 0;
  }

  int gcd(int x, int y) {
    while (y != 0) {
      int temp = y;
      y = x % y;
      x = temp;
    }
    return x;
  }
}
