class CutPara {
  final String id;
  final String dm;
  final String rad;
  final String vc;
  final String vcRange;
  final String fz;
  final String fzRange;
  final String ap;
  final String ae;
  final String w;
  final String dmEf;
  final String s;
  final String f;
  final String mode;

  CutPara([
    this.id,
    this.dm,
    this.rad,
    this.vc,
    this.vcRange,
    this.fz,
    this.fzRange,
    this.ap,
    this.ae,
    this.w,
    this.dmEf,
    this.s,
    this.f,
    this.mode,
  ]);

  Map<String, String> toMap() {
    return {
      'id': id,
      'dm': dm,
      'rad': rad,
      'vc': vc,
      'vcRange': vcRange,
      'fz': fz,
      'fzRange': fzRange,
      'ap': ap,
      'ae': ae,
      'w': w,
      'dmEf': dmEf,
      's': s,
      'f': f,
      'mode': mode,
    };
  }
}
