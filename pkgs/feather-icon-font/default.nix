{ lib
, stdenv
, fetchgit
}:
stdenv.mkDerivation {
  pname = "feather-icon-font";
  version = "1.0.0";

  src = fetchgit {
    url = "https://github.com/adi1090x/widgets.git";
    sparseCheckout = [ "fonts/feather.ttf" ]; # fetch only the font
    rev = "c16e32c8786d67d91d6c11b50c2e183d26054186";
    hash = "sha256-KHoUQW+C8xfLbpY9aWI8toHLeqUHtkPXtP4XdMNixWo=";
  };

  installPhase = ''
    runHook preInstall
    install -Dm644 fonts/feather.ttf -t $out/share/fonts/truetype/
    runHook postInstall
  '';
  meta = with lib; {
    homepage = "https://github.com/feathericons/feather";
    description = "feather font";
    longDescription = ''
      Feather is a collection of simply beautiful open source icons.
    '';
    license = licenses.mit;
    maintainers = [ maintainers.jan-kasi ];
    platforms = platforms.all;
  };
}
