{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    historySubstringSearch.enable = true;
    syntaxHighlighting.enable = true;

    defaultKeymap = "viins";

    shellAliases = { };

    initExtra = ''
      export SSL_CERT_FILE=$(nix config show ssl-cert-file)
      export NODE_EXTRA_CA_CERTS=$SSL_CERT_FILE
      export CARGO_HTTP_CAINFO=$SSL_CERT_FILE
      export CURL_CA_BUNDLE=$SSL_CERT_FILE
      export REQUESTS_CA_BUNDLE=$SSL_CERT_FILE
      export AWS_CA_BUNDLE=$SSL_CERT_FILE
    '';
  };
}
