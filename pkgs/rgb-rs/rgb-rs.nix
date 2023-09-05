{ lib
, rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage {
  pname = "rgb-rs";
  version = "unstable-2022-09-17";

  src = fetchFromGitHub {
    owner = "flick0";
    repo = "rgb-rs";
    rev = "12442aeb5183ba66ec3ab7b9317c4d5a1a1ef976";
    hash = "sha256-9aiDjo3NXyWpdu+w63RN+bf0FBfo07ZiLfR4Y3caBNI=";
  };

  cargoHash = "sha256-mk6Xx5mk7eE9yYAC2zF2EsCdsej5GyWeXfEFzGyF77M=";

  meta = with lib; {
    description = "";
    homepage = "https://github.com/flick0/rgb-rs/tree/master";
    license = with licenses; [ unspecified ];
    maintainers = with maintainers; [ jan-kasi ];
  };
}
