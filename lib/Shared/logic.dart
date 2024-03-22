import 'dart:math';

class Logic {
  double hasil = 0;
  int s1 = 1;
  int s2 = 1;

  meterLogic(double angka, String satuan1, String satuan2) {
    Map<String, dynamic> data = {
      'MM': 1,
      'CM': 2,
      'DM': 3,
      'M': 4,
      'DAM': 5,
      'HM': 6,
      'KM': 7,
    };

    if (satuan1.isNotEmpty) {
      s1 = data[satuan1];
    }
    if (satuan2.isNotEmpty) {
      s2 = data[satuan2];
    }

    if (s1 > s2) {
      return hasil = angka * pow(10, s1 - s2);
    }
    if (s1 == s2) {
      return hasil = angka * 1;
    }
    if (s1 < s2) {
      return hasil = angka / pow(10, s2 - s1);
    }
  }

  gramLogic(double angka, String satuan1, String satuan2) {
    Map<String, dynamic> data = {
      'MG': 1,
      'CG': 2,
      'DG': 3,
      'G': 4,
      'DAG': 5,
      'HG': 6,
      'KG': 7,
      'KUINTAL': 9,
      'TON': 10,
    };

    if (satuan1.isNotEmpty) {
      s1 = data[satuan1];
    }
    if (satuan2.isNotEmpty) {
      s2 = data[satuan2];
    }

    if (s1 > s2) {
      return hasil = angka * pow(10, s1 - s2);
    }
    if (s1 == s2) {
      return hasil = angka * 1;
    }
    if (s1 < s2) {
      return hasil = angka / pow(10, s2 - s1);
    }
  }

  literLogic(double angka, String satuan1, String satuan2) {
    Map<String, dynamic> data = {
      'MM': 1,
      'CC / ML / CM': 2,
      'LITER / DM': 3,
      'M': 4,
      'DAM': 5,
      'HM': 6,
      'KM': 7,
    };

    if (satuan1.isNotEmpty) {
      s1 = data[satuan1];
    }
    if (satuan2.isNotEmpty) {
      s2 = data[satuan2];
    }

    if (s1 > s2) {
      return hasil = angka * pow(1000, s1 - s2);
    }
    if (s1 == s2) {
      return hasil = angka * 1;
    }
    if (s1 < s2) {
      return hasil = angka / pow(1000, s2 - s1);
    }
  }

  timeLogic(double angka, String satuan1, String satuan2) {
    Map<String, dynamic> data = {
      'TAHUN': 1,
      'BULAN': 2,
      'MINGGU': 3,
      'HARI': 4,
      'JAM': 5,
      'MENIT': 6,
      'DETIK': 7,
    };

    if (satuan1.isNotEmpty) {
      s1 = data[satuan1];
    }
    if (satuan2.isNotEmpty) {
      s2 = data[satuan2];
    }
    hasil = angka;

//KONVERSI KE BAWAH
    for (var i = s1+1; i <= s2; i++) {
      if (i == data['BULAN']) {
        hasil = hasil * 12;
      }
      if (i == data['MINGGU']) {
        hasil = hasil * 4 ;
        if (s1 == 1) {
          hasil = hasil +4;
        }
      }
      if (i == data['HARI']) {
        hasil = hasil * 7;
        if (s1 == 2) {
          hasil = hasil +2;
        }
        if (s1 == 1) {
          hasil = hasil +29;
        }
      }
      if (i == data['JAM']) {
        hasil = hasil * 24;
      }
      if (i == data['MENIT']) {
        hasil = hasil * 60;
      }
      if (i == data['DETIK']) {
        hasil = hasil * 60;
      }
    }

//KONVERSI KE ATAS
    for (var i = s1-1; i >= s2; i--) {
      if (i == data['MENIT']) {
        hasil = hasil / 60;
      }
      if (i == data['JAM']) {
        hasil = hasil / 60;
      }
      if (i == data['HARI']) {
        hasil = hasil / 24;
      }
      if (i == data['MINGGU']) {
        hasil = hasil / 7;
      }
      if (i == data['BULAN']) {
        hasil = hasil / 4;
      }
      if (i == data['TAHUN']) {
        hasil = hasil / 12;
      }
    }

    return hasil;
  }
}
