import 'package:cln_plugin_api/cln_plugin.dart';

Future<Map<String, Object>> rpcMethod(
    Plugin plugin, Map<String, Object> request) {
  plugin.log(level: "info", message: "RPC Method call.");
  return Future.value({
    "greeting": "Hello ${plugin.options["name"]!.value.toString()}!",
  });
}

Future<Map<String, Object>> notifyMethod(
    Plugin plugin, Map<String, Object> request) {
  plugin.log(level: 'debug', message: 'Notification received!');
  return Future.value({});
}

Future<Map<String, Object>> hookMethod(
    Plugin plugin, Map<String, Object> request) {
  plugin.log(level: "info", message: "Hook message.");
  return Future(() => {"result": "continue"});
}
