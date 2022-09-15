module control_plane_server {
    source = "./modules/ec2"
    server_type = "master"
}

module node_server_1 {
    source = "./modules/ec2"
    server_type = "node1"
}

module node_server_2 {
    source = "./modules/ec2"
    server_type = "node2"
}
