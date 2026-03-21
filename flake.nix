{
  description = "Cookbook Projects Environment (Typst, Python)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      # Поддерживаемые архитектуры и ОС (Linux и macOS на Intel и Apple Silicon)
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];

      # Вспомогательная функция для генерации конфигурации под каждую ОС
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in
    {
      devShells = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              python3
              typst
            ];

            shellHook = ''
              echo "🛠️ Cookbook Environment Loaded (Typst, Python) [${system}]"
            '';
          };
        }
      );
    };
}
