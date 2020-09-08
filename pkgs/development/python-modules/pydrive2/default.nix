{ lib, python3 }:

python3.pkgs.buildPythonPackage rec {
  pname = "pydrive2";
  version = "1.6.0";

  src = python3.pkgs.fetchPypi {
    pname = "PyDrive2";
    inherit version;
    sha256 = "0000000000000000000000000000000000000000000000000000";
  };

  propagatedBuildInputs = with python3.pkgs; [
    google_api_python_client
    oauth2client
    pyyaml
    pyopenssl
  ];

  meta = {
    description = "Google Drive API Python wrapper library";
    homepage = "https://github.com/iterative/PyDrive2";
    license = lib.licenses.asl20;
  };
}
