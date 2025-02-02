variable "environment" {  
    
}

variable "project" {
    default = "expense"
  
}

variable "instance" {
    default = ["mysql", "backend", "frontend"]
  
}

variable "zone_id" {
    default = "Z0803459PJ1N35XG9RQT"
  
}

variable "domain_name" {
    default = "psrexpense.store"
  
}

variable "common" {
    type = map(string)
    default = {
        Project = "expense"
        Environment = "dev"
    }
  
}