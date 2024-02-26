# VSCode Extensions

## Build
- **Meson**
  - Automate building using meson

## C
- **clangd**
  - Because **C/C++** was complaining of:
    - ```C
      #include <netdb.h>
      
      int main(int argc, char *argv[]) {
          struct addrinfo hints; // incomplete type is not allowed C/C++(70)
      }
      ```
- **Clang-format**
  - Because **clangd**  doesn't format on save
    - It was only formating the line above after an enter :^)
  - Because Godot recommended
