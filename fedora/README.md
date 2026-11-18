# Linux

```shell
bash install.sh
```  

> [!IMPORTANT]  
> Don't execute bash with sudo, the script will use sudo when needed.  
> This means that it may ask for password in some cases.  

## tips
It's good to understand the file `/etc/apt/sources.list`
which **apt** use to look for packages for you.
Each line follows the pattern:

```
[archive type] [repository url] [os name] [components1] [components2] [components3] ...
```

**archive type**: Type of package to search for in the server. Examples:
- "deb" for debians distributions
- "rpm" for fedora distributions
- "deb-src" when you want source files to compile for debian

**repository url**: URL to request packages. Examples:
- "http://us.archive.ubuntu.com/ubuntu/" for Ubuntu US repository
- "http://br.archive.ubuntu.com/ubuntu/" for Ubuntu BR repository

**os name**: Normally it's the first part of the code name. Examples:
- "noble" is for Ubuntu 24.04
- "jammy" is for Ubuntu 22.04
- "focal" is for Ubuntu 20.04

**component**: Any internal division from your repository. Examples for Ubuntu:
- "main" free softwares that can be freely redistributed and
  - Ubuntu gives support for it.
- "restricted" proprietary free softwares that
  - Ubuntu has limited support/access.
- "universe" open-source softwares community-maintained but
  - Ubuntu can later move it to "main" if it meets their standards.
- "multiverse" not free softwares which you should check license and
  - Ubuntu gives zero support to it.

If you are going to a new release, there is big chance that some packages be missing in the PPA. So you may want to add the URL from previous release:  

- "Software & Updates"
- "Other Software"
- "Add..."
- Copy the example and change the codename to a previous release
  - `deb http://archive.ubuntu.com/ubuntu mantic main`
  - `deb http://archive.ubuntu.com/ubuntu lunar main`

References:
- Code names: https://wiki.ubuntu.com/Releases
- About sources.list: https://wiki.debian.org/SourcesList
- About sources.list ubuntu: https://help.ubuntu.com/community/Repositories?action=show&redirect=AddingRepositoriesHowto
- Search packages: https://packages.ubuntu.com/
