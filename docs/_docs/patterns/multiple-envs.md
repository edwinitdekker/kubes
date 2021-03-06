---
title: Multiple Environments with Layering
nav_text: Multiple Environments
categories: patterns
---

You can use Kubes to easily create multiple environments with the same YAML configs.  This is thanks to [Kubes Layering]({% link _docs/layering.md %}). We'll walk through an example to help understand how it works.

## Creating Multiple Environments

To create multiple environments like dev and prod just change KUBES_ENV. Example:

    KUBES_ENV=dev  kubes deploy
    KUBES_ENV=prod kubes deploy

Different env files will be layered and merged to produce YAML files specific to each environment.

## Project Structure

Here's an example structure, so we can understand how layering works to create multiple environments.

    .kubes/resources/
    ├── base
    │   ├── all.yaml
    │   └── deployment.yaml
    └── web
        ├── deployment
        │   ├── dev.yaml
        │   └── prod.yaml
        ├── deployment.yaml
        └── service.yaml

## Concrete Example

Let's look at a concrete web/deployment.yaml.

Here are the files that get layered when `KUBES_ENV=dev`:

    .kubes/resources/base/all.yaml
    .kubes/resources/base/deployment.yaml
    .kubes/resources/web/deployment.yaml
    .kubes/resources/web/deployment/dev.yaml

And when `KUBES_ENV=prod`:

    .kubes/resources/base/all.yaml
    .kubes/resources/base/deployment.yaml
    .kubes/resources/web/deployment.yaml
    .kubes/resources/web/deployment/prod.yaml

Layering allows us to have common settings that are processed before your main `.kubes/resources/web/deployment.yaml` YAML manifest. And then add **environment** specific YAML files that get merged.

## Variables and Helpers

Additional, you can use variables and helpers to provide environment specific values.
