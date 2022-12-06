import 'package:cek_nikmu/bloc/nik_bloc.dart';
import 'package:cek_nikmu/models/nik_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameTextboxController = TextEditingController();
  final _nikTextboxController = TextEditingController();

  NIKModel? _futureNIK;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('C-NIKmu'),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                _nameTextField(),
                _nikTextField(),
                _buttonSubmit(),
                _showResult()
              ],
            )),
      )),
    );
  }

  Widget _nameTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Name"),
      keyboardType: TextInputType.text,
      controller: _nameTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Name harus diisi";
        }
        return null;
      },
    );
  }

  Widget _nikTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "NIK"),
      keyboardType: TextInputType.text,
      controller: _nikTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "NIK harus diisi";
        }
        return null;
      },
    );
  }

  Widget _buttonSubmit() {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
      OutlinedButton(
        child: Text("Generate"),
        onPressed: () {
          generate();
        }),
        OutlinedButton(
        child: Text("Reset"),
        onPressed: () {
          setState(() {
            _futureNIK = null;
          });
        })
    ],),
    );
  }

  Widget _showResult() {
    if (_futureNIK != null)
      return _detailResult(_futureNIK);
    else
      return Container();
  }

  Widget _detailResult(data) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(children: [
            Text(
              "${_nameTextboxController.text}",
              style: TextStyle(fontSize: 20),
            ),
            ListTile(
              title: Text("NIK"),
              subtitle: Text("${data.nik}"),
            ),
            ListTile(
              title: Text("Kelamin"),
              subtitle: Text("${data.kelamin}"),
            ),
            ListTile(
              title: Text("Tanggal Lahir"),
              subtitle: Text("${data.tambahan['pasaran']}"),
            ),
            ListTile(
              title: Text("Usia"),
              subtitle: Text("${data.tambahan['usia']}"),
            ),
            ListTile(
              title: Text("Ulang Tahun"),
              subtitle: Text("${data.tambahan['ultah']}"),
            ),
            ListTile(
              title: Text("Zodiak"),
              subtitle: Text("${data.tambahan['zodiak']}"),
            ),
            ListTile(
              title: Text("Kecamatan"),
              subtitle: Text("${data.kecamatan}"),
            ),
            ListTile(
              title: Text("Kabupaten/Kota"),
              subtitle: Text("${data.kotakab}"),
            ),
            ListTile(
              title: Text("Unik Kode"),
              subtitle: Text("${data.uniqcode}"),
            ),
            ListTile(
              title: Text("Kode Pos"),
              subtitle: Text("${data.tambahan['kodepos']}"),
            ),
          ]),
        ),
      ),
    );
  }

  generate() {
    NIKBloc.generateNIK(nik: _nikTextboxController.text).then(
        (value) async {
              setState(() {
                _futureNIK = value;
              });
            }, onError: (error) {
      print(error);
      AlertDialog alertDialog = AlertDialog(
        content: Text("${error}"),
        actions: [
          OutlinedButton(
            child: const Text("OK"),
            onPressed: () => Navigator.pop(context),
          )
        ],
      );
      showDialog(builder: (context) => alertDialog, context: context);
    });
  }
}
