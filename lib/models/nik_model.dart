class NIKModel {
  String? nik;
  String? kelamin;
  String? lahir;
  String? provinsi;
  String? kotakab;
  String? kecamatan;
  String? uniqcode;
  dynamic tambahan;
  NIKModel(
      {this.nik,
      this.kelamin,
      this.lahir,
      this.provinsi,
      this.kotakab,
      this.kecamatan,
      this.uniqcode,
      this.tambahan});
  factory NIKModel.fromJson(Map<String, dynamic> obj) {
    return NIKModel(
        nik: obj['nik'],
        kelamin: obj['kelamin'],
        lahir: obj['lahir'],
        provinsi: obj['provinsi'],
        kotakab: obj['kotakab'],
        kecamatan: obj['kecamatan'],
        uniqcode: obj['uniqcode'],
        tambahan: (obj['tambahan'] as Map<String, dynamic>));
  }
}
