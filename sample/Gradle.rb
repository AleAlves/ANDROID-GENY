class Gradle
    def initialize
        puts "Gradle Build Template"
      end
    def build_gralde_template
        return "plugins {
    id 'com.android.library'
    id 'kotlin-android'
}

android {
    compileSdkVersion 30
    buildToolsVersion \"30.0.3\"

    defaultConfig {
        minSdkVersion 19
        targetSdkVersion 30
        versionCode 1
        versionName \"1.0\"

        testInstrumentationRunner \"androidx.test.runner.AndroidJUnitRunner\"
        consumerProguardFiles \"consumer-rules.pro\"
    }

    buildTypes {
        release {
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
        }
    }
    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }
    kotlinOptions {
        jvmTarget = '1.8'
    }
}

dependencies {

    implementation \"org.jetbrains.kotlin:kotlin-stdlib:$kotlin_version\"
    implementation 'androidx.core:core-ktx:1.2.0'
    implementation 'androidx.appcompat:appcompat:1.1.0'
    implementation 'com.google.android.material:material:1.1.0'
    testImplementation 'junit:junit:4.+'
    androidTestImplementation 'androidx.test.ext:junit:1.1.1'
    androidTestImplementation 'androidx.test.espresso:espresso-core:3.2.0'
}
"
      end
end