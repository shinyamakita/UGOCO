variable "price_class" {
    type = string
    description = "CloudFront distribution price class"
    default = "PriceClass_100"

    validation {
        condition = contains(["PriceClass_100", "PriceClass_200", "PriceClass_ALL"], var.price_class)
        error_message = "PriceClass must be one of PriceClass_100, PriceClass_200, or PriceClass_ALL"
    }
}

variable "min_ttl" {
    type = number
    description = "Minimum TTL for cached objects"
    default = 0
}

variable "default_ttl" {
    type = number
    description = "Default TTL for cached objects"
    default = 3600
}

variable "max_ttl" {
    type = number
    description = "Maximum TTL for cached objects"
    default = 86400
}