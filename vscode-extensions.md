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
      - **C/C++** search all directories for headers, you may install it to discover the headers
- **Clang-format**
  - *Because*:
    - Godot recommended
    - **clangd** doesn't format on save
      - Only format the line above after an enter :^)

## Python
- **Ruff**
  - *Bring*:
    - **Pylance**
    - **Python**
    - **Python Debugger**
