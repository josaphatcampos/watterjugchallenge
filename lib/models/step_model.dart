class StepModel{
  final int bucketx;
  final int buckety;
  final String instruction;
  StepModel? pred;

  StepModel(this.bucketx, this.buckety, this.instruction,{this.pred});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is StepModel &&
              runtimeType == other.runtimeType &&
              bucketx == other.bucketx &&
              buckety == other.buckety;

  @override
  int get hashCode => bucketx.hashCode ^ buckety.hashCode;
}