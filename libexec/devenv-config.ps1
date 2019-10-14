# Usage: devenv config [options]
# Summary: Devenv configuration management
# Help:
# devenv config --apply --name <config-name>
# devenv config --update --name <config-name>
# devenv config --list

## todo check if the config repo is good

. "$( scoop prefix scoop )\lib\getopt.ps1"

$opt, $args, $err = getopt $args "" @('apply', 'update', 'list', 'url=', 'name=', 'branch=')

$scoopTarget = $env:SCOOP

function is_conf_bucket($bucket) {return Test-Path -path "$scoopTarget\buckets\$bucket\config"}

if ($err) {
    LogMessage "devenv config: $err"; exit 1
} elseif ($opt.apply){
    if (!$opt.ContainsKey('name')) {
        Write-Host "devenv config --apply: --name is mandatory"; exit 1
    }
    if (!(scoop bucket list).Contains($opt.name) -or !(is_conf_bucket $opt.name)) {
        Write-Host "<bucket> do not contains configuration"; exit 1
    }
    #load API
    . "$PSScriptRoot\..\API\configAPI.ps1"
    . "$scoopTarget\buckets\$( $opt.name )\config\apply.ps1" "install"
}
elseif ($opt.update) {
    if (!$opt.ContainsKey('name'))
    {
        Write-Host "devenv config --update: --name is mandatory"; exit 1
    }
    #load API
    . "$PSScriptRoot\..\API\configAPI.ps1"
    . "$scoopTarget\buckets\$( $opt.name )\config\apply.ps1" "update"
}
elseif ($opt.list){
    Write-Host "List all buckets configuration by names: "
     foreach ($bucket in scoop bucket list)
     {
         if (is_conf_bucket $bucket) {
             Write-Host $bucket
         }
     }
} else {
    . "$PSScriptRoot\..\libexec\devenv-help.ps1" $cmd
}

