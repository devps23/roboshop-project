data "aws_ami" "ami" {
  most_recent      = true
  name_regex       = "RHEL-9-DevOps-Practice"
  owners           = [973714476881]
}

# centos ami
# ami-0b4f379183e5706b9
# Owner: 973714476881

# OwnerAlias: –
# Platform: –
# Architecture: x86_64
#
# Publish date: 2024-06-05
# Root device type: ebs
# Virtualization: hvm
# ENA enabled: Yes