module control_plane_server {
    source = "./modules/ec2"
    server_type = "master"
    access_key = var.access_key
    secret_key = var.secret_key
}

module node_server_1 {
    source = "./modules/ec2"
    server_type = "node1"
    access_key = var.access_key
    secret_key = var.secret_key
}

module node_server_2 {
    source = "./modules/ec2"
    server_type = "node2"
    access_key = var.access_key
    secret_key = var.secret_key
}