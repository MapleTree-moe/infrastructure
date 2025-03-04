## Mapletree.moe Infrastructire
This repository will eventually contain all the infrastructure components of
Mapletree.moe as [Terraform][1] objects. For now it is a work in progress.
Please see the TODO list at the bottom of this document for things that have
yet to be converted to terraform.

- [Mapletree.moe Infrastructire](#mapletreemoe-infrastructire)
- [Getting Started](#getting-started)
- [Software used](#software-used)
- [Modules](#modules)
- [Automation](#automation)
- [Commit Messages](#commit-messages)
- [Comments](#comments)
- [Licensing](#licensing)
- [TO-DO](#to-do)

## Getting Started
Make sure you have created a Hashicorp Cloud Account and have been invited to
the Mapletree organization prior to beginning, or you will be unable to interact
with the infrastructure. You can create an HCP account by connecting your GitHub
account for ease of use.

To make changes to the domain records, follow the steps below:

  1. Install all listed dependencies according to your operating system's
  installation methods:
      - pre-commit
      - terraform
      - tflint
      - trivy
      - yamllint
  2. Clone the repository `git clone`
  3. login to hashicorp cloud `terraform login`
  4. make your changes to files
  5. review the planned changes `terraform plan`
  6. commit code to repository and push it to github.
  7. apply the planned changes only after discussion with other administrators
  8. apply with `terraform apply`

## Software used
The infrastructure is managed through the use of [Terraform][1], which is
configured to utilize the [Hashicorp Cloud Platform][2]. Eventually there are
plans to migrate to [OpenTofu][3] and to move away from HCP to something more
independent. Please check the `main.tf` file in the root module for information
on what providers are used in the code.

[Pre-Commit][4] is also used to validate code and run simple checks before
allowing a user to commit to the repository. This includes the use of
[TFLint][5] to ensure code follows a proper format, and the use of [Trivy][6] to
perform static analysis of the terraform code to look for any security issues.
[yamllint][7] is used to check over the very few YAML files in this repository.

## Modules
Where possible code has been separated out into modules. For now, the modules
are provider focused instead of work-unit focused, and are being used more as
a way to keep the repository clean than as actual modules. this may change in
the future.

## Automation
For now this repository is not automated, but that will change in the future,
likely by connecting VCS to the HCP project.

## Commit Messages
Commit Messages are required to comply with the [Conventional Commits][3]
standard.

## Comments
As the configuration is written in YAML, comments should be primarily reserved
for things that are not self evident. Additionally, please make use of `FIXME`
and `TODO` to indicate where effort should be focused in the codebase.

## Licensing
While there's not really anything here that qualifies as software, the repo is
licensed under [UNLICENSE][4] to help support the project and move it higher up
the list of used licenses here on Github.

## TO-DO
* convert to VCS based workflow
* import Cloudflare
* import Vultr
* Additional Discord Servers?
* Convert to using OpenTofu?
* Remove Dependency on HCP?
* make sure documentation is consistent
* set up terraform docs correctly

[1]: https://www.terraform.io
[2]: https://www.hashicorp.com/en/cloud
[3]: https://opentofu.org
[4]: https://pre-commit.com
[5]: https://github.com/terraform-linters/tflint
[6]: https://github.com/aquasecurity/trivy
[7]: https://yamllint.readthedocs.io
[4]: https://www.conventionalcommits.org/en/v1.0.0/
[5]: https://unlicense.org
