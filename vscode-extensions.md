# VSCode Extensions
The less I have to change the default settings from an extension the better (I already have too much settings in my life to think about).

## C
- **clangd**
  - *Because*:
    - **C/C++** extension from Microsoft was complaining of:
      - ```C
        #include <netdb.h>
        
        int main(int argc, char *argv[]) {
            struct addrinfo hints; // incomplete type is not allowed C/C++(70)
        }
        ```
  - *Bad*:
    - Needs to define include directories in settings:
      - ```json
        {
          "clangd.fallbackFlags": [
              "-I${workspaceFolder}/src", // Project headers
              "-I${workspaceFolder}/include", // External headers
              "-I${workspaceFolder}/godot-cpp/include", // GDExtension headers
              "-I${workspaceFolder}/godot-cpp/gdextension", // GDExtension interface header
              "-I${workspaceFolder}/godot-cpp/gen/include", // Generated headers
          ]
        }
        ```
      - **C/C++** search all directories for headers, you may install it to discover the headers. Or gain some idea running:
        - ```python
          from pathlib import Path
  
          suffixes = [".h", ".hpp"]

          # No space between lines so you can run with interactive Python
          def get_headers_dir(path: str) -> list[str]:
              for p in Path(path).iterdir():
                  if p.is_file() and p.suffix in suffixes:
                      return [path]
              subpaths: list[str] = []
              for p in Path(path).iterdir():
                  if p.is_dir():
                      subpaths.extend(get_headers_dir(p))
              return subpaths
          
          for d in get_headers_dir('.'):
              print(d)
          ```
- **Clang-format**
  - *Because*:
    - Godot recommended
    - **clangd** doesn't format on save
      - Only format the line above after an enter :^)

## Docker
- **Docker**
  - *Because*:
    - Microsoft support

## Go
- **God**
  - *Because*:
    - Google support

## Python
- **Ruff**
  - *Bring*:
    - **Pylance**
    - **Python**
    - **Python Debugger**

## Rust
- **rust-analyzer**
  - *Because*:
    - Rust recommended

## SSH
- **Remote - SSH**
  - *Because*:
    - Microsoft support
  - *Bring*:
    - **Remote - SSH: Editing Configuration Files**
    - **Remote Explorer**
