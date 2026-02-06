variable "vm_name"        { 
    type = string
}
variable "node_name"    { 
    type = string 
}
variable "vm_id"          {
    type = number
}
variable "template_id"    { 
    type = number 
}
variable "datastore_id"   { 
    type = string 
}
variable "ipv4_address"   { 
    type = string 
}
variable "cidr"           { 
    type = string 
}
variable "gateway"        { 
    type = string 
}
variable "network_bridge" { 
    type = string 
}
variable "vlan_id"        { 
    type = number 
    default = null 
}
variable "cpu_cores"      { 
    type = number
    default = 1 
}
variable "memory"         { 
    type = number
    default = 1024 
}
variable "disk_size"      { 
    type = number
    default = 10 
}