$env.config.buffer_editor = "micro"
$env.config.show_banner = false

# starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

$env.PATH = $env.PATH | append "~/.local/bin"
$env.PATH = $env.PATH | append "~/.cargo/bin"
$env.PATH = $env.PATH | append "~/.deno/bin"
