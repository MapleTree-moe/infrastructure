###
### mapletree.moe - infrastructure management
### backblaze b2 terraform module
###

variable "read_write_caps" {
  # standard access token permissions
  type        = set(string)
  description = "Standard read and write capabilities for bucket access on B2"
  default = [
    "deleteFiles",
    "listAllBucketNames",
    "listBuckets",
    "listFiles",
    "readBucketEncryption",
    "readBucketReplications",
    "readBuckets",
    "readFiles",
    "shareFiles",
    "writeBucketEncryption",
    "writeBucketReplications",
    "writeFiles"
  ]
}
