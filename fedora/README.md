# Linux

# Create ISO file
```shell
sudo image-builder build image-installer --blueprint blueprint.toml
```

# Run script
```shell
bash install.sh
```  

> [!IMPORTANT]  
> Don't execute bash with sudo, the script will use sudo when needed.  
> This means that it may ask for password in some cases.
