enum Consult { videoCall, inPerson }

extension ConsultExtension on Consult {
  String get name {
    switch (this) {
      case Consult.videoCall:
        return 'Video Call';
      case Consult.inPerson:
        return 'In-Person';
    }
  }
}
