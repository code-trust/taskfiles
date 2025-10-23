{
  description = "Codetrust shared Taskfiles";
  outputs = { self, ... }: {
    path = builtins.path {
      path = ./taskfiles;
    };
  };
}
