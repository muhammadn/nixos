{config, ...}:
{
  users.extraUsers.zaihan = 
    { isNormalUser = true;
      home = "/home/zaihan";
      description = "Muhammad Nuzaihan";
      extraGroups = ["wheel"];
      openssh.authorizedKeys.keys = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC/4Sdw9+5e6uzxoo34cBxra2WN9X5HOboZXVKXL33TFnEVwkmtNPSz1AZfvbrx4TNkt4MWYcDYxCBaI2SR5PSFK1nTaEXI+erGhgksOB9AYo00dPOd+6eNhER1Go1eV7zIbUO1hPQeaFn/jbh58NOFz+rmPG66IVHp8+PrbAXTgTCMSBli5FfcS7JXvLUrKCjWU81k0RDEQeRHHtSuiHHR6t5v0DL68jLYG8qlMh2QXoiiiEzHFKxsY9cbGe2mRx/96DKTMaE19NS2g8zxFQ0858x7k630PsCwjkt5Lh3pmeYyKkCdPxMUk6aM5h9PoVCOqcpef3wdbI82TZFBifQr zaihan@Muhammads-MacBook-Pro.local"];
    };
}
