{
  services.colima = {
    enable = true;

    profiles = {
      docker = {
        name = "docker";
        setDockerHost = true;
        isActive = true;
        isService = true;

        settings = {
          runtime = "docker";
          autoActivate = true;
        };
      };
    };
  };
}
