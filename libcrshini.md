## The document of libcrshini
libcrishini is a library that can be used by loading it with a shell script.
This library uses various values by passing them to functions in several ways.

## Usage

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

Set the environment variable `_crshini_get_linemode` to get line number where the value is set instead of the value.

#### _crshini_set
The `_crshini_set` function is used to set section , param and value. It is mainly used in the following syntax.  
You can create new parameters or rewrite existing ones.  

```bash
_crshini_set file section param value
cat file | _crshini_stdin=true _crshini_set section param value
```
None of the arguments can be omitted.

#### _crshini_merge
This function is used to merge two INI files.It combines the file specified by the argument with the standard input file.
The value of _crshini_stdin is ignored and always reads standard input.  

```bash
cat input_file | _crshini_merge file [section]
```
You can also limit the sections to be merged.

#### _crshini_del
The `_crshini_del` function is used to delete section or param.  

```bash
_crshini_del file section [param1] [param2] ...
cat file | _crshini_stdin=true _crshini_del section [param1] [param2] ...
```
If no parameter is specified, all sections will be deleted. You can also specify multiple parameters.

### library variables
You can change the behavior of the function with environment variables.

#### Input data from stdin instead of specifying a file
Set `_crshini_stdin` to `true`

#### Output debug message
Set `_crshini_debug` to `true`

#### Specify the output destination
Set `_crshini_output` to the path. Set `-` to output to standard output.

#### Specify the path of temporary file
Set `temporary file` to the path. Default is `/tmp/libcrshini`.  
Temporary files are used by some functions for a variety of purposes.

#### Get line number
Set `_crshini_get_linemode` to `true`
This variable only works in some modes of `_crshini_get`. Otherwise it will be ignored.


## Exapmle
The crshini command is also developed in this project as an implementation example of libcrshini.
