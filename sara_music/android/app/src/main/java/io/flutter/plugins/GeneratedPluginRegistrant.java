package io.flutter.plugins;

import androidx.annotation.Keep;
import androidx.annotation.NonNull;
import io.flutter.Log;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.plugins.shim.ShimPluginRegistry;

/**
 * Generated file. Do not edit.
 * This file is generated by the Flutter tool based on the
 * plugins that support the Android platform.
 */
@Keep
public final class GeneratedPluginRegistrant {
  private static final String TAG = "GeneratedPluginRegistrant";
  public static void registerWith(@NonNull FlutterEngine flutterEngine) {
    ShimPluginRegistry shimPluginRegistry = new ShimPluginRegistry(flutterEngine);
    try {
      flutterEngine.getPlugins().add(new com.babacar.babstrap_settings_screen.BabstrapSettingsScreenPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin babstrap_settings_screen, com.babacar.babstrap_settings_screen.BabstrapSettingsScreenPlugin", e);
    }
    try {
      com.flutter.keyboardvisibility.KeyboardVisibilityPlugin.registerWith(shimPluginRegistry.registrarFor("com.flutter.keyboardvisibility.KeyboardVisibilityPlugin"));
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin flutter_keyboard_visibility, com.flutter.keyboardvisibility.KeyboardVisibilityPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new net.jonhanson.flutter_native_splash.FlutterNativeSplashPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin flutter_native_splash, net.jonhanson.flutter_native_splash.FlutterNativeSplashPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new io.flutter.plugins.flutter_plugin_android_lifecycle.FlutterAndroidLifecyclePlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin flutter_plugin_android_lifecycle, io.flutter.plugins.flutter_plugin_android_lifecycle.FlutterAndroidLifecyclePlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.it_nomads.fluttersecurestorage.FlutterSecureStoragePlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin flutter_secure_storage, com.it_nomads.fluttersecurestorage.FlutterSecureStoragePlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.example.imagegallerysaver.ImageGallerySaverPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin image_gallery_saver, com.example.imagegallerysaver.ImageGallerySaverPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new io.flutter.plugins.imagepicker.ImagePickerPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin image_picker, io.flutter.plugins.imagepicker.ImagePickerPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.codeheadlabs.libphonenumber.LibphonenumberPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin libphonenumber, com.codeheadlabs.libphonenumber.LibphonenumberPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.example.libphonenumber_plugin.LibphonenumberPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin libphonenumber_plugin, com.example.libphonenumber_plugin.LibphonenumberPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new io.flutter.plugins.pathprovider.PathProviderPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin path_provider_android, io.flutter.plugins.pathprovider.PathProviderPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.baseflow.permissionhandler.PermissionHandlerPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin permission_handler_android, com.baseflow.permissionhandler.PermissionHandlerPlugin", e);
    }
  }
}
