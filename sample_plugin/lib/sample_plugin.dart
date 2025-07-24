
import 'sample_plugin_platform_interface.dart';

class SamplePlugin {
  Future<String?> getPlatformVersion() {
    return SamplePluginPlatform.instance.getPlatformVersion();
  }
}
