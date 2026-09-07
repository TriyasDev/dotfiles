{ config, ...}:
{
  programs.git = {
    enable = true;
    settings.user.name = "TiyasDev";
    settings.user.email = "iyastriyas2@gmail.com";
  };
}