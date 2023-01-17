import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/domain/model/sponsor_email_model.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:string_validator/string_validator.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../../shared/services/environment/environment_config.dart';

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
  String? erroMsg;
  Future<void> sendForm() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var dio = Dio(BaseOptions(
        baseUrl: EnvironmentConfig.SPONSOR_FORM_REQUEST_URL,
        responseType: ResponseType.json,
        connectTimeout: 30000,
        receiveTimeout: 30000,
      ));

      setLoading();
      try {
        var res = await dio.post('', data: formSponsorModel.toJson());
        setLoading();
        if (res.statusCode == 200) {
          Modular.to.pop(true);
        } else {
          erroMsg =
              'Erro ao enviar formulario! Entre em contato com dev@maua.br';
          setState(() {});
        }
      } catch (e) {
        setLoading();
        erroMsg = 'Erro ao enviar formulario! Entre em contato com dev@maua.br';
        setState(() {});
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
        title: const Text('Janeiro de 2023 (20% de desconto)'),
        value: 'Janeiro de 2023 (20% de desconto)',
        groupValue: formSponsorModel.closureDate,
        onChanged: (value) => setState(() {
          formSponsorModel = formSponsorModel.copyWith(closureDate: value);
        }),
      ),
      RadioListTile<String>(
        title: const Text('Fevereiro de 2023 (10% de desconto)'),
        value: 'Fevereiro de 2023 (10% de desconto)',
        groupValue: formSponsorModel.closureDate,
        onChanged: (value) => setState(() {
          formSponsorModel = formSponsorModel.copyWith(closureDate: value);
        }),
      ),
    ];
    return AlertDialog(
      content: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Cadastro do Patrocinador',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width < 530 ? 28 : 35,
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
              MediaQuery.of(context).size.width < 530
                  ? Column(
                      children: [
                        TextFormCustom(
                          label: 'Nome do Colaborador(a)',
                          onSaved: (value) => formSponsorModel =
                              formSponsorModel.copyWith(colabName: value),
                          validator: fieldIsEmpty,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormCustom(
                          label: 'Email para Contato',
                          onSaved: (value) => formSponsorModel =
                              formSponsorModel.copyWith(email: value?.trim()),
                          validator: (text) {
                            var res = fieldIsEmpty(text);
                            if (res != null) {
                              return res;
                            }
                            if (!isEmail(text!.trim())) {
                              return 'Email precisa ser válido';
                            }
                            return null;
                          },
                        )
                      ],
                    )
                  : Row(
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
                                formSponsorModel.copyWith(email: value?.trim()),
                            validator: (text) {
                              var res = fieldIsEmpty(text);
                              if (res != null) {
                                return res;
                              }
                              if (!isEmail(text!.trim())) {
                                return 'Email precisa ser válido';
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
              MediaQuery.of(context).size.width < 530
                  ? Column(
                      children: [
                        TextFormCustom(
                            label: 'Telefone',
                            onSaved: (value) => formSponsorModel =
                                formSponsorModel.copyWith(number: value),
                            validator: fieldIsEmpty,
                            inputFormatters: [maskFormatterPhone]),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormCustom(
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
                              return 'CNPJ precisa ser válido';
                            }
                            return null;
                          },
                        ),
                      ],
                    )
                  : Row(
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
                                return 'CNPJ precisa ser válido';
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
                  ? Column(
                      children: optionsSponsorType,
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
                  ? Column(
                      children: optionsClosureDate,
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [Expanded(child: optionsClosureDate[0])],
                        ),
                        Row(
                          children: [
                            Expanded(child: optionsClosureDate[1]),
                          ],
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        Builder(builder: (context) {
          if (erroMsg != null) {
            return Text(
              erroMsg!,
              style: const TextStyle(color: Colors.red, fontSize: 14),
            );
          }
          return Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD36D49)),
              onPressed: _loading ? null : sendForm,
              child: _loading
                  ? Container(
                      width: 24,
                      height: 24,
                      padding: const EdgeInsets.all(2.0),
                      child: CircularProgressIndicator(
                        color: AppColors.brandingBlue,
                        strokeWidth: 3,
                      ),
                    )
                  : const Text(
                      'ENVIAR FORMULÁRIO',
                      style: TextStyle(color: Colors.white),
                    ),
            ),
          );
        }),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Center(
            child: OutlinedButton(
                onPressed: () => Modular.to.pop(),
                child: const Text('CANCELAR')),
          ),
        ),
      ],
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
