{ lib, den, ... }: {
  # global config for all hosts
  den.default.includes = [
    den.aspects.essential
  ];

  den.schema.host = {
    hjem.enable = true;
  };
}
