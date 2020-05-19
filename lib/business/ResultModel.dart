class ResultModel {
  int result;
  String message;
  String data;
  String code;

  ResultModel(this.result, this.message, this.data, this.code);

  ResultModel.FromJson(Map<String, dynamic> json) :
        this(json['Result'], json['Message'], json['Data'], json['Code']);

}