---
title: kubes init
reference: true
---

## Usage

    kubes init --repo=REPO a, --app=APP

## Description

Init project


## Options

```
a, --app=APP                     # Docker repo name. Example: web. Generates .kubes/APP/resources folder
y, [--force]                     # Bypass overwrite are you sure prompt for existing files
t, [--type=TYPE]                 # Type: dsl or yaml
                                 # Default: yaml
    --repo=REPO                  # Docker repo name. Example: user/repo. Configures .kubes/config.rb
n, [--namespace=NAMESPACE]       # Namespace to use, defaults to APP-ENV. IE: demo-dev
    [--verbose], [--no-verbose]  
    [--noop], [--no-noop]        
```

