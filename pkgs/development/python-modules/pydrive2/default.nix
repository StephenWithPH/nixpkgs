{ lib, python3 }:

python3.pkgs.buildPythonPackage rec {
  pname = "pydrive2";
  version = "1.6.0";

  src = python3.pkgs.fetchPypi {
    pname = "PyDrive2";
    inherit version;
    sha256 = "0b803dq6g13zypqplwi4bzdjmsdrxmvfiba9121wma51j83350kp";
  };

  checkInputs = with python3.pkgs; [
    funcy
    pytest
  ];

  checkPhase = ''
    pytest -m 'not manual'
  '';

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
