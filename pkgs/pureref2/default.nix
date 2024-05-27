{ lib, appimageTools, runCommand, curl, gnugrep, cacert }:

appimageTools.wrapType1 rec {
  pname = "pureref2";
  version = "2.0.0";

  src = runCommand "PureRef-${version}_x64.Appimage" {
    nativeBuildInputs = [ curl gnugrep cacert ];
    outputHash = lib.fakeHash;
  } ''
    key="$(curl "https://www.pureref.com/download.php" --silent | grep '%3D%3D' | cut -d '"' -f2)"
    curl "https://www.pureref.com/files/build.php?build=LINUX64.Appimage&version=${version}&downloadKey=$key" --output $out
  '';

  meta = with lib; {
    description = "Reference Image Viewer";
    homepage = "https://www.pureref.com";
    license = licenses.unfree;
    maintainers = with maintainers; [ jan-kasi ];
    platforms = [ "x86_64-linux" ];
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
  };
}
