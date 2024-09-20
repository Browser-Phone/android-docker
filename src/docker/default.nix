{
  callPackage,
  dockerTools,
  scrcpy-server,
  android-composition,
  emulator-args,
  scripts,
  scrcpy-video-port ? "6000",
  scrcpy-audio-port ? "6001",
  scrcpy-data-port ? "6002",
  adb-port ? "5000",
}:
dockerTools.buildImage {
  name = "AndroidRunner";
  tag = "latest";
  fromImage = callPackage ./streaming.nix {
    inherit
      scripts
      scrcpy-video-port
      scrcpy-audio-port
      scrcpy-data-port
      adb-port
      emulator-args
      scrcpy-server
      android-composition
      ;
  };
  config = {
    Cmd = ["run-android-emulator && run-android-streamer"];
  };
}
