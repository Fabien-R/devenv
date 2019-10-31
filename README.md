# devenv

## The purpose

After installing the devenv application (idea and original source code from https://github.com/stephanec1/devenv-bucket.git) with scoop packet manager, 
you can upload and apply different profils/configurations to your applications (aka the devenv).

```
devenv config apply [-Name <String>]
```

## Usage

### Add a configuration

```
devenv config add [-Name <String>] [-url <String>] 
```

### Apply a configuration

```
devenv config apply [-Name <String>]
```

### UnApply a configuration

```
devenv config unapply [-Name <String>]
```

### Update and apply a configuration
```
devenv config update [-Name <String>] [--force]*
```
The force will erase your own modification
If you want to keep your modification don't use --force and rebase your configuration by yourself

### Update your own configuration
Every configurations are located in ```<devenvDir>/persist/devenv/config```
All your configuration are coming from git so you can easily update it locally and remotely

configuration example:
```
{
    "buckets": [
        "extras@https://github.com/lukesampson/scoop-extras",
        "java@https://github.com/scoopinstaller/java"
    ],
    "apps": [
        "extras/winscp",
        "maven",
        "java/openjdk11",
    ],
}

```
this will install a scoop bucket from github
install the list of apps and apply configurations extras

### Uninstall
Just run 
```
devenv uninstall
```
