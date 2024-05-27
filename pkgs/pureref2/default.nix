{ lib, appimageTools, runCommand, curl, gnugrep, cacert, copyDesktopItems, makeDesktopItem }:

appimageTools.wrapType2 rec {
  pname = "pureref2";
  version = "2.0.0";

  src = runCommand "PureRef-${version}_x64.Appimage" {
    nativeBuildInputs = [ curl gnugrep cacert copyDesktopItems];
    outputHash = "sha256-EnOZ2ctsZaaVTHgt67gcy+SEgihrzoumnlbAhl+Ob1M=";
  } ''
    key="$(curl "https://www.pureref.com/download.php" --silent | grep '%3D%3D' | cut -d '"' -f2)"
    curl "https://www.pureref.com/files/build.php?build=LINUX64.Appimage&version=${version}&downloadKey=$key" --output $out
  '';

  desktopItems = [
    (makeDesktopItem {
      name = "pureref";
      exec = "pureref2 %U";
      icon = "pureref";
      desktopName = "Pureref";
      comment = "Image Reference Viewer";
      categories = ["Graphics"];
      startupWMClass = "pureref";
    })];

  meta = with lib; {
    description = "Reference Image Viewer";
    homepage = "https://www.pureref.com";
    license = licenses.unfree;
    maintainers = with maintainers; [ jan-kasi ];
    platforms = [ "x86_64-linux" ];
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
  };
}
