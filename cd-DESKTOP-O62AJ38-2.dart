void main(List<String> args) {

  String path = args.length > 0 ? args[0] : "";
  String option1 = args.length > 1 ? args[1] : "";

  if (path == "") {
    return;
  }

  if (option1 == "--hard") {
    print("$path로 열심히 이동했다.");
  } else {
    print("$path로 이동했다.");
  }
}
