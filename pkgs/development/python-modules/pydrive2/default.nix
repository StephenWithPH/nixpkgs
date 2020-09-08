{ lib
, buildPythonPackage
, fetchPypi
, isPy3k
, google_api_python_client
, oauth2client
, pyyaml
, pyopenssl
}:

buildPythonPackage rec {
  pname = "pydrive2";
  version = "1.6.0";
  disabled = ! isPy3k; # transitively via google_api_python_client, google_api_core no longer supports Python 2

  src = fetchPypi {
    pname = "PyDrive2";
    inherit version;
    sha256 = "0000000000000000000000000000000000000000000000000000";
  };

  propagatedBuildInputs = [
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
