import 'package:flutter_test/flutter_test.dart';
import 'package:watter_bucket/models/step_model.dart';
import 'package:watter_bucket/models/water_mesurement.dart';

void main() {
  group('WaterMeasurement Tests', () {
    test('Test GCD for canResolve method', () {
      expect(WaterMeasurement(3, 5, 4).gcd(3, 5), 1);
      expect(WaterMeasurement(12, 15, 3).gcd(12, 15), 3);
    });

    test('Test canResolve method', () {
      final wm = WaterMeasurement(3, 5, 4);
      expect(wm.canResolve(3, 5, 4), isTrue);
      expect(wm.canResolve(3, 5, 7), isFalse);
    });

    test('Test getNeighbors method', () {
      final wm = WaterMeasurement(3, 5, 4);
      final step = StepModel(0, 0, '');
      final neighbors = wm.getNeighbors(step);

      expect(neighbors.length, 6);
    });

    test('Test solve method with solvable case', () {
      final wm = WaterMeasurement(3, 5, 4);
      final solution = wm.solve();

      expect(solution.isNotEmpty, isTrue);
      expect(solution.any((step) => step.bucketx == 4 || step.buckety == 4), isTrue);
    });

    test('Test solve method with unsolvable case', () {
      final wm = WaterMeasurement(3, 5, 8);
      final solution = wm.solve();

      expect(solution.isEmpty, isTrue);
    });

    test('Test solution path for a specific case', () {
      final wm = WaterMeasurement(3, 5, 4);
      final solution = wm.solve();

      if (solution.isNotEmpty) {
        final lastStep = solution.last;
        expect(lastStep.bucketx == 4 || lastStep.buckety == 4, isTrue);

        for (var i = 1; i < solution.length; i++) {
          expect(solution[i].pred, solution[i - 1]);
        }
      }
    });
  });
}
