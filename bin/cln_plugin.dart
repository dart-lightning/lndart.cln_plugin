import 'package:cln_plugin_api/cln_plugin.dart';
import 'package:cln_plugin/cln_plugin.dart' as cln_plugin;

void main() {
  /// Here we create an instance of the base plugin class of our API.
  /// This is the backbone of our plugin. All interactions with and by the plugin
  /// will be done using the object.
  var plugin = Plugin(
      dynamic: true,
      onInit: (plugin) {
        return Future.value({});
      });

  /// The important step is to register methods pertaining to our plugin for differed use cases.
  /// The following template demonstrates a way of interacting with the plugin object.
  plugin.registerRPCMethod(
      name: "hello",
      usage: "",
      description:
          "This method will greet you and serves as an example of how to register a RPC method.",
      callback: cln_plugin.rpcMethod);
  plugin.registerOption(
      name: "name",
      type: "string",
      def: "World",
      description: "This is your name and it will be used to greet you.",
      deprecated: false);
  plugin.registerHook(name: 'rpc_command', callback: cln_plugin.hookMethod);
  plugin.registerSubscriptions(
      event: 'connect', callback: cln_plugin.notifyMethod);
  plugin.start();
}
