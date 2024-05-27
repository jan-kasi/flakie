{ lib, appimageTools, runCommand, curl, gnugrep, cacert }:

appimageTools.wrapType2 rec {
  pname = "pureref2";
  version = "2.0.0";

  src = runCommand "PureRef-${version}_x64.Appimage" {
    nativeBuildInputs = [ curl gnugrep cacert ];
    outputHash = "sha256-EnOZ2ctsZaaVTHgt67gcy+SEgihrzoumnlbAhl+Ob1M=";
  } ''
    key="$(curl "https://www.pureref.com/download.php" --silent | grep '%3D%3D' | cut -d '"' -f2)"
    curl "https://www.pureref.com/files/build.php?build=LINUX64.Appimage&version=${version}&downloadKey=$key" --output $out
  '';

  installPhase = ''
    mkdir -p $out/share/applications
    cat > $out/share/applications/pureref2.desktop <<EOF
    [Desktop Entry]
    Type=Application
    Version=2.0.0
    Name=Pureref
    GenericName=Moodboard
    Exec=pureref2 %U
    TryExec=pureref2
    Terminal=false
    Comment=Image Reference Viewer
    Categories=Graphics;Office
    StartupWMClass=Pureref
    EOF
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
