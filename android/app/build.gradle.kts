plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    defaultConfig {
        applicationId = "com.devops.testness"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion

        // Use PROJECT_BUILD_NUMBER which is an integer
        val buildNumber = System.getenv("PROJECT_BUILD_NUMBER")?.toIntOrNull() ?: 1
        versionCode = buildNumber
        versionName = "1.0.$buildNumber"
    }

    signingConfigs {
            create("release") {
                storeFile = file(System.getenv("CM_KEYSTORE_PATH")) 
                storePassword = System.getenv("CM_KEYSTORE_PASSWORD")
                keyAlias = System.getenv("CM_KEY_ALIAS")
                keyPassword = System.getenv("CM_KEY_PASSWORD")
            }
        }

        buildTypes {
            release {
                // TODO: Add your own signing config for the release build.
                // Signing with the debug keys for now, so `flutter run --release` works.
                signingConfig = signingConfigs.getByName("release")        
    }
    }

}

flutter {
    source = "../.."
}
