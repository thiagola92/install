# VSCode Extensions
The less I have to change the default settings from an extension the better (I already have too much settings in my life to think about).

## C
- **clangd**
  - Because **C/C++** extension from Microsoft was complaining of:
    - ```C
      #include <netdb.h>
      
      int main(int argc, char *argv[]) {
          struct addrinfo hints; // incomplete type is not allowed C/C++(70)
      }
      ```
- **Clang-format**
  - Because **clangd** doesn't format on save
    - It was only formating the line above after an enter :^)
  - Because Godot recommended

## Python
- **Ruff**
  - It will bring together:
    - **Pylance**
    - **Python**
    - **Python Debugger**
