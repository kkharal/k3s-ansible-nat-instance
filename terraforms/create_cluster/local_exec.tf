resource "local_file" "ansible_inventory" {
filename = "../../ansibles/k3s/inventory/my-cluster/hosts.ini"

content = templatefile("templates/inventory.tmpl", {
    master   = data.terraform_remote_state.env.outputs.master_ip
    worker   = data.terraform_remote_state.env.outputs.worker_ip
    vpn = data.terraform_remote_state.env.outputs.vpn_ip
})
provisioner "local-exec" {command = "cd ../../ansibles/k3s && ansible-playbook -i inventory/my-cluster/hosts.ini -v site.yml"}
}


