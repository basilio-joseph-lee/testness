plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.devops.testness" // Modern Gradle requires namespace
    compileSdk = flutter.compileSdkVersion

    defaultConfig {
        applicationId = "com.devops.testness"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion

        // Safely get build number from Codemagic or default to 1 for local builds
        val buildNumber = System.getenv("PROJECT_BUILD_NUMBER")?.toIntOrNull() ?: 1
        versionCode = buildNumber
        versionName = "1.0.$buildNumber"
    }

    signingConfigs {
        create("release") {
            // These variables are automatically provided by Codemagic 
            // if you have uploaded your keystore in the UI
            val keystorePath = System.getenv("CM_KEYSTORE_PATH")
            if (keystorePath != null) {
                storeFile = file(keystorePath)
                storePassword = System.getenv("CM_KEYSTORE_PASSWORD")
                keyAlias = System.getenv("CM_KEY_ALIAS")
                keyPassword = System.getenv("CM_KEY_PASSWORD")
            }
        }
    }

    buildTypes {
        release {
            // Apply the release signing config defined above
            signingConfig = signingConfigs.getByName("release")
            
            // Optional: commonly used for production
            isMinifyEnabled = false
            isShrinkResources = false
        }
    }
}

flutter {
    source = "../.."
}