import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/ui/pages/sponsors-home/sponsor_email_model.dart';
import 'package:string_validator/string_validator.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SponsorFormDialog extends StatefulWidget {
  const SponsorFormDialog({super.key});

  @override
  State<SponsorFormDialog> createState() => _SponsorFormDialogState();
}

class _SponsorFormDialogState extends State<SponsorFormDialog> {
  final formKey = GlobalKey<FormState>();
  var formSponsorModel = SponsorEmailModel();
  var maskFormatterPhone = MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  var maskFormatterCPNJ = MaskTextInputFormatter(
      mask: '###.###.###/####-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  Future<void> sendForm() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var dio = Dio(BaseOptions(
          baseUrl:
              'https://zvv2w3aywop2ld4mphc3rpdfie0bfhty.lambda-url.sa-east-1.on.aws/'));
      await dio.post('', data: formSponsorModel.toJson());
      setLoading();
      try {
        setLoading();
        Modular.to.pop();
      } catch (e) {
        setLoading();
      }
    }
  }

  var _loading = false;

  void setLoading() {
    setState(() {
      _loading = !_loading;
    });
  }

  String? fieldIsEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo não pode estar vazio';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var optionsSponsorType = [
      RadioListTile<String>(
        title: const Text('Patrocínio Diamante'),
        value: 'Patrocínio Diamante',
        groupValue: formSponsorModel.sponsorType,
        onChanged: (value) => setState(() {
          formSponsorModel = formSponsorModel.copyWith(sponsorType: value);
        }),
      ),
      RadioListTile<String>(
        title: const Text('Patrocínio Ouro'),
        value: 'Patrocínio Ouro',
        groupValue: formSponsorModel.sponsorType,
        onChanged: (value) => setState(() {
          formSponsorModel = formSponsorModel.copyWith(sponsorType: value);
        }),
      ),
      RadioListTile<String>(
        title: const Text('Patrocínio Prata'),
        value: 'Patrocínio Prata',
        groupValue: formSponsorModel.sponsorType,
        onChanged: (value) => setState(() {
          formSponsorModel = formSponsorModel.copyWith(sponsorType: value);
        }),
      ),
      RadioListTile<String>(
        title: const Text('Patrocínio Bronze'),
        value: 'Patrocínio Bronze',
        groupValue: formSponsorModel.sponsorType,
        onChanged: (value) => setState(() {
          formSponsorModel = formSponsorModel.copyWith(sponsorType: value);
        }),
      ),
    ];
    var optionsClosureDate = [
      RadioListTile<String>(
        title: const Text('Outubro de 2022 (50% de desconto)'),
        value: 'Patrocínio Diamante',
        groupValue: formSponsorModel.closureDate,
        onChanged: (value) => setState(() {
          formSponsorModel = formSponsorModel.copyWith(closureDate: value);
        }),
      ),
      RadioListTile<String>(
        title: const Text('Novembro de 2022 (40% de desconto)'),
        value: 'Novembro de 2022 (40% de desconto)',
        groupValue: formSponsorModel.closureDate,
        onChanged: (value) => setState(() {
          formSponsorModel = formSponsorModel.copyWith(closureDate: value);
        }),
      ),
      RadioListTile<String>(
        title: const Text('Dezembro de 2022 (30% de desconto)'),
        value: 'Dezembro de 2022 (30% de desconto)',
        groupValue: formSponsorModel.closureDate,
        onChanged: (value) => setState(() {
          formSponsorModel = formSponsorModel.copyWith(closureDate: value);
        }),
      ),
      RadioListTile<String>(
        title: const Text('Janeiro de 2023 (10% de desconto)'),
        value: 'Janeiro de 2023 (10% de desconto)',
        groupValue: formSponsorModel.closureDate,
        onChanged: (value) => setState(() {
          formSponsorModel = formSponsorModel.copyWith(closureDate: value);
        }),
      ),
      RadioListTile<String>(
        title: const Text('Fevereiro de 2023 (Valor integral)'),
        value: 'Fevereiro de 2023 (Valor integral)',
        groupValue: formSponsorModel.closureDate,
        onChanged: (value) => setState(() {
          formSponsorModel = formSponsorModel.copyWith(closureDate: value);
        }),
      ),
    ];
    return Container(
      constraints: BoxConstraints(maxHeight: 600, maxWidth: 350),
      child: AlertDialog(
        content: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  'Cadastro do Patrocinador',
                  style: TextStyle(
                      fontSize:
                          MediaQuery.of(context).size.width < 530 ? 28 : 35,
                      fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormCustom(
                  label: 'Nome da Empresa',
                  onSaved: (value) => formSponsorModel =
                      formSponsorModel.copyWith(companyName: value),
                  validator: fieldIsEmpty,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormCustom(
                        label: 'Nome do Colaborador(a)',
                        onSaved: (value) => formSponsorModel =
                            formSponsorModel.copyWith(colabName: value),
                        validator: fieldIsEmpty,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormCustom(
                        label: 'Email para Contato',
                        onSaved: (value) => formSponsorModel =
                            formSponsorModel.copyWith(email: value),
                        validator: (text) {
                          var res = fieldIsEmpty(text);
                          if (res != null) {
                            return res;
                          }
                          if (!isEmail(text!)) {
                            return 'Email precisa ser valido';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormCustom(
                          label: 'Telefone',
                          onSaved: (value) => formSponsorModel =
                              formSponsorModel.copyWith(number: value),
                          validator: fieldIsEmpty,
                          inputFormatters: [maskFormatterPhone]),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormCustom(
                        label: 'CNPJ da Empresa',
                        onSaved: (value) => formSponsorModel =
                            formSponsorModel.copyWith(cnpj: value),
                        inputFormatters: [maskFormatterCPNJ],
                        validator: (text) {
                          var res = fieldIsEmpty(text);

                          if (res != null) {
                            return res;
                          }
                          if (!isLength(text!, 18)) {
                            return 'CNPJ precisa ser valido';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text('Escolha a cota de patrocínio'),
                const SizedBox(
                  height: 16,
                ),
                MediaQuery.of(context).size.width < 530
                    ? ListView.builder(
                        itemBuilder: (context, index) =>
                            optionsSponsorType[index],
                        shrinkWrap: true,
                      )
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(child: optionsSponsorType[0]),
                              Expanded(child: optionsSponsorType[2])
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(child: optionsSponsorType[1]),
                              Expanded(child: optionsSponsorType[3])
                            ],
                          )
                        ],
                      ),
                const SizedBox(
                  height: 16,
                ),
                const Text('Deseja Realizar o fechamento do patrocínio em'),
                const SizedBox(
                  height: 16,
                ),
                MediaQuery.of(context).size.width < 530
                    ? ListView.builder(
                        itemBuilder: (context, index) =>
                            optionsClosureDate[index],
                        shrinkWrap: true,
                      )
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(child: optionsClosureDate[0]),
                              Expanded(child: optionsClosureDate[3])
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(child: optionsClosureDate[1]),
                              Expanded(child: optionsClosureDate[4])
                            ],
                          ),
                          optionsClosureDate[2]
                        ],
                      ),
              ],
            )),
        backgroundColor: Colors.white,
        actionsAlignment: MainAxisAlignment.spaceAround,
        actions: [
          OutlinedButton(
              onPressed: () => Modular.to.pop(), child: const Text('CANCELAR')),
          Builder(builder: (context) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD36D49)),
              onPressed: sendForm,
              child: _loading
                  ? const CircularProgressIndicator()
                  : const Text(
                      'ENVIAR FORMULÁRIO',
                      style: TextStyle(color: Colors.white),
                    ),
            );
          })
        ],
      ),
    );
  }
}

class TextFormCustom extends StatelessWidget {
  const TextFormCustom({
    Key? key,
    required this.label,
    required this.onSaved,
    this.validator,
    this.inputFormatters,
  }) : super(key: key);
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final String label;
  final void Function(String?) onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: validator,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(fontSize: 14),
          border: const OutlineInputBorder()),
    );
  }
}
