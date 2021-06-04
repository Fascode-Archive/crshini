## The document of libcrshini
libcrishini is a library that can be used by loading it with a shell script.
This library uses various values by passing them to functions in several ways.

## Basic usage

### Load the library
First, load this library with the source command in some way.  
If you're root, you can easily install it on your system, or you can get the library with curl.

#### Install
If you're arch linux user, you can install it with pacman

```bash
git clone https://github.com/Hayao0819/crshini
cd crshini
makepkg -si
```
If you have root permission , you can this library with make

```bash
git clone https://github.com/Hayao0819/crshini
cd crshini
sudo make install
```
After install it, write this code to load
```bash
source "/usr/lib/libcrshini"
```


#### With curl
If you want to use this library in portable script, you can load it from Github with curl.
You don't need to install any packages, just include the following code in your shell script.
```bash
curl -sL "https://raw.githubusercontent.com/Hayao0819/crshini/dev/src/libcrshini" > "/tmp/libcrshini"
source "/tmp/libcrshini"
```

### Check library
You can check whether the library was loaded correctly with the following command.
```bash
echo "${_crshini_version}"
```
If the library's functions are available, the library version will be displayed.

### Use library function
As of June 4, 2021, there are four main functions available.

#### _crshini_get
The `_crshini_get` function is used to get information from an ini file.It is mainly used in the following syntax.  
  
The code above specifies the file path.  
```bash
_crshini_get file [section] [param]
cat file | _crshini_stdin=true _crshini_get [section] [param]
```
Specifying sections and parameters is optional.  
If no section is specified, a list of sections will be output.  
If no parameter is specified, a list of parameters will be output.  
  
In the example below, ini is read from standard input by setting _crshini_stdin to true.


