import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

class InputBox extends StatefulWidget {
  final IconData icon;
  final String placeholder;
  final double? widthSize;
  final bool? disable;
  final bool? isPassword;
  final String? Function(String value)? validation;
  final Function(String value) setValue;
  final void Function(String?)? onFieldSubmitted;
  final void Function(bool)? onToggleVisibilityPwd;
  final bool? showPwd;
  final bool? isCpfField;
  final bool? isRAField;
  final bool? isPhoneField;
  final bool? isValidated;

  const InputBox({
    Key? key,
    required this.icon,
    required this.placeholder,
    this.widthSize,
    this.disable,
    this.isPassword,
    this.validation,
    required this.setValue,
    this.onFieldSubmitted,
    this.onToggleVisibilityPwd,
    this.showPwd,
    this.isCpfField,
    this.isRAField,
    this.isPhoneField,
    this.isValidated,
  }) : super(key: key);

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  final countryPicker = const FlCountryCodePicker();
  CountryCode? countryCode;
  @override
  Widget build(BuildContext context) {
    final maskCpf = MaskTextInputFormatter(
        mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});
    final maskRA = MaskTextInputFormatter(
        mask: "##.#####-#", filter: {"#": RegExp(r'[0-9]')});
    final maskPhone = MaskTextInputFormatter(
        mask: countryCode?.dialCode == "+1"
            ? "###-###-####"
            : countryCode?.dialCode == "+501" || countryCode?.dialCode == "+507"
                ? "###-####"
                : countryCode?.dialCode == "+506" ||
                        countryCode?.dialCode == "+503" ||
                        countryCode?.dialCode == "+502" ||
                        countryCode?.dialCode == "+505" ||
                        countryCode?.dialCode == "+356" ||
                        countryCode?.dialCode == "+165" ||
                        countryCode?.dialCode == "+973"
                    ? "#### ####"
                    : countryCode?.dialCode == "+504"
                        ? "#### ####"
                        : countryCode?.dialCode == "+53"
                            ? "## ######"
                            : countryCode?.dialCode == "+508" ||
                                    countryCode?.dialCode == "+299"
                                ? "## ## ##"
                                : countryCode?.dialCode == "+599"
                                    ? "# ### ####"
                                    : countryCode?.dialCode == "+596" ||
                                            countryCode?.dialCode == "+590"
                                        ? "### ## ## ##"
                                        : countryCode?.dialCode == "+297" ||
                                                countryCode?.dialCode == "+592"
                                            ? "### ####"
                                            : countryCode?.dialCode == "+509"
                                                ? "#########"
                                                : countryCode?.dialCode == "+54"
                                                    ? "#### ##-##-####"
                                                    : countryCode?.dialCode ==
                                                                "+57" ||
                                                            countryCode
                                                                    ?.dialCode ==
                                                                "+62" ||
                                                            countryCode?.dialCode == "+64"
                                                        ? "## #######"
                                                        : countryCode?.dialCode == "+598" || countryCode?.dialCode == "+371" || countryCode?.dialCode == "+423" || countryCode?.dialCode == "+386"
                                                            ? "## ### ###"
                                                            : countryCode?.dialCode == "+591"
                                                                ? "# #######"
                                                                : countryCode?.dialCode == "+593" || countryCode?.dialCode == "+355" || countryCode?.dialCode == "+36" || countryCode?.dialCode == "+385" || countryCode?.dialCode == "+93" || countryCode?.dialCode == "+61" || countryCode?.dialCode == "+351"
                                                                    ? "## ### ####"
                                                                    : countryCode?.dialCode == "+595"
                                                                        ? "### ######"
                                                                        : countryCode?.dialCode == "+58"
                                                                            ? "###-#######"
                                                                            : countryCode?.dialCode == "+55"
                                                                                ? "(##) #####-####"
                                                                                : countryCode?.dialCode == "+500"
                                                                                    ? "#####"
                                                                                    : countryCode?.dialCode == "+51" || countryCode?.dialCode == "+421" || countryCode?.dialCode == "+34" || countryCode?.dialCode == "+41" || countryCode?.dialCode == "+420" || countryCode?.dialCode == "+380" || countryCode?.dialCode == "+48" || countryCode?.dialCode == "+244" || countryCode?.dialCode == "+27"
                                                                                        ? "### ### ###"
                                                                                        : countryCode?.dialCode == "+56"
                                                                                            ? "##### ####"
                                                                                            : countryCode?.dialCode == "+594" || countryCode?.dialCode == "+33"
                                                                                                ? "### ## ## ##"
                                                                                                : countryCode?.dialCode == "+597"
                                                                                                    ? "###-####"
                                                                                                    : countryCode?.dialCode == "+358" || countryCode?.dialCode == "+298"
                                                                                                        ? "######"
                                                                                                        : countryCode?.dialCode == "+40"
                                                                                                            ? "## ## ####"
                                                                                                            : countryCode?.dialCode == "+7"
                                                                                                                ? "# ### ## ####"
                                                                                                                : countryCode?.dialCode == "+376"
                                                                                                                    ? "### ###"
                                                                                                                    : countryCode?.dialCode == "+370" || countryCode?.dialCode == "+359"
                                                                                                                        ? "# ### ####"
                                                                                                                        : countryCode?.dialCode == "+378" || countryCode?.dialCode == "+45"
                                                                                                                            ? "## ## ## ##"
                                                                                                                            : countryCode?.dialCode == "+43"
                                                                                                                                ? "# ######"
                                                                                                                                : countryCode?.dialCode == "+49"
                                                                                                                                    ? "## #########"
                                                                                                                                    : countryCode?.dialCode == "+352" || countryCode?.dialCode == "+387"
                                                                                                                                        ? "## ## ## ###"
                                                                                                                                        : countryCode?.dialCode == "+381" || countryCode?.dialCode == "+373" || countryCode?.dialCode == "+350" || countryCode?.dialCode == "+852"
                                                                                                                                            ? "### #####"
                                                                                                                                            : countryCode?.dialCode == "+82"
                                                                                                                                                ? "##-###-####"
                                                                                                                                                : countryCode?.dialCode == "+389"
                                                                                                                                                    ? "# ### ####"
                                                                                                                                                    : countryCode?.dialCode == "+32"
                                                                                                                                                        ? "### ## ## ##"
                                                                                                                                                        : countryCode?.dialCode == "+30"
                                                                                                                                                            ? "## #### ####"
                                                                                                                                                            : countryCode?.dialCode == "+44"
                                                                                                                                                                ? "##########"
                                                                                                                                                                : countryCode?.dialCode == "+86"
                                                                                                                                                                    ? "### ########"
                                                                                                                                                                    : countryCode?.dialCode == "+377"
                                                                                                                                                                        ? "### ### ##"
                                                                                                                                                                        : countryCode?.dialCode == "+47" || countryCode?.dialCode == "+44"
                                                                                                                                                                            ? "########"
                                                                                                                                                                            : countryCode?.dialCode == "+354"
                                                                                                                                                                                ? "## ####"
                                                                                                                                                                                : countryCode?.dialCode == "+382"
                                                                                                                                                                                    ? "## ### ###"
                                                                                                                                                                                    : countryCode?.dialCode == "+46"
                                                                                                                                                                                        ? "###-### ###"
                                                                                                                                                                                        : countryCode?.dialCode == "+353"
                                                                                                                                                                                            ? "# #### ####"
                                                                                                                                                                                            : countryCode?.dialCode == "+31"
                                                                                                                                                                                                ? "### ######"
                                                                                                                                                                                                : countryCode?.dialCode == "+39"
                                                                                                                                                                                                    ? "#### ######"
                                                                                                                                                                                                    : countryCode?.dialCode == "+44"
                                                                                                                                                                                                        ? "##### #####"
                                                                                                                                                                                                        : countryCode?.dialCode == "+372"
                                                                                                                                                                                                            ? "### ####"
                                                                                                                                                                                                            : countryCode?.dialCode == "+39"
                                                                                                                                                                                                                ? "##########"
                                                                                                                                                                                                                : countryCode?.dialCode == "+374"
                                                                                                                                                                                                                    ? "### ## ###"
                                                                                                                                                                                                                    : countryCode?.dialCode == "+91" || countryCode?.dialCode == "+98" || countryCode?.dialCode == "+90"
                                                                                                                                                                                                                        ? "### ### ####"
                                                                                                                                                                                                                        : countryCode?.dialCode == "+961"
                                                                                                                                                                                                                            ? "## ### ###"
                                                                                                                                                                                                                            : countryCode?.dialCode == "+994"
                                                                                                                                                                                                                                ? "### ## ## ##"
                                                                                                                                                                                                                                : countryCode?.dialCode == "+972"
                                                                                                                                                                                                                                    ? "###-###-####"
                                                                                                                                                                                                                                    : countryCode?.dialCode == "+81"
                                                                                                                                                                                                                                        ? "~#~#~#~#######"
                                                                                                                                                                                                                                        : "############",
        filter: {"#": RegExp(r'[0-9]')});
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      width: widget.widthSize ??
          (MediaQuery.of(context).size.width < 650
              ? MediaQuery.of(context).size.width * 0.85
              : 600),
      height: 60,
      child: Container(
        decoration: BoxDecoration(
            color: widget.disable != null
                ? widget.disable!
                    ? const Color(0xFF5C5C5C).withOpacity(0.2)
                    : AppColors.gray
                : AppColors.gray,
            borderRadius: BorderRadius.circular(10),
            border: widget.isValidated != null
                ? !widget.isValidated!
                    ? Border.all(color: Colors.red)
                    : null
                : null),
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width < 650 ? 5 : 10, left: 10),
          child: TextFormField(
            validator: (value) {
              if (widget.validation != null) {
                return widget.validation!(value!);
              }
              return null;
            },
            onFieldSubmitted: widget.onFieldSubmitted,
            onChanged: widget.setValue,
            obscureText: widget.showPwd != null ? !widget.showPwd! : false,
            enabled: widget.disable != null ? !widget.disable! : true,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 15),
                border: InputBorder.none,
                hintText: widget.placeholder,
                fillColor: Colors.white,
                isDense: true,
                hintStyle: TextStyle(color: AppColors.placeholder),
                errorStyle: TextStyle(
                  color: AppColors.brandingOrange,
                  fontSize: 16,
                  height: 0.08,
                ),
                prefix: widget.isPhoneField == true
                    ? GestureDetector(
                        onTap: () async {
                          final code = await countryPicker.showPicker(
                            context: context,
                          );
                          setState(() {
                            countryCode = code!;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black45,
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                countryCode?.dialCode ?? "DDI",
                                style: TextStyle(
                                    color: AppColors.white, fontSize: 16.0),
                              ),
                            ),
                          ),
                        ))
                    : null,
                prefixIcon: Icon(widget.icon, size: 24),
                suffixIcon: widget.onToggleVisibilityPwd != null
                    ? Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: InkWell(
                          onTap: () =>
                              widget.onToggleVisibilityPwd!(widget.showPwd!),
                          child: Icon(
                            widget.showPwd!
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.brandingPurple,
                            size: 20,
                          ),
                        ),
                      )
                    : null),
            style: const TextStyle(color: Colors.white),
            inputFormatters: widget.isCpfField != null
                ? [maskCpf]
                : widget.isRAField != null
                    ? [maskRA]
                    : widget.isPhoneField != null
                        ? [maskPhone]
                        : null,
          ),
        ),
      ),
    );
  }
}
